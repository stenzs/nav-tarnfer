create or replace function airspace_area(arpname_filter character varying, geometry_filter character varying,
                              as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                character,
                nm                  codeairspacedesignatortype,
                nl                  textnametype,
                nl_ru               character varying,
                tp                  character varying,
                lowerlimit          character,
                lowerlimitreference character,
                lowerlimit_ft       numeric,
                upperlimit          character,
                upperlimitreference character,
                upperlimit_ft       numeric,
                he                  character varying,
                class               codeairspaceclassificationtype,
                beginposition       datetype,
                rdc_name            character varying,
                fir_name            character varying,
                fir_name_ru         character varying,
                geom                character varying,
                cs_tf_ru            character varying,
                cs_tf               character varying,
                xlbl                double precision,
                ylbl                double precision,
                proj                character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter)
select identifier,
       "type",
       nm,
       nl,
       nl_ru,
       tp,
       lowerlimit,
       lowerlimitreference,
       lowerlimit_ft,
       upperlimit,
       upperlimitreference,
       upperlimit_ft,
       he,
       class,
       beginposition,
       rdc_name,
       fir_name,
       fir_name_ru,
       case
           when as_wkt::bool = FALSE
               THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))::varchar
           ELSE st_asewkt(
                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))) END as geom,
       replace(cs_tf_ru::text, '`'::text, ''::text) as cs_tf_ru,
       replace(cs_tf::text, '`'::text, ''::text) as cs_tf,
       ST_X(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry)),
                         '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)))                  as xlbl,
       ST_Y(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry)),
                         '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)))                  as ylbl,
       (Select proj from pre_arp) ::text                                                                      as proj
from airspace_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  and ST_Intersects(geom, geometry_filter::geometry)
  AND "type" in ('CTA', 'CTR', 'CTC', 'TMA', 'UAA');
$$;

create or replace function airspace_line_area(arpname_filter character varying, geometry_filter character varying,
                                   scale_filter integer, as_wkt character varying DEFAULT true,
                                   date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                character,
                nm                  codeairspacedesignatortype,
                nl                  textnametype,
                nl_ru               character varying,
                tp                  character varying,
                lowerlimit          character,
                lowerlimitreference character,
                lowerlimit_ft       numeric,
                upperlimit          character,
                upperlimitreference character,
                upperlimit_ft       numeric,
                he                  character varying,
                class               codeairspaceclassificationtype,
                beginposition       datetype,
                geom                character varying,
                proj                text
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter),
     main_sel as (
         SELECT identifier,
                "type",
                nm,
                nl,
                nl_ru,
                tp,
                lowerlimit,
                lowerlimitreference,
                lowerlimit_ft,
                upperlimit,
                upperlimitreference,
                upperlimit_ft,
                he_line                          as he,
                "class",
                beginposition,
                (case
                     when ST_GeometryType(ST_Intersection
                         (ST_ExteriorRing(
                                  (case
                                       when ST_GeometryType(ST_Intersection(
                                               st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                            (Select proj from pre_arp)),
                                               st_transform(geometry_filter::geometry,
                                                            '+proj=longlat +datum=WGS84 +no_defs',
                                                            (Select proj from pre_arp)))) = 'ST_Polygon'
                                           then (SELECT ST_Intersection(
                                                                st_transform(geom,
                                                                             '+proj=longlat +datum=WGS84 +no_defs',
                                                                             (Select proj from pre_arp)),
                                                                st_transform(geometry_filter::geometry,
                                                                             '+proj=longlat +datum=WGS84 +no_defs',
                                                                             (Select proj from pre_arp))))
                                       else (SELECT st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                 (Select proj from pre_arp)))
                                      end)),
                          ST_Buffer(ST_Line_Interpolate_Point(
                                            ST_ExteriorRing(
                                                    (case
                                                         when ST_GeometryType(ST_Intersection(
                                                                 st_transform(geom,
                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                              (Select proj from pre_arp)),
                                                                 st_transform(geometry_filter::geometry,
                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                              (Select proj from pre_arp)))) =
                                                              'ST_Polygon'
                                                             then (SELECT ST_Intersection(
                                                                                  st_transform(geom,
                                                                                               '+proj=longlat +datum=WGS84 +no_defs',
                                                                                               (Select proj from pre_arp)),
                                                                                  st_transform(
                                                                                          geometry_filter::geometry,
                                                                                          '+proj=longlat +datum=WGS84 +no_defs',
                                                                                          (Select proj from pre_arp))))
                                                         else (SELECT st_transform(geom,
                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                   (Select proj from pre_arp)))
                                                        end)),
                                            0.3),
                                    (select (case
                                                 when nl_ru is not null
                                                     then ((2224 + (length(nl_ru) * 556)) / 7) * (scale_filter::int / 100000)
                                                 else (1112 * ('1000000'::int / 500000)) end))
                              ))) = 'ST_LineString'
                         then (
                         Select ST_Intersection(
                                        ST_ExteriorRing(
                                                (case
                                                     when ST_GeometryType(ST_Intersection(
                                                             st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                          (Select proj from pre_arp)),
                                                             st_transform(geometry_filter::geometry,
                                                                          '+proj=longlat +datum=WGS84 +no_defs',
                                                                          (Select proj from pre_arp)))) = 'ST_Polygon'
                                                         then (SELECT ST_Intersection(
                                                                              st_transform(geom,
                                                                                           '+proj=longlat +datum=WGS84 +no_defs',
                                                                                           (Select proj from pre_arp)),
                                                                              st_transform(geometry_filter::geometry,
                                                                                           '+proj=longlat +datum=WGS84 +no_defs',
                                                                                           (Select proj from pre_arp))))
                                                     else (SELECT st_transform(geom,
                                                                               '+proj=longlat +datum=WGS84 +no_defs',
                                                                               (Select proj from pre_arp)))
                                                    end)),
                                        ST_Buffer(ST_Line_Interpolate_Point(
                                                          ST_ExteriorRing(
                                                                  (case
                                                                       when ST_GeometryType(ST_Intersection(
                                                                               st_transform(geom,
                                                                                            '+proj=longlat +datum=WGS84 +no_defs',
                                                                                            (Select proj from pre_arp)),
                                                                               st_transform(geometry_filter::geometry,
                                                                                            '+proj=longlat +datum=WGS84 +no_defs',
                                                                                            (Select proj from pre_arp)))) =
                                                                            'ST_Polygon'
                                                                           then (SELECT ST_Intersection(
                                                                                                st_transform(geom,
                                                                                                             '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                             (Select proj from pre_arp)),
                                                                                                st_transform(
                                                                                                        geometry_filter::geometry,
                                                                                                        '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                        (Select proj from pre_arp))))
                                                                       else (SELECT st_transform(geom,
                                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                 (Select proj from pre_arp)))
                                                                      end)),
                                                          0.3),
                                                  (select (case
                                                               when nl_ru is not null
                                                                   then ((2224 + (length(nl_ru) * 556)) / 7) * (scale_filter::int / 100000)
                                                               else (1112 * ('1000000'::int / 500000)) end)))))
                     else (Select ST_ExteriorRing(
                                          st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                       (Select proj from pre_arp))))
                    end)                         as geom,
                (Select proj from pre_arp)::text as proj
         FROM airspace_AREA
         WHERE beginposition <= ((select * from set_date_filter(date_filter)))
           ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
           AND st_intersects(geom, geometry_filter::geometry)
           AND "type" in ('CTA', 'CTR', 'TMA', 'CTC'))
select identifier,
       "type",
       nm,
       nl,
       nl_ru,
       tp,
       lowerlimit,
       lowerlimitreference,
       lowerlimit_ft,
       upperlimit,
       upperlimitreference,
       upperlimit_ft,
       he,
       "class",
       beginposition,
       case
           when as_wkt::bool = FALSE then geom::varchar
           ELSE st_asewkt(geom) end as geom,
       proj
from main_sel;
$$;

create or replace function designatedpoint_area(arpname_filter character varying, geometry_filter character varying, tp2_filter character varying, internationaluse_filter character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator varchar, type varchar, tp2 varchar, tp1 varchar, name text, latitude character varying, longitude character varying, srid character varying, beginposition datetype, geom character varying, xlbl double precision, ylbl double precision, proj character varying)
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
        and name = arpname_filter),
related_routesegment as (
    select identifier, ps, pe
    from routesegment_AREA
    WHERE beginposition <= ((select * from set_date_filter()))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
        AND ST_Intersects(geom, geometry_filter::geometry)
        AND internationaluse = internationaluse_filter)
select identifier, designator, type, tp2, tp1, name, latitude, longitude, srid, beginposition,
    case when as_wkt::bool = FALSE
        then st_transform(geom,'+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))::varchar
        else st_asewkt(st_transform(geom,'+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))) end as geom,
    ST_X(ST_Centroid(ST_GeomFromewkt(
       st_transform(geom,'+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))))) + 1000  as xlbl,
    ST_Y(ST_Centroid(ST_GeomFromewkt(
       st_transform(geom,'+proj=longlat +datum=WGS84 +no_defs',(Select proj from pre_arp))))) + 1000  as ylbl,
    (Select proj from pre_arp) ::text as proj
from designatedpoint_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
    ---AND ST_Intersects(geom, geometry_filter::geometry)
    AND "type" not like '%TERMINAL%'
    AND tp1 is not NULL
    AND tp2 = tp2_filter
    AND (designator in (select ps from related_routesegment) or designator in (select pe from related_routesegment))
group by identifier, designator, type, tp2, tp1, name, latitude, longitude, srid, beginposition, geom
$$;





create or replace function exit_routes_area(arpname_filter character varying, geometry_filter character varying,
                                 scale_filter integer, as_wkt character varying DEFAULT true,
                                 date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier id,
                designator character varying,
                geom       character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter),
     main_sel as (
         select identifier,
                CASE
                    WHEN NOT st_intersects(
                            st_transform(point_geom_s, '+proj=longlat +datum=WGS84 +no_defs',
                                         (Select proj from pre_arp)),
                            st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                         (Select proj from pre_arp)))
                        THEN s_designator
                    ELSE e_designator
                    END         designator,
                (ST_Dump((ST_Intersection(
                        ST_ExteriorRing(ST_Buffer(
                                st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                             (Select proj from pre_arp)),
                                -400 * (scale_filter::int / 100000))),
                        st_geomfromewkt(ST_Buffer((
                                                      st_dump(ST_Intersection(
                                                              ST_ExteriorRing(ST_Buffer(
                                                                      st_transform(geometry_filter::geometry,
                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                   (Select proj from pre_arp)),
                                                                      -400 * (scale_filter::int / 100000))),
                                                              st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                           (Select proj from pre_arp))))
                                                      ).geom, (scale_filter::int / 200))))
                    ))).geom as geom
         from exit_routes_AREA
         where beginposition <= ((select * from set_date_filter(date_filter)))
           ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
           AND st_intersects(
                 st_transform(exit_routes_AREA.geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)),
                 st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                              (Select proj from pre_arp)))
           AND (
                 NOT st_intersects(
                         st_transform(point_geom_s, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)),
                         st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                      (Select proj from pre_arp)))
                 OR NOT st_intersects(
                     st_transform(point_geom_e, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)),
                     st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                  (Select proj from pre_arp)))))
SELECT identifier,
       designator,
       case
           when as_wkt::bool = False then geom::varchar
           else st_asewkt(geom) end as geom
from main_sel
$$;

create or replace function fir_area(arpname_filter character varying, geometry_filter character varying,
                         chart_type_filter character varying, as_wkt character varying DEFAULT true,
                         date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                character,
                nm                  codeairspacedesignatortype,
                nl                  textnametype,
                nl_ru               character varying,
                upperlimit          character,
                upperlimitreference character,
                upperlimit_ft       numeric,
                lowerlimit          character,
                lowerlimitreference character,
                lowerlimit_ft       numeric,
                he                  character varying,
                class               codeairspaceclassificationtype,
                beginposition       datetype,
                rw                  text,
                "time"              character varying,
                time_ru             character varying,
                geom                character varying,
                cs_tf_ru            character varying,
                cs_tf               character varying,
                xlbl                double precision,
                ylbl                double precision,
                proj                text,
                rdc_name            character varying,
                fir_name            character varying,
                fir_name_ru         character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= (select * from set_date_filter(date_filter))
      and name = arpname_filter)
SELECT identifier,
       type,
       nm,
       nl,
       nl_ru,
       upperlimit,
       upperlimitreference,
       upperlimit_ft,
       lowerlimit,
       lowerlimitreference,
       lowerlimit_ft,
       he,
       class,
       beginposition,
       rw,
       "time",
       time_ru,
       case
           when as_wkt::bool = FALSE
               then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))::varchar
           ELSE st_asewkt(
                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))) END as geom,
       replace(cs_tf_ru::text, '`'::text, ''::text) as cs_tf_ru,
       replace(cs_tf::text, '`'::text, ''::text) as cs_tf,
       ST_X(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry))
           , '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)))                              as xlbl,
       ST_Y(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry)),
                         '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)))                  as ylbl,
       (Select proj from pre_arp) ::text                                                                      as proj,
       rdc_name,
       fir_name,
       fir_name_ru
FROM fir_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  and st_intersects(geom, geometry_filter::geometry)
  and (case
           when (chart_type_filter = 'AREA_VFR')
               then ((nl_ru like 'ПИO%' or nl_ru like '%НВП%' or nl_ru like '%ДИСП%') and
                     "type" in ('FIR', 'KDP', 'MDP', 'SECTOR'))
           else ((nl_ru not like '%ПИО%' and nl_ru not like '%НВП%' and nl_ru not like '%ДИСП%')
               and ("type" in ('SECTOR'))) end)
  and nl_ru not like '%ВНЕТР%';
$$;

create or replace function fir_line_area(arpname_filter character varying, geometry_filter character varying,
                              chart_type_filter character varying, as_wkt character varying DEFAULT true,
                              date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier    id,
                type          character,
                nm            codeairspacedesignatortype,
                nl            textnametype,
                nl_ru         character varying,
                beginposition datetype,
                geom          character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter)
SELECT identifier,
       type,
       nm,
       nl,
       nl_ru,
       beginposition,
       case
           when as_wkt::bool = FALSE
               then st_transform((SELECT ST_ExteriorRing(geom)), '+proj=longlat +datum=WGS84 +no_defs',
                                 (Select proj from pre_arp))::varchar
           ELSE st_asewkt(st_transform((SELECT ST_ExteriorRing(geom)), '+proj=longlat +datum=WGS84 +no_defs',
                                       (Select proj from pre_arp))) END as geom
FROM fir_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  and st_intersects(geom, geometry_filter::geometry)
  and (case
           when (chart_type_filter = 'AREA_VFR')
               then ((nl_ru like 'ПИO%' or nl_ru like '%НВП%' or nl_ru like '%ДИСП%') and
                     "type" in ('FIR', 'KDP', 'MDP', 'SECTOR'))
           else ((nl_ru not like '%ПИО%' and nl_ru not like '%НВП%' and nl_ru not like '%ДИСП%')
               and ("type" in ('FIR', 'RDC', 'SECTOR'))) end)
  and nl_ru not like '%ВНЕТР%';
$$;

create or replace function fir_line_lbl_area(arpname_filter character varying, geometry_filter character varying,
                                  chart_type_filter character varying, scale_filter integer,
                                  as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier    id,
                type          character,
                nm            codeairspacedesignatortype,
                nl            textnametype,
                nl_ru         character varying,
                beginposition datetype,
                geom          character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter),
     main_sel as (
         SELECT identifier,
                type,
                nm,
                nl,
                nl_ru,
                beginposition,
                (case
                     when ST_GeometryType(
                                  ST_Intersection(
                                          ST_ExteriorRing(
                                                  (case
                                                       when ST_GeometryType(ST_Intersection(
                                                               st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                            (Select proj from pre_arp)),
                                                               st_transform(geometry_filter::geometry,
                                                                            '+proj=longlat +datum=WGS84 +no_defs',
                                                                            (Select proj from pre_arp)))) = 'ST_Polygon'
                                                           then (SELECT ST_Intersection(
                                                                                st_transform(geom,
                                                                                             '+proj=longlat +datum=WGS84 +no_defs',
                                                                                             (Select proj from pre_arp)),
                                                                                st_transform(geometry_filter::geometry,
                                                                                             '+proj=longlat +datum=WGS84 +no_defs',
                                                                                             (Select proj from pre_arp))))
                                                       else (SELECT st_transform(geom,
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 (Select proj from pre_arp)))
                                                      end)),
                                          ST_Buffer(
                                                  ST_Line_Interpolate_Point(
                                                          ST_ExteriorRing(
                                                                  (case
                                                                       when ST_GeometryType(ST_Intersection(
                                                                               st_transform(geom,
                                                                                            '+proj=longlat +datum=WGS84 +no_defs',
                                                                                            (Select proj from pre_arp)),
                                                                               st_transform(geometry_filter::geometry,
                                                                                            '+proj=longlat +datum=WGS84 +no_defs',
                                                                                            (Select proj from pre_arp)))) =
                                                                            'ST_Polygon'
                                                                           then (SELECT ST_Intersection(
                                                                                                st_transform(geom,
                                                                                                             '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                             (Select proj from pre_arp)),
                                                                                                st_transform(
                                                                                                        geometry_filter::geometry,
                                                                                                        '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                        (Select proj from pre_arp))))
                                                                       else (SELECT st_transform(geom,
                                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                 (Select proj from pre_arp)))
                                                                      end)),
                                                          0.3),
                                                  (select (case
                                                               when nl_ru is not null
                                                                   then ((2224 + (length(nl_ru) * 556)) / 7) * (scale_filter::int / 100000)
                                                               else (1112 * ('1000000'::int / 500000)) end)))))
                         = 'ST_LineString'
                         then (
                         Select ST_Intersection(
                                        ST_ExteriorRing(
                                                (case
                                                     when ST_GeometryType(ST_Intersection(
                                                             st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                          (Select proj from pre_arp)),
                                                             st_transform(geometry_filter::geometry,
                                                                          '+proj=longlat +datum=WGS84 +no_defs',
                                                                          (Select proj from pre_arp)))) = 'ST_Polygon'
                                                         then (SELECT ST_Intersection(
                                                                              st_transform(geom,
                                                                                           '+proj=longlat +datum=WGS84 +no_defs',
                                                                                           (Select proj from pre_arp)),
                                                                              st_transform(geometry_filter::geometry,
                                                                                           '+proj=longlat +datum=WGS84 +no_defs',
                                                                                           (Select proj from pre_arp))))
                                                     else (SELECT st_transform(geom,
                                                                               '+proj=longlat +datum=WGS84 +no_defs',
                                                                               (Select proj from pre_arp)))
                                                    end)),
                                        ST_Buffer(
                                                ST_Line_Interpolate_Point(
                                                        ST_ExteriorRing(
                                                                (case
                                                                     when ST_GeometryType(ST_Intersection(
                                                                             st_transform(geom,
                                                                                          '+proj=longlat +datum=WGS84 +no_defs',
                                                                                          (Select proj from pre_arp)),
                                                                             st_transform(geometry_filter::geometry,
                                                                                          '+proj=longlat +datum=WGS84 +no_defs',
                                                                                          (Select proj from pre_arp)))) =
                                                                          'ST_Polygon'
                                                                         then (SELECT ST_Intersection(
                                                                                              st_transform(geom,
                                                                                                           '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                           (Select proj from pre_arp)),
                                                                                              st_transform(
                                                                                                      geometry_filter::geometry,
                                                                                                      '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                      (Select proj from pre_arp))))
                                                                     else (SELECT st_transform(geom,
                                                                                               '+proj=longlat +datum=WGS84 +no_defs',
                                                                                               (Select proj from pre_arp)))
                                                                    end)),
                                                        0.3),
                                                (select (case
                                                             when nl_ru is not null
                                                                 then ((2224 + (length(nl_ru) * 556)) / 7) * (scale_filter::int / 100000)
                                                             else (1112 * ('1000000'::int / 500000)) end)))))
                     else (Select ST_ExteriorRing(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                               (Select proj from pre_arp))))
                    end) as geom
         FROM fir_AREA
         WHERE beginposition <= ((select * from set_date_filter(date_filter)))
           ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
           and st_intersects(geom, geometry_filter::geometry)
           and (case
                    when (chart_type_filter = 'AREA_VFR')
                        then ((nl_ru like 'ПИO%' or nl_ru like '%НВП%' or nl_ru like '%ДИСП%') and
                              "type" in ('FIR', 'KDP', 'MDP', 'SECTOR'))
                    else ((nl_ru not like '%ПИО%' and nl_ru not like '%НВП%' and nl_ru not like '%ДИСП%')
                        and ("type" in ('FIR', 'RDC', 'SECTOR'))) end)
           and nl_ru not like '%ВНЕТР%')
select identifier,
       type,
       nm,
       nl,
       nl_ru,
       beginposition,
       case
           when as_wkt::bool = False then geom::varchar
           else st_asewkt(geom) end as geom
from main_sel;
$$;

create or replace function holdingpattern_area(arpname_filter character varying, geometry_filter character varying,
                                    as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                codeholdingusagebasetype,
                outboundcourse      integer,
                outboundcoursetype  codecoursebasetype,
                inboundcourse       integer,
                inboundcoursetype   codecoursebasetype,
                turndirection       codedirectionturntype,
                lowerlimit          character varying,
                lowerlimitreference character varying,
                lowerlimit_ft       numeric,
                upperlimit          character varying,
                upperlimitreference character varying,
                upperlimit_ft       numeric,
                he                  character varying,
                duration            character varying,
                speedlimit          integer,
                speed_uom           character varying,
                fix_name            character varying,
                length              character varying,
                beginposition       datetype,
                proj_arp            text,
                xlbl                double precision,
                ylbl                double precision,
                geom                character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter)
SELECT identifier,
       type,
       outboundcourse,
       outboundcoursetype,
       inboundcourse,
       inboundcoursetype,
       turndirection,
       lowerlimit,
       lowerlimitreference,
       lowerlimit_ft,
       upperlimit,
       upperlimitreference,
       upperlimit_ft,
       he,
       duration,
       speedlimit,
       speed_uom,
       fix_name,
       length,
       beginposition,
       (Select proj from pre_arp)::text                                 as proj_arp,
       ST_X(ST_Centroid(ST_MakePolygon(st_geomfromewkt(
               st_transform(ST_ForceClosed(geom), '+proj=longlat +datum=WGS84 +no_defs',
                            (Select proj from pre_arp))))))             as xlbl,
       ST_Y(ST_Centroid(ST_MakePolygon(st_geomfromewkt(
               st_transform(ST_ForceClosed(geom), '+proj=longlat +datum=WGS84 +no_defs',
                            (Select proj from pre_arp))))))             as ylbl,
       case
           when as_wkt::bool = FALSE
               then st_transform(ST_ForceClosed(geom), '+proj=longlat +datum=WGS84 +no_defs',
                                 (Select proj from pre_arp))::varchar
           ELSE st_asewkt(st_transform(ST_ForceClosed(geom), '+proj=longlat +datum=WGS84 +no_defs',
                                       (Select proj from pre_arp))) END as geom
FROM holdingpattern_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  AND st_intersects(ST_ForceClosed(geom), geometry_filter::geometry);
$$;

create or replace function navaid_area(arpname_filter character varying, geometry_filter character varying,
                            as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier        id,
                designator        codenavaiddesignatortype,
                name              textnametype,
                type              character varying,
                elevation         character varying,
                frequency         character varying,
                magneticvariation character varying,
                latitude          character varying,
                longitude         character varying,
                srid              character varying,
                present           character varying,
                beginposition     datetype,
                xlbl              double precision,
                ylbl              double precision,
                proj              character varying,
                geom              character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter)
SELECT identifier,
       designator,
       name,
       type,
       elevation,
       frequency,
       magneticvariation,
       latitude,
       longitude,
       srid,
       present,
       beginposition,
       ST_X(ST_Centroid(ST_GeomFromewkt(
               st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))))) + 1000       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(
               st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))))) +
       1000                                                                                                          as ylbl,
       (Select proj from pre_arp) ::text                                                                             as proj,
       case
           when as_wkt::bool = FALSE
               then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                       (Select proj from pre_arp))) END                                              as geom
FROM navaid_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  AND st_intersects(geom, geometry_filter::geometry)
  AND type in ('DME', 'NDB', 'TACAN', 'VOR', 'VOR_DME', 'VORTAC')
  AND name !~ '[0-9]'
  AND name NOT LIKE '%LMM%'
  AND name NOT LIKE '%LOM%'
  AND type NOT IN ('ILS', 'ILS_DME');
$$;

create or replace function obs_area(arpname_filter character varying, geometry_filter character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier integer,
     ab varchar,
     ta varchar,
     le character varying,
     type_obs codeverticalstructuretype,
     v integer,
     geom character varying)
    immutable
    language sql
----valdistanceverticalbasetype
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter),

     max_obs as (select max(case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)  max_ta,
                        max(identifier) id from obs_area
     where ST_Intersects(geom, geometry_filter::geometry) and ta is not null)
select identifier,
       ab,
       ta,
       le,
       type_obs,
       (case when (case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)::numeric > 100 and
                  (case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)::numeric not in (select max_ta::int from max_obs ) then 1
           when (case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)::numeric in (select max_ta::int from max_obs) then 3
           else 0 end)                                                                   as v,
       case
           when as_wkt::bool = FALSE
               then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))::varchar
           else st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                       (Select proj from pre_arp))) end                                              as geom
from obs_area

WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  AND ST_Intersects(geom, geometry_filter::geometry);
$$;

create or replace function procedure_area(geometry_filter character varying, transitionid_filter character varying,
                               as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier             id,
                codingstandard         codeprocedurecodingstandardtype,
                name                   character,
                rnav                   codeyesnobasetype,
                designator             character,
                transitionid           codedesignatedpointdesignatortype[],
                transitiontype         character varying,
                approachprefix         character varying,
                approachtype           character varying,
                multipleidentification character varying,
                coptertrack            valbearingtype,
                circlingidentification codeupperalphatype,
                additionalequipment    character varying,
                channelgnss            character varying,
                waasreliable           codeyesnotype,
                uuidairportheliport    id,
                nameairportheliport    character,
                geom                   character varying,
                beginposition          datetype
            )
    immutable
    language sql
as
$$
select identifier,
       codingstandard,
       "name",
       rnav,
       designator,
       transitionId,
       transitionType,
       approachprefix,
       approachtype,
       multipleidentification,
       copterTrack,
       circlingIdentification,
       additionalEquipment,
       channelGNSS,
       WAASReliable,
       uuidAirportHeliport,
       nameAirportHeliport,
       case
           when as_wkt::bool = False then geom::varchar
           else st_asewkt(geom) end as geom,
       beginPosition
from procedure_AREA
WHERE (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)
  and beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  and ST_Intersects(geom, geometry_filter::geometry);
$$;

create or replace function restricted_areas_area(arpname_filter character varying, geometry_filter character varying,
                                      as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                character,
                nm                  codeairspacedesignatortype,
                upperlimit          character,
                lowerlimit          character,
                lowerlimitreference character,
                upperlimitreference character,
                lowerlimit_ft       numeric,
                upperlimit_ft       numeric,
                he                  character varying,
                beginposition       datetype,
                rw                  character varying,
                geom                character varying,
                xlbl                double precision,
                ylbl                double precision,
                proj                text
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter)
select identifier,
       type,
       nm,
       upperlimit,
       lowerlimit,
       lowerlimitreference,
       upperlimitreference,
       lowerlimit_ft,
       upperlimit_ft,
       he,
       beginposition,
       rw,
       case
           when as_wkt::bool = FALSE
               then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))::varchar
           ELSE st_asewkt(
                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))) end as geom,
       ST_X(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry)),
                         '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)))                  as xlbl,
       ST_Y(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry)),
                         '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)))                  as ylbl,
       (Select proj from pre_arp)::text                                                                       as proj
FROM airspace_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  AND ST_Intersects(geom, geometry_filter::geometry)
  and type in ('DRA', 'PRA', 'RSA', 'PROHIBITED', 'RESTRICTED', 'DANGEROUS');
$$;

create or replace function routesegment_area(arpname_filter character varying, geometry_filter character varying,
                                  scale_filter integer, internationaluse_filter character varying,
                                  as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier    id,
                beginposition datetype,
                nm            textdesignatortype,
                mta           valbearingtype,
                rmta          valbearingtype,
                wd            character varying,
                lb            valdistancebasetype,
                lb_unit       uomdistancetype,
                he            character varying,
                ps            character varying,
                pe            character varying,
                country       character varying,
                sogl          integer,
                sizetra       numeric,
                sn            integer,
                proj          character varying,
                wkt           character varying,
                geom          character varying,
                aip           character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter)))
      ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
      and name = arpname_filter),
     main_sel as (
         select identifier,
                beginposition,
                nm,
                mta,
                rmta,
                wd,
                lb,
                lb_unit,
                he,
                ps,
                pe,
                country,
                sogl,
                (CASE
                     WHEN st_length(st_intersection(geom, st_transform(ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                              (Select proj from pre_arp)),
                                                                                 -2000),
                                                                       (Select proj from pre_arp), 4326))) <=
                          (0.15 * scale_filter::int / 1000000)
                         THEN 2.1
                     when (0.15 * scale_filter::int / 1000000) < st_length(st_intersection(geom, st_transform(ST_Buffer(
                                                                                                                      st_transform(
                                                                                                                              geometry_filter::geometry,
                                                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                              (Select proj from pre_arp)),
                                                                                                                      -2000),
                                                                                                              (Select proj from pre_arp),
                                                                                                              4326)))
                         and
                          st_length(st_intersection(geom, st_transform(ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                              (Select proj from pre_arp)),
                                                                                 -2000),
                                                                       (Select proj from pre_arp), 4326))) <=
                          (0.3 * scale_filter::int / 1000000)
                         then 2.1
                     when st_length(st_intersection(geom, st_transform(ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                              (Select proj from pre_arp)),
                                                                                 -2000),
                                                                       (Select proj from pre_arp), 4326))) >
                          (0.3 * scale_filter::int / 1000000)
                         then 2.4 end)
                                                 as sizetra,
                (CASE
                     WHEN st_length(st_intersection(geom, st_transform(ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                              (Select proj from pre_arp)),
                                                                                 -2000),
                                                                       (Select proj from pre_arp), 4326))) <=
                          (0.15 * scale_filter::int / 1000000)
                         THEN 1
                     when (0.15 * scale_filter::int / 1000000) < st_length(st_intersection(geom, st_transform(ST_Buffer(
                                                                                                                      st_transform(
                                                                                                                              geometry_filter::geometry,
                                                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                              (Select proj from pre_arp)),
                                                                                                                      -2000),
                                                                                                              (Select proj from pre_arp),
                                                                                                              4326)))
                         and
                          st_length(st_intersection(geom, st_transform(ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                              (Select proj from pre_arp)),
                                                                                 -2000),
                                                                       (Select proj from pre_arp), 4326))) <=
                          (0.3 * scale_filter::int / 1000000)
                         THEN 0
                     when st_length(st_intersection(geom, st_transform(ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                                              (Select proj from pre_arp)),
                                                                                 -2000),
                                                                       (Select proj from pre_arp), 4326))) >
                          (0.3 * scale_filter::int / 1000000)
                         then NULL end)
                                                 as sn,
                (Select proj from pre_arp)::text as proj,
                wkt,
                ST_MakeLine(ARRAY
                    [ST_StartPoint(
                            st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))),
                    ST_LineInterpolatePoint((case
                                                 when ST_GeometryType(ST_Intersection(
                                                         st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                      (Select proj from pre_arp)),
                                                         ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                '+proj=longlat +datum=WGS84 +no_defs',
                                                                                (Select proj from pre_arp)),
                                                                   -600 * (scale_filter::int / 100000)))) =
                                                      'ST_LineString'
                                                     then (SELECT ST_Intersection(st_transform(geom,
                                                                                               '+proj=longlat +datum=WGS84 +no_defs',
                                                                                               (Select proj from pre_arp)),
                                                                                  ST_Buffer(st_transform(
                                                                                                    geometry_filter::geometry,
                                                                                                    '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                    (Select proj from pre_arp)),
                                                                                            -600 * (scale_filter::int / 100000))))
                                                 else (SELECT st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                           (Select proj from pre_arp))) end), 0.10),
                    ST_LineInterpolatePoint((case
                                                 when ST_GeometryType(ST_Intersection(
                                                         st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                      (Select proj from pre_arp)),
                                                         ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                '+proj=longlat +datum=WGS84 +no_defs',
                                                                                (Select proj from pre_arp)),
                                                                   -600 * (scale_filter::int / 100000)))) =
                                                      'ST_LineString'
                                                     then (SELECT ST_Intersection(st_transform(geom,
                                                                                               '+proj=longlat +datum=WGS84 +no_defs',
                                                                                               (Select proj from pre_arp)),
                                                                                  ST_Buffer(st_transform(
                                                                                                    geometry_filter::geometry,
                                                                                                    '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                    (Select proj from pre_arp)),
                                                                                            -600 * (scale_filter::int / 100000))))
                                                 else (SELECT st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                           (Select proj from pre_arp))) end), 0.50),
                    ST_LineInterpolatePoint((case
                                                 when ST_GeometryType(ST_Intersection(
                                                         st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                      (Select proj from pre_arp)),
                                                         ST_Buffer(st_transform(geometry_filter::geometry,
                                                                                '+proj=longlat +datum=WGS84 +no_defs',
                                                                                (Select proj from pre_arp)),
                                                                   -600 * (scale_filter::int / 100000)))) =
                                                      'ST_LineString'
                                                     then (SELECT ST_Intersection(st_transform(geom,
                                                                                               '+proj=longlat +datum=WGS84 +no_defs',
                                                                                               (Select proj from pre_arp)),
                                                                                  ST_Buffer(st_transform(
                                                                                                    geometry_filter::geometry,
                                                                                                    '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                    (Select proj from pre_arp)),
                                                                                            -600 * (scale_filter::int / 100000))))
                                                 else (SELECT st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                           (Select proj from pre_arp))) end), 0.90),
                    ST_EndPoint(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp)))])
                                                 as geom,
                'public'                         as aip
         from routesegment_AREA
         WHERE beginposition <= ((select * from set_date_filter(date_filter)))
           ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
           AND ST_Intersects(geom, geometry_filter::geometry)
           AND internationaluse = internationaluse_filter)
select identifier,
       beginposition,
       nm,
       mta,
       rmta,
       wd,
       lb,
       lb_unit,
       he,
       ps,
       pe,
       country,
       sogl,
       sizetra,
       sn,
       proj,
       wkt,
       case
           when as_wkt::bool = False then geom::varchar
           else st_asewkt(geom) end as geom,
       aip
from main_sel;
$$;

create or replace function airportheliport_area(arpname_filter character varying, geometry_filter character varying,
                                     chart_type_filter character varying DEFAULT NULL::character varying,
                                     as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier         id,
                type               character,
                name               character,
                name_ru            character,
                designator         codeairportheliportdesignatortype,
                designatoriata codeiatatype,
                status             character,
                controltype        character,
                privateuse         character,
                elevation          character,
                uom_elevation      uomdistanceverticaltype,
                magneticvariation  character,
                latitude           character,
                longitude          character,
                srid               character,
                city_distance      character varying,
                transitionaltitude character varying,
                transitionlevel    character varying,
                geom               character varying,
                beginposition      datetype,
                fr                 character,
                fr_ru              character,
                proj               character,
                xlbl               double precision,
                ylbl               double precision
            )
    immutable
    language sql
as
$$
WITH main_proj AS (
    -- proj for AREA_VFR 218.709405144351 3445802.9521467
    SELECT proj
    FROM airportheliport_AREA
    WHERE name = arpname_filter
      AND beginposition <= (select * from set_date_filter(date_filter))
)
select identifier,
       type,
       name,
       name_ru,
       designator,
       designatoriata,
       status,
       controltype,
       privateuse,
       elevation,
       uom_elevation,
       magneticvariation,
       latitude,
       longitude,
       srid,
       city_distance,
       transitionaltitude,
       transitionlevel,
       CASE
           WHEN as_wkt::bool = FALSE then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                       (select proj from main_proj))::varchar
           ELSE st_asewkt(
                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (select proj from main_proj))) END  as geom,
       beginposition,
       fr,
       fr_ru,
       (select proj from main_proj),
       ST_X(ST_Centroid(ST_GeomFromewkt(
               st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (select proj from main_proj))))) +
       1000                                                                                                      as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(
               st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (select proj from main_proj))))) + 1000 as ylbl

from airportheliport_AREA
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  and ST_Intersects(geom, geometry_filter::geometry)
  and (chart_type_filter = 'AREA_VFR' or "name" = arpname_filter);
$$;

create or replace function gridmora_area(arpname_filter character varying, scale_filter integer, geometry_filter character varying,
                                         as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                character,
                tp                character,
                lowerlimit          character,
                lowerlimit_ft       numeric,
                beginposition       datetype,
                geom                character varying,
                xlbl                double precision,
                ylbl                double precision,
                proj                text

            )
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      AND name = arpname_filter)
select identifier,
       type,
       tp,
       lowerlimit,
       lowerlimit_ft,
       beginposition,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                       (Select proj FROM pre_arp))::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                       (Select proj FROM pre_arp))) END                                              as geom,
       ST_X(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry)),
                         '+proj=longlat +datum=WGS84 +no_defs',
                         (Select proj FROM pre_arp)))                                                                as xlbl,
       ST_Y(st_transform(ST_Centroid(ST_Intersection(geom::geometry, geometry_filter::geometry)),
                         '+proj=longlat +datum=WGS84 +no_defs',
                         (Select proj FROM pre_arp)))                                                                as ylbl,
       (Select proj FROM pre_arp)::text                                                                              as proj

FROM gridmora_mat
WHERE beginposition <= ((select * FROM set_date_filter(date_filter)))
  AND ST_Intersects(geom, geometry_filter::geometry)
  AND type in (case when scale_filter::integer < '300000'::integer then 'AMA15'
      when scale_filter::integer >= '1000000'::integer then 'AMA1'
      when (scale_filter::integer <= '1000000'::integer and scale_filter::integer >= '300000'::integer) then 'AMA30' end);
$$;
