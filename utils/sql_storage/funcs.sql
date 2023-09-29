create or replace function dd2dms(p_ddecdeg double precision, laltlon character varying) returns character varying
    immutable
    strict
    language plpgsql
as
$$
DECLARE
   v_iDeg INT;
   v_dMin NUMERIC;
BEGIN
    v_iDeg := Trunc(p_dDecDeg)::INT;
    v_dMin := (((Abs(p_dDecDeg) - Abs(v_iDeg)) * 60))::NUMERIC;
    RETURN
        case when p_ddecdeg > 0 THEN
         (case when laltlon::text = 'lon' then LPAD((TRIM(to_char(v_iDeg,'9999')))::text, 3, '0')
        else LPAD((TRIM(to_char(v_iDeg,'9999')))::text, 2, '0') end)
             || ' ' ||
        CASE WHEN v_dMin = 0::FLOAT THEN '00.0' ELSE LPAD(round(v_dMin,1)::text, 4, '0') END
        END;
END;
$$;
-------------
CREATE OR REPLACE FUNCTION set_date_filter (date_filter datetype default NULL)
RETURNS datetype
AS
$func$
select case when date_filter is NULL then
        (select max(validtimebegin) from timeslice)::datetype
    else date_filter::datetype end date_filter;
$func$  LANGUAGE SQL IMMUTABLE;

-----------
CREATE OR REPLACE FUNCTION ST_ForceClosed(geom geometry)
  RETURNS geometry AS
$BODY$BEGIN
  IF ST_IsClosed(geom) THEN
    RETURN geom;
  ELSIF GeometryType(geom) = 'LINESTRING' THEN
    SELECT ST_AddPoint(geom, ST_StartPoint(geom)) INTO geom;
  ELSIF GeometryType(geom) ~ '(MULTI|COLLECTION)' THEN
    -- Recursively deconstruct parts
    WITH parts AS (
      SELECT ST_ForceClosed(gd.geom) AS closed_geom FROM ST_Dump(geom) AS gd
    ) -- Reconstitute parts
    SELECT ST_Collect(closed_geom) INTO geom
    FROM parts;
  END IF;
  IF NOT ST_IsClosed(geom) THEN
    RAISE EXCEPTION 'Could not close geometry';
  END IF;
  RETURN geom;
END;$BODY$ LANGUAGE plpgsql IMMUTABLE COST 42;

---------------
CREATE OR REPLACE FUNCTION geometry_to_wkt (geom varchar)
RETURNS text
AS
$func$
SELECT st_asewkt(ST_Transform(ST_SetSRID(geom::GEOMETRY, 4258), 4326));
$func$  LANGUAGE SQL IMMUTABLE;


--------------
CREATE OR REPLACE FUNCTION center_test (
    geom varchar, geometry_filter character varying, scale_filter integer, proj varchar)
RETURNS geometry
AS
$func$
SELECT st_centroid((ST_Dump((ST_Intersection(
            ST_ExteriorRing(ST_Buffer(
               st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs', proj),
                -400*(scale_filter::int/100000))),
            st_geomfromewkt(ST_Buffer((
               st_dump(ST_Intersection(
                   ST_ExteriorRing(ST_Buffer(
                       st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs', proj),
                        -400*(scale_filter::int/100000))),
                   st_transform(geom::geometry, '+proj=longlat +datum=WGS84 +no_defs', proj)))
               ).geom, (scale_filter::int / 200))))
        ))).geom);
$func$  LANGUAGE SQL IMMUTABLE;


-------------------------
create or replace function array_intersect(a1 varchar[], a2 varchar[]) returns varchar[] as $$
declare
    ret varchar[];
begin
    if a1 is null then
        return a2;
    elseif a2 is null then
        return a1;
    end if;
    select array_agg(e) into ret
    from (
        select unnest(a1)
        intersect
        select unnest(a2)
    ) as dt(e);
    return ret;
end;
$$ language plpgsql;
