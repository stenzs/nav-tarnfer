create or replace function airportheliport_sid_map(arpname_filter character varying,
                                        type_filter character varying DEFAULT NULL::character varying,
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
                geom               character varying,
                beginposition      datetype,
                fr                 character,
                fr_ru              character,
                proj               character,
                xlbl               double precision,
                ylbl               double precision,
                transitionaltitude character varying,
                transitionlevel    character varying
            )
    immutable
    language sql
as
$$
select identifier,
       "type",
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
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END                    as geom,
       beginposition,
       fr,
       fr_ru,
       proj::text                                                                                                 as proj,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       transitionaltitude,
       transitionlevel
FROM airportheliport_mat
WHERE beginposition <= ((select * FROM set_date_filter(date_filter)))
  AND (type_filter IS NULL OR NULLIF(type_filter, '') is NULL OR "type" = any (regexp_split_to_array(type_filter, ',')))
  AND "name" = arpname_filter;
$$;

create or replace function exit_leg_nav_sid_map(arpname_filter character varying, geometry_filter character varying,
                                     scale_filter integer, transitionid_filter character varying,
                                     proceduretype_filter character varying,
                                     procedname_filter character varying DEFAULT NULL::character varying,
                                     as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier             id,
                beginposition          datetype,
                endposition            datetype,
                designator             character varying,
                name                   character varying,
                type                   character varying,
                elevation              character varying,
                frequency              character varying,
                magneticvariation      character varying,
                classndb               character varying,
                zerobearingdirection   character varying,
                typedme                character varying,
                latitude               character varying,
                longitude              character varying,
                srid                   character varying,
                speedlimit             character varying,
                speedreference         character varying,
                duration               character varying,
                distance               character varying,
                distancetype           character varying,
                geom_nav_distance      character varying,
                angle                  valbearingtype,
                angletype              character varying,
                anglepointchoice       integer,
                lowerlimit             character varying,
                lowerlimitreference    codeverticalreferencetype,
                upperlimit             character varying,
                upperlimitreference    codeverticalreferencetype,
                altitudeinterpretation codealtitudeusetype,
                rnav                   character varying,
                nameprocedure          character varying,
                present                character varying,
                legtypearinc           character varying,
                nameairportheliport    character varying,
                startend               integer,
                transitionid           text,
                procedure              character varying,
                xlbl                   double precision,
                ylbl                   double precision,
                geom                   character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select name, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      ---AND (endPosition is NULL OR endPosition > (select * FROM set_date_filter(date_filter)))
      AND name = arpname_filter),
     main_sel as (
         select identifier,
                beginposition,
                endPosition,
                designator,
                exit_leg_nav_mat.name,
                "type",
                elevation,
                frequency,
                magneticVariation,
                classNDB,
                zeroBearingDirection,
                typeDME,
                latitude,
                longitude,
                srid,
                point_geom,
                speedlimit,
                speedreference,
                duration,
                distance,
                distancetype,
                geom_nav_distance,
                angle,
                angletype,
                anglepointchoice,
                lowerlimit,
                lowerlimitreference,
                upperlimit,
                upperlimitreference,
                altitudeinterpretation,
                rnav,
                nameProcedure,
                present,
                legtypearinc,
                nameairportheliport,
                startEnd,
                array_to_string(transitionid, ',')                                                    transitionid,
                procedure,
                proc_geom,
                CASE
                    WHEN geom is not null
                        THEN center_test(geom::varchar, geometry_filter, scale_filter, proj)
                    WHEN proc_geom is not null
                        THEN center_test(proc_geom::varchar, geometry_filter, scale_filter, proj)
                    else st_transform(point_geom, '+proj=longlat +datum=WGS84 +no_defs', proj) end as geom
         FROM exit_leg_nav_mat
                  join pre_arp on pre_arp.name = exit_leg_nav_mat.nameairportheliport
         where beginposition <= ((select * FROM set_date_filter()))
           ---AND (endPosition is NULL OR endPosition > (select * FROM set_date_filter(date_filter)))
           AND ((geom IS NOT NULL AND st_intersects(
                 st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                 ST_Buffer(
                         st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                      (Select proj FROM pre_arp)),
                         -400 * (scale_filter::int / 100000))::geometry)) or (geom IS NULL))
           AND NOT st_intersects(
                 st_transform(point_geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                 ST_Buffer(
                         st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                      (Select proj FROM pre_arp)),
                         -400 * (scale_filter::int / 100000))::geometry)
           AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
             OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)
           AND procedure = any (regexp_split_to_array(proceduretype_filter, ','))
           --  AND distance is not NULL
         GROUP BY identifier, beginposition, endPosition, designator, exit_leg_nav_mat.name, "type", elevation,
                  frequency, magneticVariation,
                  classNDB, zeroBearingDirection, typeDME, latitude, longitude, srid, point_geom, speedlimit,
                  speedreference,
                  duration, distance, distancetype, geom_nav_distance, angle, angletype, anglepointchoice,
                  lowerlimit, lowerlimitreference, upperlimit, upperlimitreference,
                  altitudeinterpretation, rnav, nameProcedure, present, legtypearinc, nameairportheliport, startEnd,
                  proj, geom,
                  transitionId, procedure, proc_geom)
select identifier,
       beginposition,
       endPosition,
       designator,
       name,
       "type",
       elevation,
       frequency,
       magneticVariation,
       classNDB,
       zeroBearingDirection,
       typeDME,
       latitude,
       longitude,
       srid,
       speedlimit,
       speedreference,
       duration,
       distance,
       distancetype,
       geom_nav_distance,
       angle,
       angletype,
       anglepointchoice,
       lowerlimit,
       lowerlimitreference,
       upperlimit,
       upperlimitreference,
       altitudeinterpretation,
       rnav,
       nameProcedure,
       present,
       legtypearinc,
       nameairportheliport,
       startEnd,
       transitionId,
       procedure,
       ST_X(ST_Centroid(ST_GeomFromewkt(geom))) + 1000 as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(geom))) + 1000 as ylbl,
       CASE
           WHEN as_wkt::bool = FALSE THEN geom::varchar
           ELSE st_asewkt(geom) end                    as geom
FROM main_sel;
$$;

create or replace function restricted_areas_sid_map(arpname_filter character varying, geometry_filter character varying,
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
                proj                text,
                sn                  integer
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
       nm,
       upperlimit,
       lowerlimit,
       lowerlimitreference,
       upperlimitreference,
       lowerlimit_ft,
       upperlimit_ft,
       he,
       beginposition,
       status                                                                                                        as rw,
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
       (Select proj FROM pre_arp)::text                                                                              as proj,
       CASE
           WHEN st_intersects(
                   st_transform(geom::geometry, '+proj=longlat +datum=WGS84 +no_defs', (Select proj FROM pre_arp)),
                   ST_ExteriorRing(st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                                (Select proj FROM pre_arp))))
               THEN (CASE
                         WHEN ST_Area(st_transform(ST_Intersection(geom::geometry, geometry_filter::geometry),
                                                   '+proj=longlat +datum=WGS84 +no_defs', (Select proj FROM pre_arp)))
                             < '103598815.11590576'
                             THEN 0 else 0 end)
           else (CASE
                     WHEN ST_Area(st_transform(ST_Intersection(geom::geometry, geometry_filter::geometry),
                                               '+proj=longlat +datum=WGS84 +no_defs', (Select proj FROM pre_arp)))
                         < '28268936.27459984'
                         THEN 0 else 0 end) end                                                                                 sn
FROM airspace_mat
WHERE beginposition <= ((select * FROM set_date_filter(date_filter)))
  AND ST_Intersects(geom, geometry_filter::geometry)
  AND type in ('DRA', 'PRA', 'RSA', 'PROHIBITED', 'RESTRICTED', 'DANGEROUS');
$$;

create or replace function runway_sid_map(arpname_filter character varying,
                               designator_filter character varying DEFAULT NULL::character varying,
                               as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                designator          textdesignatortype,
                type                coderunwaytype,
                length              character varying,
                width               character varying,
                composition         codesurfacecompositionbasetype,
                pavementtypepcn     codepcnpavementtype,
                pavementsubgradepcn codepcnsubgradetype,
                maxtyrepressurepcn  codepcntyrepressuretype,
                evaluationmethodpcn codepcnmethodtype,
                classpcn            valpcntype,
                widthshoulder       character varying,
                uuidairportheliport id,
                nameairportheliport textnametype,
                beginposition       datetype,
                geom                character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select proj, identifier uuid, name
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
SELECT identifier,
       designator,
       "type",
       length,
       width,
       composition,
       pavementTypePCN,
       pavementSubgradePCN,
       maxTyrePressurePCN,
       evaluationMethodPCN,
       classpcn,
       widthShoulder,
       uuidAirportHeliport,
       nameAirportHeliport,
       beginPosition,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END as geom
FROM runway_sid(arpname_filter, date_filter)
         join pre_arp on pre_arp.uuid = uuidAirportHeliport
where nameAirportHeliport = arpname_filter
  AND (designator_filter IS NULL OR NULLIF(designator_filter, '') is NULL
    OR designator = any (regexp_split_to_array(replace(designator_filter, 'RW', ''), ',')));
$$;

create or replace function localizer_sid_map(arpname_filter character varying, geometry_filter character varying,
                                  as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier                id,
                frequency                 character varying,
                magneticbearing           character varying,
                magneticbearingaccuracy   character varying,
                truebearing               character varying,
                declination               character varying,
                truebearingaccuracy       character varying,
                widthcourse               character varying,
                widthcourseaccuracy       character varying,
                backcourseusable          character varying,
                designator                character varying,
                name                      character varying,
                emissionclass             character varying,
                mobile                    character varying,
                magneticvariation         character varying,
                magneticvariationaccuracy character varying,
                datemagneticvariation     character varying,
                flightchecked             character varying,
                uuidairportheliport       id,
                nameairportheliport       character varying,
                beginposition             datetype,
                endposition               datetype,
                geom                      character varying,
                xlbl                      double precision,
                ylbl                      double precision
            )
    immutable
    language sql
as
$$
with arp as (
    ---select identifier uuid,
    select proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter()))
      AND name = arpname_filter)
select loc.identifier,
       loc.frequency,
       loc.magneticbearing::character varying,
       loc.magneticbearingaccuracy::character varying,
       loc.truebearing::character varying,
       loc.declination::character varying,
       loc.truebearingaccuracy::character varying,
       loc.widthcourse::character varying,
       loc.widthcourseaccuracy::character varying,
       loc.backcourseusable::character varying,
       loc.designator::character varying,
       loc.name::character varying,
       loc.emissionclass::character varying,
       loc.mobile::character varying,
       loc.magneticvariation::character varying,
       loc.magneticvariationaccuracy::character varying,
       loc.datemagneticvariation::character varying,
       loc.flightchecked::character varying,
       uuidairportheliport,
       nameairportheliport,
       loc.beginposition,
       loc.endposition,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(loc.geom, '+proj=longlat +datum=WGS84 +no_defs', (
               ---select identifier uuid,
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))::varchar
           ELSE st_asewkt(st_transform(loc.geom, '+proj=longlat +datum=WGS84 +no_defs', (
               ---select identifier uuid,
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))) END  as geom,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(loc.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           ---select identifier uuid,
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(loc.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           ---select identifier uuid,
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as ylbl

FROM localizer_sid loc
     ---join arp on arp.uuid = loc.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND ST_Intersects(geom, geometry_filter::geometry)
GROUP BY loc.identifier,
         loc.frequency,
         loc.magneticbearing,
         loc.magneticbearingaccuracy,
         loc.truebearing,
         loc.declination,
         loc.truebearingaccuracy,
         loc.widthcourse,
         loc.widthcourseaccuracy,
         loc.backcourseusable,
         loc.designator,
         loc.name,
         loc.emissionclass,
         loc.mobile,
         loc.magneticvariation,
         loc.magneticvariationaccuracy,
         loc.datemagneticvariation,
         loc.flightchecked,
         uuidairportheliport,
         nameairportheliport,
         geom,
         loc.beginposition,
         loc.endposition,
         loc.endposition
    ---arp.proj


$$;

create or replace function markerbeacon_sid_map(geometry_filter character varying,
                                     arpname_filter character varying DEFAULT NULL::character varying,
                                     as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                class               character varying,
                frequency           character varying,
                axisbearing         valbearingtype,
                auralmorsecode      character varying,
                designator          character varying,
                magneticvariation   numeric,
                latitude            character varying,
                longitude           character varying,
                srid                integer,
                uuidairportheliport uuid,
                nameairportheliport character varying,
                beginposition       datetype,
                xlbl                double precision,
                ylbl                double precision,
                geom                character varying,
                present             character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      AND name = arpname_filter)
select identifier,
       "class",
       frequency,
       axisBearing,
       auralMorseCode,
       designator,
       magneticvariation,
       latitude,
       longitude,
       srid,
       uuidAirportHeliport,
       nameAirportHeliport,
       beginPosition,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter(date_filter)))
             AND name = arpname_filter))))) + 1000 as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter(date_filter)))
             AND name = arpname_filter))))) + 1000 as ylbl,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter(date_filter)))
                 AND name = arpname_filter))::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter(date_filter)))
                 AND name = arpname_filter))) END  as geom,
       concat(frequency, ' ', axisbearing)            present
FROM markerbeacon_mat mb
---LEFT JOIN pre_arp on pre_arp.uuid = mb.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  ---AND (arpname_filter IS NULL OR NULLIF(arpname_filter,'') is NULL OR nameAirportHeliport = any (regexp_split_to_array(arpname_filter, ',')))
  AND ST_Intersects(geom, geometry_filter::geometry)
$$;

create or replace function procedure_sid_map(arpname_filter character varying, transitionid_filter character varying,
                                  proceduretype_filter character varying DEFAULT NULL::character varying,
                                  designator_filter character varying DEFAULT NULL::character varying,
                                  iapname_filter character varying DEFAULT NULL::character varying,
                                  rnav_filter character varying DEFAULT NULL::character varying,
                                  as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier                id,
                codingstandard            codeprocedurecodingstandardtype,
                name                      character,
                rnav                      codeyesnobasetype,
                designator                character,
                transitionid              text,
                transitiontype            character varying,
                approachprefix            character varying,
                approachtype              character varying,
                multipleidentification    codeupperalphatype,
                coptertrack               valbearingtype,
                circlingidentification    codeupperalphatype,
                coursereversalinstruction character varying,
                additionalequipment       character varying,
                channelgnss               character varying,
                waasreliable              codeyesnotype,
                uuidairportheliport       id,
                nameairportheliport       character,
                procedure                 character varying,
                beginposition             datetype,
                geom                      character varying,
                instruction               character varying,
                gradient_obs              character varying,
                gradient_air              character varying,
                deleted                   boolean
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
       array_to_string(transitionid, ',') transitionid,
       transitionType,
       approachprefix,
       approachtype,
       multipleidentification,
       copterTrack,
       circlingIdentification,
       courseReversalInstruction,
       additionalEquipment,
       channelGNSS,
       WAASReliable,
       uuidAirportHeliport,
       nameAirportHeliport,
       "procedure",
       beginPosition,
       geom,
       replace(instruction, '\n',''),
       gradient_obs,
       gradient_air,
       CASE
           WHEN designator_filter is NULL or designator_filter = '' THEN false
           WHEN designator = any (regexp_split_to_array(designator_filter, ',')) THEN false
           else true
           end                            "deleted"
FROM procedure_sid(arpname_filter, transitionid_filter, proceduretype_filter, as_wkt,
                   date_filter) where (iapname_filter IS NULL OR NULLIF(iapname_filter,'') is NULL OR "name" = any (regexp_split_to_array(IAPname_filter, ',')))
    AND
(proceduretype_filter IS NULL OR NULLIF (proceduretype_filter,'') is NULL OR procedure = any (regexp_split_to_array(proceduretype_filter, ',')))
AND
(rnav_filter IS NULL OR NULLIF (rnav_filter,'') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')));
$$;





create or replace function obs_sid_map(arpname_filter character varying, geometry_filter character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
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
      and name = arpname_filter)
    ,
     max_obs as (select max((case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)::numeric) max_ta, max(identifier) id from obs_area
     where ST_Intersects(geom, geometry_filter::geometry))
select identifier,
       ab,
       ta,
       le,
       type_obs,
       (case when (case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)::numeric > 100
                      and (case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)::numeric not in (select max_ta::int from max_obs ) then 1
           when (case when ta like '%FT%' then replace(ta, ' FT', '')::numeric * 0.3048 else replace(ta, ' M','')::numeric end)::numeric in (select max_ta::int from max_obs limit 1) then 3
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



create or replace function glidepath_sid_map(arpname_filter character varying, geometry_filter character varying,
                                  as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier                id,
                frequency                 character varying,
                slope                     character varying,
                angleaccuracy             character varying,
                rdh                       character varying,
                rdhaccuracy               character varying,
                designator                character varying,
                name                      character varying,
                emissionclass             character varying,
                mobile                    character varying,
                magneticvariation         character varying,
                magneticvariationaccuracy character varying,
                datemagneticvariation     character varying,
                flightchecked             character varying,
                uuidairportheliport       id,
                nameairportheliport       character varying,
                beginposition             datetype,
                endposition               datetype,
                geom                      character varying,
                xlbl                      double precision,
                ylbl                      double precision
            )
    immutable
    language sql
as
$$
with arp as (
    ---select identifier uuid,
    select proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter()))
      AND name = arpname_filter)
select glid.identifier                                id,
       glid.frequency::character varying,
       glid.slope::character varying,
       glid.angleaccuracy::character varying,
       glid.rdh::character varying,
       glid.rdhaccuracy::character varying,
       glid.designator::character varying,
       glid.name::character varying,
       glid.emissionclass::character varying,
       glid.mobile::character varying,
       glid.magneticvariation::character varying,
       glid.magneticvariationaccuracy::character varying,
       glid.datemagneticvariation::character varying,
       glid.flightchecked::character varying,
       uuidairportheliport,
       nameairportheliport,
       glid.beginposition,
       glid.endposition,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(glid.geom, '+proj=longlat +datum=WGS84 +no_defs', (
               ---select identifier uuid,
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))::varchar
           ELSE st_asewkt(st_transform(glid.geom, '+proj=longlat +datum=WGS84 +no_defs', (
               ---select identifier uuid,
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))) END  as geom,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(glid.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           ---select identifier uuid,
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(glid.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           ---select identifier uuid,
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as ylbl

FROM glidepath_sid glid
     ---join arp on arp.uuid = loc.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND ST_Intersects(geom, geometry_filter::geometry)
GROUP BY glid.identifier,
         glid.frequency,
         glid.slope,
         glid.angleaccuracy,
         glid.rdh,
         glid.rdhaccuracy,
         glid.designator,
         glid.name,
         glid.emissionclass,
         glid.mobile,
         glid.magneticvariation,
         glid.magneticvariationaccuracy,
         glid.datemagneticvariation,
         glid.flightchecked,
         uuidairportheliport,
         nameairportheliport,
         glid.beginposition,
         glid.endposition,
         glid.geom

$$;

create or replace function specialnavigationstation_sid_map(arpname_filter character varying, geometry_filter character varying,
                                                 as_wkt character varying DEFAULT true,
                                                 date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier    id,
                type          text,
                latitude      text,
                longitude     text,
                beginposition datetype,
                endposition   datetype,
                xlbl          double precision,
                ylbl          double precision,
                geom          character varying
            )
    immutable
    language sql
as
$$
select spn.identifier,
       spn.type,
       spn.latitude,
       spn.longitude,
       spn.beginposition,
       spn.endposition,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(spn.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as xlbl,

       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(spn.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as ylbl,

       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))) END  as geom

FROM specialnavigationstation_mat spn
where spn.beginposition <= (select * FROM set_date_filter(date_filter))
   or spn.beginposition is null
    AND ST_Intersects(geom, geometry_filter::geometry)

GROUP BY identifier,
         type,
         latitude,
         longitude,
         spn.beginposition,
         spn.endposition,
         geom
$$;

create or replace function navaid_sid_map(arpname_filter character varying, geometry_filter character varying,
                               as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier           id,
                designator           character varying,
                name                 character varying,
                type                 character varying,
                elevation            character varying,
                frequency            character varying,
                magneticvariation    character varying,
                classndb             character varying,
                zerobearingdirection character varying,
                typedme              character varying,
                latitude             character varying,
                longitude            character varying,
                srid                 character varying,
                uuidairportheliport  uuid,
                nameairportheliport  character varying,
                beginposition        datetype,
                xlbl                 double precision,
                ylbl                 double precision,
                geom                 character varying,
                rnav                 character varying,
                present              character varying
            )
    immutable
    language sql
as
$$
    --with arp as (
    --   select identifier uuid, proj FROM airportheliport_mat
    --   where beginposition <= ((select * FROM set_date_filter()))
    --      AND name = arpname_filter)
select nav.identifier,
       nav.designator,
       nav.name,
       nav."type",
       elevation,
       frequency,
       magneticVariation,
       classNDB,
       zeroBearingDirection,
       --- slope, magneticBearing, widthcourse, trueBearing, axisbearing,
       typeDME,
       latitude,
       longitude,
       srid,
       nav.uuidairportheliport,
       nav.nameAirportHeliport,
       nav.beginPosition,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(nav.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(nav.geom, '+proj=longlat +datum=WGS84 +no_defs', (
           select proj
           FROM airportheliport_mat
           where beginposition <= ((select * FROM set_date_filter()))
             AND name = arpname_filter))))) + 1000 as ylbl,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (
               select proj
               FROM airportheliport_mat
               where beginposition <= ((select * FROM set_date_filter()))
                 AND name = arpname_filter))) END  as geom,
       rnav,
       present
FROM navaid_SID nav
     ---join arp on arp.uuid = nav.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND ST_Intersects(geom, geometry_filter::geometry)
GROUP BY nav.identifier, nav.designator, nav.name, nav."type", elevation, frequency, magneticVariation, classNDB,
         zeroBearingDirection,
         typeDME, latitude, longitude, srid, nav.uuidairportheliport, nav.nameAirportHeliport, nav.beginPosition,
         nav.geom, rnav, present
$$;

create or replace function runwaydirection_sid_map(arpname_filter character varying,
                                        designator_filter character varying DEFAULT NULL::character varying,
                                        runway_designator_filter character varying DEFAULT NULL::character varying,
                                        as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier                id,
                designator                textdesignatortype,
                truebearing               valbearingtype,
                magneticbearing           valbearingtype,
                precisionapproachguidance codeapproachguidancetype,
                truebearingaccuracy       integer,
                slopetdz                  valslopetype,
                uuidrunway                id,
                uuidairportheliport       id,
                nameairportheliport       textnametype,
                beginposition             datetype,
                elevationtdz              character varying,
                elevation                 numeric,
                elevation_uom             character varying,
                role                      character varying,
                geom                      character varying
            )
    immutable
    language sql
as
$$
with arp as (
    select proj, identifier uuid, name
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       trueBearing,
       magneticBearing,
       precisionApproachGuidance,
       trueBearingAccuracy,
       slopeTDZ,
       uuidRunway,
       uuidAirportHeliport,
       nameAirportHeliport,
       beginPosition,
       CASE
           WHEN (elevationTDZ).value is not NULL
               THEN concat((elevationTDZ).value, ' ', (elevationTDZ).unit)
           else (elevationTDZ).nonnumeric
           end                                                                                    elevationTDZ,
       floor(elevation),
       elevation_uom,
       coalesce(("role").value, ("role").nilreason)                                               "role",
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END as geom
FROM runwaydirection_mat rwdir
         join arp on arp.uuid = rwdir.uuidAirportHeliport
where beginposition <= ((select * FROM set_date_filter(date_filter)))
  AND nameAirportHeliport = arpname_filter
  AND (runway_designator_filter IS NULL OR NULLIF(runway_designator_filter, '') is NULL
    OR runway_designator = any (regexp_split_to_array(runway_designator_filter, ',')))
  AND (designator_filter IS NULL OR NULLIF(designator_filter, '') is NULL
    OR designator = any (regexp_split_to_array(replace(designator_filter, 'RW', ''), ',')))

$$;



create or replace function holdingpattern_sid_map(geometry_filter character varying,
                                       arpname_filter character varying DEFAULT NULL::character varying,
                                       as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                character varying,
                outboundcourse      integer,
                outboundcoursetype  character varying,
                inboundcourse       integer,
                inboundcoursetype   character varying,
                turndirection       character varying,
                upperlimit          character varying,
                lowerlimit          character varying,
                lowerlimitreference character varying,
                upperlimitreference character varying,
                lowerlimit_ft       numeric,
                upperlimit_ft       numeric,
                upperincludingvalue boolean,
                lowerincludingvalue boolean,
                duration            character varying,
                speedlimit          integer,
                speed_uom           character varying,
                fix_name            character varying,
                length              character varying,
                he                  character varying,
                beginposition       datetype,
                geom                character varying,
                xlbl                double precision,
                ylbl                double precision
            ---,
                ---nameprocedure       character varying
            )
    immutable
    language sql
as
$$
with pre_arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      AND (arpname_filter IS NULL OR NULLIF(arpname_filter, '') is NULL OR
           name = any (regexp_split_to_array(arpname_filter, ',')))
)

select hold.identifier,
       hold."type",
       outboundCourse,
       outboundCourseType,
       inboundCourse,
       inboundCourseType,
       hold.turnDirection,
       hold.upperlimit,
       hold.lowerLimit,
       hold.lowerLimitReference,
       hold.upperlimitreference,
       lowerLimit_ft,
       upperLimit_ft,
       upperIncludingValue,
       lowerIncludingValue,
       hold.duration,
       hold.speedLimit,
       hold.speed_uom,
       fix_name,
       hold.length,
       hold.he,
       hold.beginposition,
       CASE
           WHEN as_wkt::bool = FALSE
               THEN st_transform(hold.geom, '+proj=longlat +datum=WGS84 +no_defs', (select proj
                                                                                    FROM airportheliport_mat
                                                                                    where beginposition <= ((select * FROM set_date_filter(date_filter)))
                                                                                      AND (arpname_filter IS NULL OR
                                                                                           NULLIF(arpname_filter, '') is NULL OR
                                                                                           name = any (regexp_split_to_array(arpname_filter, ',')))))::varchar
           ELSE st_asewkt(st_transform(hold.geom, '+proj=longlat +datum=WGS84 +no_defs', (select proj
                                                                                          FROM airportheliport_mat
                                                                                          where beginposition <= ((select * FROM set_date_filter(date_filter)))
                                                                                            AND (arpname_filter IS NULL OR
                                                                                                 NULLIF(arpname_filter, '') is NULL OR
                                                                                                 name = any (regexp_split_to_array(arpname_filter, ',')))))) END as geom,
       ST_X(ST_Centroid(ST_MakePolygon(
               st_geomfromewkt(st_transform(ST_ForceClosed(hold.geom), '+proj=longlat +datum=WGS84 +no_defs',
                                            (select proj
                                             FROM airportheliport_mat
                                             where beginposition <= ((select * FROM set_date_filter(date_filter)))
                                               AND (arpname_filter IS NULL OR NULLIF(arpname_filter, '') is NULL OR
                                                    name = any (regexp_split_to_array(arpname_filter, ','))))))))) +
       1000                                                                                                                                                      as xlbl,
       ST_Y(ST_Centroid(ST_MakePolygon(
               st_geomfromewkt(st_transform(ST_ForceClosed(hold.geom), '+proj=longlat +datum=WGS84 +no_defs',
                                            (select proj
                                             FROM airportheliport_mat
                                             where beginposition <= ((select * FROM set_date_filter(date_filter)))
                                               AND (arpname_filter IS NULL OR NULLIF(arpname_filter, '') is NULL OR
                                                    name = any (regexp_split_to_array(arpname_filter, ','))))))))) +
       1000 as ylbl
      --- s.nameprocedure
---FROM Holdingpattern_mat hold
         FROM holdingpattern_mat_terminal hold
         JOIN SegmentPoint segm on segm.id = hold.segpoint_id
         LEFT JOIN designatedpoint_mat_procedure dsgn on dsgn.startend = segm.id
         LEFT JOIN navaid_mat_procedure nav on nav.startend = segm.id
           ----нет связи в segmentleg в исходных данных
         -----LEFT JOIN segmentleg_mat s on s.startend = hold.segpoint_id
         LEFT JOIN pre_arp on pre_arp.uuid = coalesce(dsgn.uuidairportheliport, nav.uuidairportheliport)
where hold.beginposition <= (select * FROM set_date_filter(date_filter))
  --AND (arpname_filter IS NULL OR NULLIF(arpname_filter,'') is NULL
  -- OR coalesce(dsgn.nameairportheliport, nav.nameairportheliport) = any (regexp_split_to_array(arpname_filter, ',')))
  AND ST_Intersects(hold.geom, geometry_filter::geometry)
group by hold.identifier, hold."type", outboundCourse, outboundCourseType, inboundCourse, inboundCourseType,
         hold.turnDirection,
         hold.upperlimit, hold.lowerLimit, hold.lowerLimitReference, hold.upperlimitreference, lowerLimit_ft,
         upperLimit_ft,
         upperIncludingValue, lowerIncludingValue, hold.duration, hold.speedLimit, hold.speed_uom, fix_name, hold.length, hold.he,
         hold.beginposition, hold.geom, proj;
         ----s.nameprocedure;
$$;




create or replace function approachtype_sid_map(arpname_filter character varying, iapname_filter character varying DEFAULT NULL::character varying, date_filter datetype DEFAULT NULL::date)
 returns codeapproachbasetype[]
    immutable
    language sql
as
$$
select ARRAY(
select distinct approachtype

FROM procedure_mat
where (iapname_filter IS NULL OR NULLIF(iapname_filter, '') is NULL OR
       "name" = any (regexp_split_to_array(IAPname_filter, ',')))
  and beginPosition <= (select * from set_date_filter(date_filter))
  and nameairportheliport = arpname_filter
  and procedure = 'IAP' );
$$;


---временно ignore
create or replace function segmentleg_for_profiel(arpname_filter character varying,
                                       procedname_filter character varying DEFAULT NULL::character varying,
                                       date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier              id,
                endconditiondesignator  character varying,
                legpath                 character varying,
                legtypearinc            character varying,
                course                  valbearingtype,
                coursetype              character varying,
                coursedirection         character varying,
                turndirection           codedirectionturntype,
                speedlimit              character varying,
                speed_uom               character varying,
                speedreference          character varying,
                duration                character varying,
                distance                character varying,
                distancetype            character varying,
                distancepointchoice     integer,
                geom_nav_distance       geometry,
                angle                   valbearingtype,
                angletype               character varying,
                anglepointchoice        integer,
                geom_nav_angle          geometry,
                procedureturnrequired   character varying,
                lowerlimit              character varying,
                lowerlimitreference     codeverticalreferencetype,
                upperlimit              character varying,
                upperlimitreference     codeverticalreferencetype,
                altitudeinterpretation  codealtitudeusetype,
                length                  numeric,
                uom_length              character varying,
                verticalangle           numeric,
                type                    character varying,
                thresholdaftermapt      character varying,
                heightmapt              character varying,
                geom                    geometry,
                startpoint              integer,
                endpoint                integer,
                arccentre               integer,
                aircraftlandingcategory character varying,
                uuidprocedure           id,
                legtype                 character varying,
                uuidairportheliport     uuid,
                nameairportheliport     character varying,
                nameprocedure           character varying,
                beginposition           datetype,
                procedure               character varying,
                transitionid            codedesignatedpointdesignatortype[],
                rnav                    character varying,
                seqnumberarinc          nosequencebasetype,
                point_type              character varying,
                nav_dist_type           character varying,
                nav_angle_type          character varying,
                navaid_dist             character varying,
                navaid_angle            character varying,
                role                    character varying,
                approachtype            character varying,
                type_control            character varying,
                geom_control            geometry,
                name_control            character varying
            )
    immutable
    language sql
as
$$
select identifier,
       endconditiondesignator,
       legPath,
       legTypeARINC,
       course,
       courseType,
       courseDirection,
       turnDirection,
       speedLimit,
       speed_uom,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       geom_nav_distance,
       angle,
       angleType,
       anglePointChoice,
       geom_nav_angle,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       length,
       uom_length,
       verticalAngle,
       "type",
       thresholdAfterMAPT,
       heightmapt,
       geom,
       startPoint,
       endPoint,
       arcCentre,
       aircraftlandingcategory,
       uuidProcedure,
       legType,
       uuidAirportHeliport,
       nameAirportHeliport,
       nameProcedure,
       beginPosition,
       "procedure",
       transitionid,
       rnav,
       seqnumberarinc,
       point_type,
       nav_dist_type,
       nav_angle_type,
       navaid_dist,
       navaid_angle,
       role,
       approachtype,
       type_control,
       geom_control,
       name_control
from final_profiel_leg_mat
where beginPosition <= (select * from set_date_filter(date_filter))
  ----and ST_Intersects(geom, geometry_filter::geometry)
  and nameAirportHeliport = arpname_filter
  and (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')));
$$;

create or replace function runwaydirection_geom(arpname_filter character varying, runwaydirecton_filter character varying,
                                     date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                geom geometry
            )
    immutable
    language sql
as
$$
select geom
from runwaydirection_mat
where beginPosition <= (select * from set_date_filter(date_filter))
  and nameairportheliport = arpname_filter
  and designator = runwaydirecton_filter ;
$$;

/*create or replace function designatedpoint_sid_map(arpname_filter character varying,
                                        procedname_filter character varying DEFAULT NULL::character varying,
                                        transitionid_filter character varying DEFAULT NULL::character varying,
                                        proceduretype_filter character varying DEFAULT NULL::character varying,
                                        rnav_filter character varying DEFAULT NULL::character varying,
                                        as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier             id,
                designator             character varying,
                type                   character varying,
                tp2                    character varying,
                tp1                    character varying,
                name                   character varying,
                uuidairportheliport    id,
                nameairportheliport    character varying,
                latitude               character varying,
                longitude              character varying,
                srid                   character varying,
                beginposition          datetype,
                speedlimit             character varying,
                speedreference         character varying,
                duration               character varying,
                distance               character varying,
                distancetype           character varying,
                distancepointchoice    integer,
                geom_nav_distance      character varying,
                type_distance_nav      character varying,
                distance_navaid        character varying,
                angle                  valbearingtype,
                angletype              character varying,
                anglepointchoice       integer,
                geom_nav_angle         character varying,
                type_angle_nav         character varying,
                angle_navaid           character varying,
                procedureturnrequired  character varying,
                lowerlimit             character varying,
                lowerlimitreference    codeverticalreferencetype,
                upperlimit             character varying,
                upperlimitreference    codeverticalreferencetype,
                altitudeinterpretation codealtitudeusetype,
                rnav                   character varying,
                flyover                codeyesnotype,
                role                   character varying,
                idsignificantpoint     integer,
                he                     character varying,
                geom                   character varying,
                xlbl                   double precision,
                ylbl                   double precision,
                nameprocedure          character varying
            )
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       "type",
       tp2,
       tp1,
       "name",
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       speedLimit,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       rnav,
       flyOver,
       "role",
       idsignificantpoint,
       he,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(
                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END                           as geom,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       nameprocedure
FROM designatedpoint_mat dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
  AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

  AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

  AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')))
  AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')))
GROUP BY identifier, designator, "type", tp2, tp1, "name", uuidAirportHeliport, nameAirportHeliport, latitude,
         longitude, srid, beginPosition, speedLimit, speedReference, duration, distance, distanceType,
         distancePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_dist_nav,
         distance_navaid,
         angle,
         angleType,
         anglePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_angle_nav, angle_navaid, procedureTurnRequired,
         lowerLimit, lowerLimitReference, upperlimit, upperlimitreference, altitudeInterpretation, rnav,
         flyOver, "role", idsignificantpoint, geom, proj, he, nameprocedure;
$$;
*/



----------designatedpoint_sid_map()-----FROM designatedpoint_mat_procedure (здесь только процедурные despoint)
----добавлено startend для связи с segmentleg (используется для exit_leg_mat)
----добавлено tp1 is null then 'ПДЗ'
create or replace function designatedpoint_sid_map(arpname_filter character varying, procedname_filter character varying DEFAULT NULL::character varying, transitionid_filter character varying DEFAULT NULL::character varying, proceduretype_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, type character varying, tp2 character varying, tp1 character varying, name character varying, uuidairportheliport id, nameairportheliport character varying, latitude character varying, longitude character varying, srid character varying, beginposition datetype, speedlimit character varying, speedreference character varying, duration character varying, distance character varying, distancetype character varying, distancepointchoice integer, geom_nav_distance character varying, type_distance_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, anglepointchoice integer, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, procedureturnrequired character varying, lowerlimit character varying, lowerlimitreference codeverticalreferencetype, upperlimit character varying, upperlimitreference codeverticalreferencetype, altitudeinterpretation codealtitudeusetype, rnav character varying, flyover character varying, role character varying, idsignificantpoint integer, he character varying, geom character varying, xlbl double precision, ylbl double precision, nameprocedure character varying)
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       "type",
       tp2,
       (case when tp1 is null then 'ПДЗ' else tp1 end) as  tp1,
       "name",
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       (case when speedLimit = ' ' then NULL else speedLimit end) as speedLimit,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       rnav,
       case when flyOver::text like '%YES%' then 'YES' when flyOver::text like '%NO%' then 'NO' end as flyOver,
       replace(replace(role::text, '(,'::text, ''::text), ')'::text, ''::text) as role,
       idsignificantpoint,
       he,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(
                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END                           as geom,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       nameprocedure
FROM designatedpoint_mat_procedure dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
  AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

  AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

  AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')))
  AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')))
GROUP BY identifier, designator, "type", tp2, (case when tp1 is null then 'ПДЗ' else tp1 end), "name", uuidAirportHeliport, nameAirportHeliport, latitude,
         longitude, srid, beginPosition, (case when speedLimit = ' ' then NULL else speedLimit end), speedReference, duration, distance, distanceType,
         distancePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_dist_nav,
         distance_navaid,
         angle,
         angleType,
         anglePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_angle_nav, angle_navaid, procedureTurnRequired,
         lowerLimit, lowerLimitReference, upperlimit, upperlimitreference, altitudeInterpretation, rnav,
         flyOver, "role", idsignificantpoint, geom, proj, he, nameprocedure;
$$;






create or replace function exit_leg_sid_map(arpname_filter character varying, geometry_filter character varying, scale_filter integer, transitionid_filter character varying, proceduretype_filter character varying, procedname_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, name character varying, type character varying, latitude character varying, longitude character varying, speedlimit character varying, speedreference character varying, distance character varying, distancetype character varying, geom_nav_distance character varying, type_distance_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, lowerlimit character varying, lowerlimitreference character varying, upperlimit character varying, upperlimitreference character varying, altitudeinterpretation character varying, rnav character varying, xlbl double precision, ylbl double precision, geom character varying, beginposition datetype, transitionid text, tp1 character varying, flyover codeyesnotype, nameprocedure character varying)
    immutable
    language sql
as
$$
with pre_arp as (
    select name, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      ---AND (endPosition is NULL OR endPosition > (select * FROM set_date_filter(date_filter)))
      AND name = arpname_filter),
     main_sel as (
         select identifier,
                designator,
                exit_leg_mat.name,
                type,
                latitude,
                longitude,
                speedlimit,
                speedreference,
                distance,
                exit_leg_mat.distancetype,
                geom_nav_distance,
                type_dist_nav,
                distance_navaid,
                angle,
                angletype,
                exit_leg_mat.geom_nav_angle,
                exit_leg_mat.type_angle_nav,
                angle_navaid,
                lowerlimit,
                lowerlimitreference,
                upperlimit,
                upperlimitreference,
                altitudeinterpretation,
                rnav,
                CASE
                    WHEN geom is not null
                        THEN center_test(geom::varchar, geometry_filter, scale_filter, proj)
                    WHEN proc_geom is not null
                        THEN center_test(proc_geom::varchar, geometry_filter, scale_filter, proj)
                    else st_transform(point_geom, '+proj=longlat +datum=WGS84 +no_defs', proj) end as geom,
                beginPosition,
                array_to_string(transitionid, ',')                                                    transitionid,
                proj,
                (case when tp1 is null then 'ПДЗ' else tp1 end) as  tp1,
                flyover,
                nameprocedure
         FROM exit_leg_mat
                  join pre_arp on pre_arp.name = exit_leg_mat.nameairportheliport
         where beginposition <= ((select * FROM set_date_filter()))
           ---AND (endPosition is NULL OR endPosition > (select * FROM set_date_filter(date_filter)))
           AND ((geom IS NOT NULL AND st_intersects(
                 st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                 ST_Buffer(
                         st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs', proj),
                         -400 * (scale_filter::int / 100000))::geometry)) or (geom IS NULL))
           AND NOT st_intersects(
                 st_transform(point_geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                 ST_Buffer(
                         st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs', proj),
                         -400 * (scale_filter::int / 100000))::geometry)
           AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
             OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)
           AND procedure = any (regexp_split_to_array(proceduretype_filter, ','))
           --  AND distance is not NULL
           AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR
                rnav = any (regexp_split_to_array(rnav_filter, ',')))
         GROUP BY designator, identifier, exit_leg_mat.name, type, latitude, longitude, speedlimit, speedreference,
                  distance, distancetype, geom_nav_distance, type_dist_nav, distance_navaid,
                  angle, angletype, geom_nav_angle, type_angle_nav, angle_navaid,
                  lowerlimit, lowerlimitreference, upperlimit, upperlimitreference, altitudeinterpretation, rnav, geom,
                  (case when tp1 is null then 'ПДЗ' else tp1 end),
                  beginPosition, transitionid, legtypearinc, point_geom, proj, procedure, nameairportheliport,
                  proc_geom, flyover, nameprocedure)
select identifier,
       designator,
       name,
       type,
       latitude,
       longitude,
       (case when speedLimit = ' ' then NULL else speedLimit end) as speedLimit,
       speedreference,
       distance,
       distancetype,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angletype,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       lowerlimit,
       lowerlimitreference,
       upperlimit,
       upperlimitreference,
       altitudeinterpretation,
       rnav,
       ST_X(ST_Centroid(ST_GeomFromewkt(geom))) + 1000 as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(geom))) + 1000 as ylbl,
       CASE
           WHEN as_wkt::bool = FALSE THEN geom::varchar
           ELSE st_asewkt(geom) end                    as geom,
       beginPosition,
       transitionid,
       tp1,
       flyover,
       nameprocedure
FROM main_sel;
$$;


create or replace function runwaydirection_designator(arpname_filter character varying, date_filter datetype DEFAULT NULL::date)
 returns  textdesignatortype[]
    immutable
    language sql
as
$$
select ARRAY (
    select distinct designator
from runwaydirection_mat
where beginPosition <= (select * from set_date_filter(date_filter))
  and nameairportheliport = arpname_filter)
    ;
$$;


----временно ignore
create or replace function finalprofiel_sid_map(arpname_filter character varying, runwaydirection_filter character varying,
                                     geometry_filter character varying, scale_filter integer,
                                     proceduretype_filter character varying DEFAULT NULL::character varying,
                                     procedname_filter character varying DEFAULT NULL::character varying,
                                     rnav_filter character varying DEFAULT NULL::character varying,
                                     as_wkt character varying DEFAULT true,
                                     proclegtype_filter character varying DEFAULT NULL::character varying,
                                     transitionid_filter character varying DEFAULT NULL::character varying,
                                     date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier              id,
                seqnumberarinc          nosequencebasetype,
                legtypearinc            character varying,
                role                    character varying,
                type_control            character varying,
                name_control            character varying,
                approachtype            character varying,
                len_to_rwy              numeric,
                course                  double precision,
                coursetype              character varying,
                coursedirection         character varying,
                turndirection           codedirectionturntype,
                length                  numeric,
                uom_length              character varying,
                he                      character varying,
                lowerlimit              character varying,
                lowerlimitreference     codeverticalreferencetype,
                upperlimit              character varying,
                upperlimitreference     codeverticalreferencetype,
                altitudeinterpretation  codealtitudeusetype,
                speedlimit              character varying,
                speed_uom               character varying,
                speedreference          character varying,
                duration                character varying,
                nav_dist_type           character varying,
                navaid_dist             character varying,
                distance                character varying,
                distancetype            character varying,
                len_to_nav_dist_rwy     numeric,
                nav_angle_type          character varying,
                navaid_angle            character varying,
                angle                   valbearingtype,
                angletype               character varying,
                len_to_nav_angl_rwy     numeric,
                procedureturnrequired   character varying,
                verticalangle           numeric,
                type                    character varying,
                thresholdaftermapt      character varying,
                heightmapt              character varying,
                aircraftlandingcategory character varying,
                uuidprocedure           id,
                legtype                 text,
                uuidairportheliport     uuid,
                nameairportheliport     character varying,
                nameprocedure           character varying,
                beginposition           datetype,
                nav_des_uuid            id
            )
    immutable
    language sql
as
$$
with
nav_cor  as
     (SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM navaidtimeslice dp
         LEFT JOIN navaid d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid),
     des_cor as
(
    SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM designatedpointtimeslice dp
         LEFT JOIN designatedpoint d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid
    ),
     pre_arp as (
    select proj, identifier id, name, magneticVariation
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      AND name = arpname_filter),
     prev_leg as (
         select nameprocedure,
                legtypearinc,
                startend,
                seqnumberarinc::integer,
                coalesce(d_pre.geom, nav_pre.geom) pre_geom
         FROM segmentleg_mat
                  join segmentpoint sp_pre on sp_pre.id = startend
                  LEFT JOIN designatedpointtimeslice d_pre on sp_pre.idsignificantpoint = d_pre.idsignificantpoint
                  LEFT JOIN navaidtimeslice nav_pre on sp_pre.idsignificantpoint = nav_pre.idsignificantpoint
                  LEFT JOIN nav_cor ON nav_pre.idtimeslice = nav_cor.a::integer
                  LEFT JOIN des_cor ON d_pre.idtimeslice = des_cor.a::integer
         where nameairportheliport = arpname_filter
           AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL
             OR "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

           AND (proclegtype_filter IS NULL OR NULLIF(proclegtype_filter, '') is NULL
             OR "legtype" = any (regexp_split_to_array(proclegtype_filter, ',')))
         and nav_pre.idtimeslice::text in (Select * from nav_cor)
         and d_pre.idtimeslice::text in (Select * from des_cor)
     )

        ,
---select_coord_runwaydirect as
     ---  (select geom, designator from runwaydirection_mat
--WHERE nameairportheliport = arpname_filter
---and designator= runwaydirection_filter ),

     sel_point_type as (
         select segleg.identifier id, des.type des_type
         FROM segmentleg_for_profiel(arpname_filter, procedname_filter, date_filter) segleg
                  join segmentpoint p on p.id = segleg.endpoint
             --join segmentpoint p on p.id = segleg.startpoint
                  join designatedpoint_mat des on des.idsignificantpoint = p.idsignificantpoint
     ),
     main_select as (
         select identifier,
                endconditiondesignator,
                legPath,
                segleg.legTypeARINC,
                segleg.seqnumberarinc,
                courseType,
                courseDirection,
                turnDirection,
                speedLimit,
                speed_uom,
                speedReference,
                duration,
                distance,
                distanceType,
                distancePointChoice,
                geom_nav_distance,
                angle,
                angleType,
                anglePointChoice,
                geom_nav_angle,
                procedureTurnRequired,
                CASE
                    WHEN segleg.lowerlimit IS NOT NULL OR segleg.upperlimit IS NOT NULL OR
                         segleg.altitudeinterpretation IS NOT NULL THEN concat(segleg.lowerlimit,
                                                                               CASE
                                                                                   WHEN segleg.upperlimit IS NOT NULL AND segleg.lowerlimit IS NOT NULL
                                                                                       THEN '-'::text
                                                                                   ELSE NULL::text
                                                                                   END, segleg.upperlimit,
                                                                               CASE
                                                                                   WHEN segleg.upperlimit IS NOT NULL OR segleg.lowerlimit IS NOT NULL
                                                                                       THEN ' '::text
                                                                                   ELSE NULL::text
                                                                                   END, segleg.altitudeinterpretation)
                    ELSE NULL::text
                    END AS                         he,

                lowerLimit,
                lowerLimitReference,
                upperlimit,
                upperlimitreference,
                altitudeInterpretation,
                verticalAngle,
                segleg."type",
                thresholdAfterMAPT,
                heightmapt,
                startPoint,
                endPoint,
                arcCentre,
                aircraftlandingcategory,
                uuidProcedure,
                legType,
                uuidAirportHeliport,
                segleg.nav_angle_type,
                segleg.nav_dist_type,
                nameAirportHeliport,
                segleg.nameProcedure,
                beginPosition,
                rnav,
                segleg.navaid_dist,
                segleg.navaid_angle,
                proj,
                array_to_string(transitionid, ',') transitionid,
                CASE
                    WHEN st_intersects(
                            st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                            ST_ExteriorRing(ST_Buffer(
                                    st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                                 proj),
                                    -600 * (scale_filter::int / 100000))))
                        THEN 1
                    WHEN s.des_type = 'ICAO' THEN 10
                    else 0 end                     type_line,
                CASE
                    WHEN st_intersects(
                            st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                            ST_ExteriorRing(ST_Buffer(
                                    st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                                 proj),
                                    -600 * (scale_filter::int / 100000))))
                        THEN (CASE
                                  WHEN st_geometrytype(
                                               ST_Intersection(
                                                       st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                    proj),
                                                       ST_Buffer(st_transform(geometry_filter::geometry,
                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                              proj),
                                                                 -600 * (scale_filter::int / 100000))))
                                      = 'ST_MultiLineString'
                                      THEN st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj)
                                  else ST_Intersection(
                                          st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                          ST_Buffer(st_transform(geometry_filter::geometry,
                                                                 '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                    -600 * (scale_filter::int / 100000))) end
                        )

                    else st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj)
                    END as                         geom,

                coalesce(
                        round(st_length(st_transform(
                                st_makeline(prev_leg.pre_geom, coalesce(d.geom, n.geom)),
                                '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric / 1000.0, 1),
                        segleg.length)             "length",
                CASE
                    WHEN segleg.uom_length IS NULL AND segleg.legtypearinc = 'TF' THEN 'KM'
                    ELSE segleg.uom_length
                    END                            uom_length,
                CASE
                    WHEN segleg.legtypearinc = 'TF'
                        THEN round(degrees(ST_Azimuth(
                            st_transform(prev_leg.pre_geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                            st_transform(coalesce(d.geom, n.geom), '+proj=longlat +datum=WGS84 +no_defs', proj))))
                        - pre_arp.magneticVariation::double precision
                    ELSE segleg.course
                    END                            course,
                coalesce(d.uuid, n.uuid)           nav_des_uuid,
                segleg.role,
                segleg.type_control,
                segleg.name_control,
                segleg.approachtype,
                ---st_length(st_transform(st_makeline( select_coord_runwaydirect.geom,  segleg.geom_control) , '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric / 1000.0   as len_to_rwy,
                ---st_length(st_transform(st_makeline( select_coord_runwaydirect.geom,  segleg.geom_nav_angle) , '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric / 1000.0   as len_to_nav_angl_rwy,
                ---st_length(st_transform(st_makeline( select_coord_runwaydirect.geom,  segleg.geom_nav_distance) , '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric / 1000.0   as len_to_nav_dist_rwy

                st_length(st_transform(
                        st_makeline(runwaydirection_geom(arpname_filter, runwaydirection_filter, date_filter),
                                    segleg.geom_control), '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric /
                1000.0  as                         len_to_rwy,
                st_length(st_transform(
                        st_makeline(runwaydirection_geom(arpname_filter, runwaydirection_filter, date_filter),
                                    segleg.geom_nav_angle), '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric /
                1000.0  as                         len_to_nav_angl_rwy,
                st_length(st_transform(
                        st_makeline(runwaydirection_geom(arpname_filter, runwaydirection_filter, date_filter),
                                    segleg.geom_nav_distance), '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric /
                1000.0  as                         len_to_nav_dist_rwy

         FROM segmentleg_for_profiel(arpname_filter, procedname_filter, date_filter) segleg
                  join pre_arp on pre_arp.id = uuidAirportHeliport
                  LEFT JOIN sel_point_type s on s.id = segleg.identifier
             --- LEFT JOIN select_coord_runwaydirect on right(select_coord_runwaydirect.designator,1) = right(segleg.nameprocedure,1)
                  LEFT JOIN prev_leg on prev_leg.seqnumberarinc = segleg.seqnumberarinc::integer - 1 AND
                                        prev_leg.nameprocedure = segleg.nameprocedure
                  LEFT JOIN segmentpoint sp on sp.id = coalesce(segleg.startpoint, segleg.endpoint)
                  LEFT JOIN designatedpointtimeslice d on sp.idsignificantpoint = d.idsignificantpoint
                  LEFT JOIN navaidtimeslice n on sp.idsignificantpoint = n.idsignificantpoint
                 -- LEFT JOIN nav_cor ON n.idtimeslice = nav_cor.a::integer
                ---  LEFT JOIN des_cor ON d.idtimeslice = des_cor.a::integer
         where (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
                "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))
           AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
             OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)
       ---and n.idtimeslice::text in (Select * from nav_cor)
     ---- and d.idtimeslice::text in (Select * from des_cor)


           AND nameAirportHeliport = arpname_filter
           AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR
                rnav = any (regexp_split_to_array(rnav_filter, ',')))
           AND (proclegtype_filter IS NULL OR NULLIF(proclegtype_filter, '') is NULL OR
                legtype = any (regexp_split_to_array(proclegtype_filter, ',')))
           AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
                segleg.nameprocedure = any (regexp_split_to_array(procedname_filter, ',')))

         group by identifier, proj, endconditiondesignator, legPath, segleg.legTypeARINC, segleg.seqnumberarinc, course,
                  courseType, courseDirection, turnDirection,
                  speedLimit, speed_uom, speedReference, duration, distance, distanceType, distancePointChoice,
                  geom_nav_distance, angle,
                  angleType, anglePointChoice, geom_nav_angle, procedureTurnRequired,
                  CASE
                      WHEN segleg.lowerlimit IS NOT NULL OR segleg.upperlimit IS NOT NULL OR
                           segleg.altitudeinterpretation IS NOT NULL THEN concat(segleg.lowerlimit,
                                                                                 CASE
                                                                                     WHEN segleg.upperlimit IS NOT NULL AND segleg.lowerlimit IS NOT NULL
                                                                                         THEN '-'::text
                                                                                     ELSE NULL::text
                                                                                     END, segleg.upperlimit,
                                                                                 CASE
                                                                                     WHEN segleg.upperlimit IS NOT NULL OR segleg.lowerlimit IS NOT NULL
                                                                                         THEN ' '::text
                                                                                     ELSE NULL::text
                                                                                     END, segleg.altitudeinterpretation)
                      ELSE NULL::text
                      END,
                  lowerLimit, lowerLimitReference, upperlimit,
                  upperlimitreference, altitudeInterpretation, "length", uom_length, verticalAngle, segleg."type",
                  thresholdAfterMAPT, heightmapt,
                  startPoint, endPoint, arcCentre, aircraftlandingcategory, uuidProcedure, legType, uuidAirportHeliport,
                  nameAirportHeliport, segleg.nav_dist_type, segleg.nav_angle_type, segleg.navaid_dist,
                  segleg.navaid_angle, segleg.nameProcedure, beginPosition, rnav, type_line, segleg.geom, d.geom,
                  n.geom, transitionId,
                  prev_leg.pre_geom, pre_arp.magneticVariation, d.uuid, n.uuid, s.des_type, segleg.role,
                  segleg.approachtype, segleg.type_control, segleg.name_control,
                  st_length(st_transform(
                          st_makeline(runwaydirection_geom(arpname_filter, runwaydirection_filter, date_filter),
                                      segleg.geom_control), '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric /
                  1000.0,
                  st_length(st_transform(
                          st_makeline(runwaydirection_geom(arpname_filter, runwaydirection_filter, date_filter),
                                      segleg.geom_nav_angle), '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric /
                  1000.0,
                  st_length(st_transform(
                          st_makeline(runwaydirection_geom(arpname_filter, runwaydirection_filter, date_filter),
                                      segleg.geom_nav_distance), '+proj=longlat +datum=WGS84 +no_defs',
                          proj))::numeric / 1000.0)


select identifier,
       --endconditiondesignator,
       ---legPath,
       seqnumberarinc,
       legTypeARINC,
       role,
       type_control,
       name_control,
       approachtype,
       len_to_rwy,
       CASE WHEN course < 0 THEN course + 180 ELSE course END course,


       courseType,
       courseDirection,
       turnDirection,
       "length",
       uom_length,

       he,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,

       speedLimit,
       speed_uom,
       speedReference,
       duration,

       ---point_type,
       nav_dist_type,
       navaid_dist,
       distance,
       distanceType,
       len_to_nav_dist_rwy,
       -- distancePointChoice,
       -- geom_nav_distance,
       nav_angle_type,
       navaid_angle,
       angle,
       angleType,
       len_to_nav_angl_rwy,
       --anglePointChoice,
       --geom_nav_angle,
       procedureTurnRequired,


       verticalAngle,
       "type",
       thresholdAfterMAPT,
       heightmapt,
       -- startPoint,
       --endPoint,
       --arcCentre,
       aircraftlandingcategory,
       uuidProcedure,
       legType,
       uuidAirportHeliport,
       nameAirportHeliport,
       nameProcedure,
       beginPosition,
       ---rnav,
       --transitionId,
       --type_line,

       -- CASE WHEN st_geometrytype(geom) = 'ST_GeometryCollection' THEN null
       -- WHEN as_wkt::bool = FALSE THEN geom::varchar
       --  ELSE st_asewkt(geom) end as geom,

       nav_des_uuid
FROM main_select;
$$;


-----добавлена ссылка segmentpoint_mat

create or replace function segmentleg_sid_map(arpname_filter character varying, geometry_filter character varying, scale_filter integer, proceduretype_filter character varying DEFAULT NULL::character varying, procedname_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, proclegtype_filter character varying DEFAULT NULL::character varying, transitionid_filter character varying DEFAULT NULL::character varying, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, endconditiondesignator character varying, legpath character varying, legtypearinc character varying, coursetype character varying, coursedirection character varying, turndirection codedirectionturntype, speedlimit character varying, speed_uom character varying, speedreference character varying, duration character varying, distance character varying, distancetype character varying, distancepointchoice integer, geom_nav_distance character varying, type_dist_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, anglepointchoice integer, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, procedureturnrequired character varying, lowerlimit character varying, lowerlimitreference codeverticalreferencetype, upperlimit character varying, upperlimitreference codeverticalreferencetype, altitudeinterpretation codealtitudeusetype, length numeric, uom_length character varying, verticalangle numeric, type character varying, thresholdaftermapt character varying, heightmapt character varying, startpoint integer, endpoint integer, arccentre integer, aircraftlandingcategory character varying, uuidprocedure id, legtype text, uuidairportheliport uuid, nameairportheliport character varying, nameprocedure character varying, beginposition datetype, rnav character varying, transitionid text, size numeric, type_line integer, course double precision, geom character varying, point_type character varying, navaid character varying, change integer, nav_des_uuid id)
    immutable
    language sql
as
$$
with

     pre_arp as (
    select proj, identifier id, name, magneticVariation
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      AND name = arpname_filter),

     prev_leg as (
         select segmentleg_mat.nameprocedure,
                segmentleg_mat.legtypearinc,
                segmentleg_mat.startend,
                segmentleg_mat.seqnumberarinc::integer,
                sp_pre.geom pre_geom
         FROM segmentleg_mat

             join segmentpoint_mat sp_pre on sp_pre.startend = segmentleg_mat.startend

         where segmentleg_mat.nameairportheliport = arpname_filter
           AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL
             OR segmentleg_mat."procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))
           AND (proclegtype_filter IS NULL OR NULLIF(proclegtype_filter, '') is NULL
             OR segmentleg_mat."legtype" = any (regexp_split_to_array(proclegtype_filter, ',')))

     )
        ,

     sel_point_type as (
         select segleg.identifier id, p.type des_type
         FROM segmentleg_sid(arpname_filter, geometry_filter, procedname_filter, date_filter) segleg
                  join segmentpoint_mat p on p.dp_idsign = segleg.endpoint
                  ---join designatedpoint_mat des on des.idsignificantpoint = p.idsignificantpoint
     ),


     main_select as (
         select segleg.identifier,
                endconditiondesignator,
                legPath,
                segleg.legTypeARINC,
                courseType,
                courseDirection,
                turnDirection,
                segleg.speedLimit,
                segleg.speed_uom,
                segleg.speedReference,
                segleg.duration,

                segleg.distance,
                segleg.distanceType,
                segleg.distancePointChoice,
                st_astext(st_transform(st_geomfromtext(segleg.geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
                segleg.type_dist_nav,
                segleg.distance_navaid,
                segleg.angle,
                segleg.angleType,
                segleg.anglePointChoice,
                st_astext(st_transform(st_geomfromtext(segleg.geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
                segleg.type_angle_nav,
                segleg.angle_navaid,

                segleg.procedureTurnRequired,
                segleg.lowerLimit,
                segleg.lowerLimitReference,
                segleg.upperlimit,
                segleg.upperlimitreference,
                segleg.altitudeInterpretation,
                verticalAngle,
                segleg."type",
                thresholdAfterMAPT,
                heightmapt,
                segleg.startPoint,
                segleg.endPoint,
                arcCentre,
                aircraftlandingcategory,
                uuidProcedure,
                legType,
                segleg.uuidAirportHeliport,
                point_type,
                segleg.nameAirportHeliport,
                segleg.nameProcedure,
                segleg.beginPosition,
                segleg.rnav,
                navaid,
                proj,
                array_to_string(segleg.transitionid, ',') transitionid,
            CASE

            WHEN st_intersects(
                st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                ST_ExteriorRing(ST_Buffer(
                    st_transform(geometry_filter::geometry,'+proj=longlat +datum=WGS84 +no_defs', proj),
                    -600*(scale_filter::int/100000))))
            THEN 1
            when segleg.rnav = 'NO'  and not st_intersects(
                st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                ST_ExteriorRing(ST_Buffer(
                    st_transform(geometry_filter::geometry,'+proj=longlat +datum=WGS84 +no_defs', proj),
                    -600*(scale_filter::int/100000))))  then 10
            WHEN s.des_type = 'ICAO' THEN 10
            when segleg.legtypearinc in ('CA', 'CD') then 10
            else 0 end type_line,
                CASE
                    WHEN st_intersects(
                            st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                            ST_ExteriorRing(ST_Buffer(
                                    st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                                 proj),
                                    -600 * (scale_filter::int / 100000))))
                        THEN (CASE
                                  WHEN st_geometrytype(
                                               ST_Intersection(
                                                       st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs',
                                                                    proj),
                                                       ST_Buffer(st_transform(geometry_filter::geometry,
                                                                              '+proj=longlat +datum=WGS84 +no_defs',
                                                                              proj),
                                                                 -600 * (scale_filter::int / 100000))))
                                      = 'ST_MultiLineString'
                                      THEN st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj)
                                  else ST_Intersection(
                                          st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                          ST_Buffer(st_transform(geometry_filter::geometry,
                                                                 '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                    -600 * (scale_filter::int / 100000))) end
                        )

                    else st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj)
                    END as                         geom,

                CASE
                    WHEN st_intersects(
                                 st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                 ST_ExteriorRing(ST_Buffer(
                                         st_transform(geometry_filter::geometry, '+proj=longlat +datum=WGS84 +no_defs',
                                                      proj),
                                         -600 * (scale_filter::int / 100000))))
                        AND st_length(st_transform(
                                ST_Intersection(segleg.geom::geometry, geometry_filter::geometry),
                                '+proj=longlat +datum=WGS84 +no_defs',
                                proj)) < 2499 * (scale_filter::int / 100000)
                        THEN 0
                    WHEN st_length(st_transform(
                            ST_Intersection(segleg.geom::geometry, geometry_filter::geometry),
                            '+proj=longlat +datum=WGS84 +no_defs',
                            proj)) < 2500 * (scale_filter::int / 100000)
                        OR (
                                 st_intersects(
                                         st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                         ST_ExteriorRing(ST_Buffer(
                                                 st_transform(geometry_filter::geometry,
                                                              '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                 -600 * (scale_filter::int / 100000))))
                                 AND (st_length(st_transform(
                                     ST_Intersection(segleg.geom::geometry, geometry_filter::geometry),
                                     '+proj=longlat +datum=WGS84 +no_defs',
                                     proj)) < 3500
                                 OR
                                      st_length(st_transform(
                                              ST_Intersection(segleg.geom::geometry, geometry_filter::geometry),
                                              '+proj=longlat +datum=WGS84 +no_defs',
                                              proj)) < 3500 * (scale_filter::int / 100000)))
                        THEN 2.5
                    ELSE 3.0
                    END                            "size",

                case when segleg.length is null AND segleg.legtypearinc = 'TF' then
                coalesce(
                        round(st_length(st_transform(
                                st_makeline(prev_leg.pre_geom, sp.geom),
                                '+proj=longlat +datum=WGS84 +no_defs', proj))::numeric / 1000.0, 1),
                        segleg.length) else  segleg.length end            "length",
                CASE
                    WHEN segleg.uom_length IS NULL AND segleg.legtypearinc = 'TF' THEN 'KM'
                    ELSE segleg.uom_length
                    END                            uom_length,
                CASE
                    WHEN segleg.legtypearinc = 'TF'
                        THEN round(degrees(ST_Azimuth(
                            st_transform(prev_leg.pre_geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                            st_transform(sp.geom, '+proj=longlat +datum=WGS84 +no_defs', proj))))
                        - pre_arp.magneticVariation::double precision

                    ELSE segleg.course
                    END                            course,
                CASE
                    WHEN st_length(st_transform(
                            ST_Intersection(segleg.geom::geometry, geometry_filter::geometry),
                            '+proj=longlat +datum=WGS84 +no_defs',
                            proj)) < 2500 * (scale_filter::int / 100000)
                        OR (
                                 st_intersects(
                                         st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                         ST_ExteriorRing(ST_Buffer(
                                                 st_transform(geometry_filter::geometry,
                                                              '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                 -600 * (scale_filter::int / 100000))))
                                 AND (st_length(st_transform(
                                     ST_Intersection(segleg.geom::geometry, geometry_filter::geometry),
                                     '+proj=longlat +datum=WGS84 +no_defs',
                                     proj)) < 3500
                                 OR
                                      st_length(st_transform(
                                              ST_Intersection(segleg.geom::geometry, geometry_filter::geometry),
                                              '+proj=longlat +datum=WGS84 +no_defs',
                                              proj)) < 3500 * (scale_filter::int / 100000)))
                        THEN CASE
                                 WHEN segleg.angle is not null AND ( -- type_line 0
                                         NOT st_intersects(
                                                 st_transform(segleg.geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                 ST_ExteriorRing(ST_Buffer(
                                                         st_transform(geometry_filter::geometry,
                                                                      '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                         -600 * (scale_filter::int / 100000))))
                                         AND s.des_type != 'ICAO')
                                     THEN 51
                                 ELSE 5
                        END
                    END                            change,
                sp.identifier           nav_des_uuid
         FROM segmentleg_sid(arpname_filter, geometry_filter, procedname_filter, date_filter) segleg
                  left join  pre_arp on pre_arp.id = uuidAirportHeliport
                  LEFT JOIN sel_point_type s on s.id = segleg.identifier
                  LEFT JOIN prev_leg on prev_leg.seqnumberarinc = segleg.seqnumberarinc::integer - 1 AND
                                        prev_leg.nameprocedure = segleg.nameprocedure
                 LEFT JOIN segmentpoint_mat sp on  coalesce(segleg.startpoint, segleg.endpoint) = sp.startend

         where (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
                segleg."procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))
           AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
             OR array_intersect(segleg.transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

           AND segleg.nameAirportHeliport = arpname_filter
           AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR
                segleg.rnav = any (regexp_split_to_array(rnav_filter, ',')))
           AND (proclegtype_filter IS NULL OR NULLIF(proclegtype_filter, '') is NULL OR
                legtype = any (regexp_split_to_array(proclegtype_filter, ',')))
           AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
                segleg.nameprocedure = any (regexp_split_to_array(procedname_filter, ',')))

         group by segleg.identifier, proj, endconditiondesignator, legPath, segleg.legTypeARINC, course, courseType,
                  courseDirection, turnDirection,
                  segleg.speedLimit, segleg.speed_uom, segleg.speedReference, segleg.duration,
                  segleg.distance, segleg.distanceType, segleg.distancePointChoice, st_astext(st_transform(st_geomfromtext(segleg.geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
                  segleg.type_dist_nav, segleg.distance_navaid,
                  segleg.angle, segleg.angleType, segleg.anglePointChoice,
                  st_astext(st_transform(st_geomfromtext(segleg.geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
                  segleg.type_angle_nav, segleg.angle_navaid,
                  segleg.procedureTurnRequired, segleg.lowerLimit, segleg.lowerLimitReference, segleg.upperlimit,
                  segleg.upperlimitreference, segleg.altitudeInterpretation, "length", uom_length, verticalAngle, segleg."type",
                  thresholdAfterMAPT, heightmapt,
                  segleg.startPoint, segleg.endPoint, arcCentre, aircraftlandingcategory, uuidProcedure, legType, segleg.uuidAirportHeliport,
                  segleg.nameAirportHeliport, point_type, navaid, segleg.nameProcedure, segleg.beginPosition, segleg.rnav, type_line,
                  segleg.geom, sp.geom, "size", segleg.transitionId,
                  prev_leg.pre_geom, pre_arp.magneticVariation, sp.identifier, s.des_type)
select distinct identifier,
       endconditiondesignator,
       legPath,
       legTypeARINC,
       courseType,
       courseDirection,
       turnDirection,
       speedLimit,
       speed_uom,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       "length",
       uom_length,
       verticalAngle,
       "type",
       thresholdAfterMAPT,
       heightmapt,
       startPoint,
       endPoint,
       arcCentre,
       aircraftlandingcategory,
       uuidProcedure,
       legType,
       uuidAirportHeliport,
       nameAirportHeliport,
       nameProcedure,
       beginPosition,
       rnav,
       transitionId,
       "size",
       type_line,
       CASE WHEN course < 0 THEN course + 360 ELSE course END course,
       CASE
           WHEN st_geometrytype(geom) = 'ST_GeometryCollection' THEN null
           WHEN as_wkt::bool = FALSE THEN geom::varchar
           ELSE st_asewkt(geom) end as                        geom,
       point_type,
       navaid,
       change
            ,
      nav_des_uuid
FROM main_select;
$$;







--------------------


create function safealtitudearea_sid_map(arpname_filter character varying, transitionid_filter character varying, proceduretype_filter character varying, rnav_filter character, geometry_filter character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, centrepoint_nm character varying, uuidprocedure id, fromangle valbearingtype, toangle valbearingtype, angletype codebearingbasetype, angledirectionreference codedirectionreferencebasetype, innerdistance valdistancebasetype, innerdistance_uom uomdistancetype, outerdistance valdistancebasetype, outerdistance_uom uomdistancetype, upperlimit integer, upper_uom uomdistanceverticaltype, upperlimitreference codeverticalreferencetype, nameairportheliport character varying, beginposition datetype, geom character varying, xlbl double precision, ylbl double precision, proj character, nameprocedure character)
    immutable
    language sql
as
$$
with pre_arp as (
    select distinct proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter)))
      AND name = arpname_filter)
select distinct identifier,
       centerpoint_nm,
       uuidProcedure,
       fromAngle,
       toAngle,
       angleType,
       angleDirectionReference,
       innerDistance,
       innerdistance_uom,
       outerDistance,
       outerdistance_uom,
       upperLimit::int,
       upper_uom,
       upperLimitReference,
       nameAirportHeliport,
       beginPosition,
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
       (Select proj FROM pre_arp)::text                                                                              as proj,
       nameprocedure
from safealtitudeareasector_mat
where beginPosition <= (select * from set_date_filter(date_filter))
  and nameAirportHeliport = arpname_filter and procedure = proceduretype_filter
    and (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)
      AND
   (rnav_filter IS NULL OR NULLIF (rnav_filter,'') is NULL OR safealtitudeareasector_mat.rnav = any (regexp_split_to_array(rnav_filter, ',')));
$$;

-------------------------

create or replace function gridmora_sid_map(arpname_filter character varying, scale_filter integer, geometry_filter character varying,
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





--------------------segmentpoint_controlledangleind_sid_map - --FROM segmentpoint_mat - (радиалы \ пеленги от точки процедуры (nav \ despoint) до РНС)
----есть костыль от дублей в segmentpoint.name

create or replace function controlledangleind_sid_map(arpname_filter character varying, scale_filter integer, procedname_filter character varying DEFAULT NULL::character varying, transitionid_filter character varying DEFAULT NULL::character varying, proceduretype_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, type character varying, tp2 character varying, tp1 character varying, name character varying, uuidairportheliport id, nameairportheliport character varying, latitude character varying, longitude character varying, srid character varying, beginposition datetype, speedlimit character varying, speedreference character varying, duration character varying, distance character varying, distancetype character varying, distancepointchoice integer, geom_nav_distance character varying, type_distance_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, anglepointchoice integer, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, procedureturnrequired character varying, lowerlimit character varying, lowerlimitreference codeverticalreferencetype, upperlimit character varying, upperlimitreference codeverticalreferencetype, altitudeinterpretation codealtitudeusetype, rnav character varying, flyover codeyesnotype, role character varying, idsignificantpoint integer, he character varying, geom character varying, xlbl double precision, ylbl double precision, nameprocedure character varying)
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       "type",
       tp2,
       tp1,
       "name",
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       speedLimit,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       rnav,
       flyOver,
       "role",
       idsignificantpoint,
       he,


       CASE
           WHEN as_wkt::bool = FALSE THEN
       (case when  "type_angle_nav" = 'VOR_DME' then
        (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))   )   )
      else

       (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))) )

        end)::varchar

           ELSE st_asewkt(
                    (case when  "type_angle_nav" = 'VOR_DME' then
        (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))   )   )
      else

       (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))) )

        end)) END
                  as geom,

       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       nameprocedure
FROM segmentpoint_mat dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
  AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

  AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

  AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')))
  AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')))
  and "geom_nav_angle" is not null
  and
      ST_GeometryType(

           CASE
           WHEN as_wkt::bool = FALSE THEN
       (case when  "type_angle_nav" = 'VOR_DME' then
        (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))   )   )
      else

       (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))) )

        end)::varchar

           ELSE st_asewkt(
                    (case when  "type_angle_nav" = 'VOR_DME' then
        (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))   )   )
      else

       (ST_intersection(
        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    ) ,
        ST_buffer( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1100*(scale_filter::int/100000))) )

        end)) END




          ) = 'ST_LineString'
        and name is not null


GROUP BY identifier, designator, "type", tp2, tp1, "name", uuidAirportHeliport, nameAirportHeliport, latitude,
         longitude, srid, beginPosition, speedLimit, speedReference, duration, distance, distanceType,
         distancePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_dist_nav,
         distance_navaid,
         angle,
         angleType,
         anglePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_angle_nav, angle_navaid, procedureTurnRequired,
         lowerLimit, lowerLimitReference, upperlimit, upperlimitreference, altitudeInterpretation, rnav,
         flyOver, "role", idsignificantpoint, geom, proj, he, nameprocedure, geom_nav_angle ;
$$;


--------segmentpoint_controlleddistanceind_sid_map-----FROM segmentpoint_mat ---дистанции от точки процедуры (nav \ despoint) до РНС
----есть костыль от дублей в segmentpoint.name

create or replace function controlleddistanceind_sid_map(arpname_filter character varying, scale_filter integer, procedname_filter character varying DEFAULT NULL::character varying, transitionid_filter character varying DEFAULT NULL::character varying, proceduretype_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, type character varying, tp2 character varying, tp1 character varying, name character varying, uuidairportheliport id, nameairportheliport character varying, latitude character varying, longitude character varying, srid character varying, beginposition datetype, speedlimit character varying, speedreference character varying, duration character varying, distance character varying, distancetype character varying, distancepointchoice integer, geom_nav_distance character varying, type_distance_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, anglepointchoice integer, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, procedureturnrequired character varying, lowerlimit character varying, lowerlimitreference codeverticalreferencetype, upperlimit character varying, upperlimitreference codeverticalreferencetype, altitudeinterpretation codealtitudeusetype, rnav character varying, flyover codeyesnotype, role character varying, idsignificantpoint integer, he character varying, geom character varying, xlbl double precision, ylbl double precision, nameprocedure character varying)
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       "type",
       tp2,
       tp1,
       "name",
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       speedLimit,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       rnav,
       flyOver,
       "role",
       idsignificantpoint,
       he,


       CASE
           WHEN as_wkt::bool = FALSE THEN
               (
                   case
                       when ST_GeometryType(
                                    ST_intersection(
                                            ST_ExteriorRing(ST_buffer(
                                                    st_centroid(
                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))
                                                        ),
                                                    st_length(ST_makeline(
                                                            st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                            st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                         '+proj=longlat +datum=WGS84 +no_defs',
                                                                         proj))) / 2)),
                                            ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                      100*(scale_filter::int/100000))
                                        )
                                ) = 'ST_LineString'
                           then
                           ST_intersection(
                                   ST_ExteriorRing(ST_buffer(
                                           st_centroid(
                                                   ST_makeline(
                                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))
                                               ),
                                           st_length(ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2)),
                                   ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 100*(scale_filter::int/100000))
                               )


                       else
                           ST_ExteriorRing(ST_buffer(
                                   st_centroid(
                                           ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))
                                       ),
                                   st_length(ST_makeline(
                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2))
                       end
                   )::varchar



           ELSE st_asewkt(


                   case
                       when ST_GeometryType(
                                    ST_intersection(
                                            ST_ExteriorRing(ST_buffer(
                                                    st_centroid(
                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))
                                                        ),
                                                    st_length(ST_makeline(
                                                            st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                            st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                         '+proj=longlat +datum=WGS84 +no_defs',
                                                                         proj))) / 2)),
                                            ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                      100*(scale_filter::int/100000))
                                        )
                                ) = 'ST_LineString'
                           then
                           ST_intersection(
                                   ST_ExteriorRing(ST_buffer(
                                           st_centroid(
                                                   ST_makeline(
                                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))
                                               ),
                                           st_length(ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2)),
                                   ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 100*(scale_filter::int/100000))
                               )


                       else
                           ST_ExteriorRing(ST_buffer(
                                   st_centroid(
                                           ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))
                                       ),
                                   st_length(ST_makeline(
                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2))
                       end




               )
                END



                  as geom,

       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       nameprocedure
FROM segmentpoint_mat dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
  AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

  AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

  AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')))
  AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')))
  and "geom_nav_distance" is not null
  and ST_GeometryType(


             CASE
           WHEN as_wkt::bool = FALSE THEN
               (
                   case
                       when ST_GeometryType(
                                    ST_intersection(
                                            ST_ExteriorRing(ST_buffer(
                                                    st_centroid(
                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))
                                                        ),
                                                    st_length(ST_makeline(
                                                            st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                            st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                         '+proj=longlat +datum=WGS84 +no_defs',
                                                                         proj))) / 2)),
                                            ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                      100*(scale_filter::int/100000))
                                        )
                                ) = 'ST_LineString'
                           then
                           ST_intersection(
                                   ST_ExteriorRing(ST_buffer(
                                           st_centroid(
                                                   ST_makeline(
                                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))
                                               ),
                                           st_length(ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2)),
                                   ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 100*(scale_filter::int/100000))
                               )


                       else
                           ST_ExteriorRing(ST_buffer(
                                   st_centroid(
                                           ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))
                                       ),
                                   st_length(ST_makeline(
                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2))
                       end
                   )::varchar



           ELSE st_asewkt(


                   case
                       when ST_GeometryType(
                                    ST_intersection(
                                            ST_ExteriorRing(ST_buffer(
                                                    st_centroid(
                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))
                                                        ),
                                                    st_length(ST_makeline(
                                                            st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                            st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                         '+proj=longlat +datum=WGS84 +no_defs',
                                                                         proj))) / 2)),
                                            ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                      100*(scale_filter::int/100000))
                                        )
                                ) = 'ST_LineString'
                           then
                           ST_intersection(
                                   ST_ExteriorRing(ST_buffer(
                                           st_centroid(
                                                   ST_makeline(
                                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))
                                               ),
                                           st_length(ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2)),
                                   ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 100*(scale_filter::int/100000))
                               )


                       else
                           ST_ExteriorRing(ST_buffer(
                                   st_centroid(
                                           ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))
                                       ),
                                   st_length(ST_makeline(
                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2))
                       end




               )
                END


          ) = 'ST_LineString' and name is not null
GROUP BY identifier, designator, "type", tp2, tp1, "name", uuidAirportHeliport, nameAirportHeliport, latitude,
         longitude, srid, beginPosition, speedLimit, speedReference, duration, distance, distanceType,
         distancePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_dist_nav,
         distance_navaid,
         angle,
         angleType,
         anglePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_angle_nav, angle_navaid, procedureTurnRequired,
         lowerLimit, lowerLimitReference, upperlimit, upperlimitreference, altitudeInterpretation, rnav,
         flyOver, "role", idsignificantpoint, geom, proj, he, nameprocedure, geom_nav_distance ;
$$;








----ignore!!!!
/*
create or replace function controlledangleind_navaid_sid_map(arpname_filter character varying, procedname_filter character varying DEFAULT NULL::character varying, transitionid_filter character varying DEFAULT NULL::character varying, proceduretype_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, type character varying, tp2 character varying, tp1 character varying, name character varying, uuidairportheliport id, nameairportheliport character varying, latitude character varying, longitude character varying, srid character varying, beginposition datetype, speedlimit character varying, speedreference character varying, duration character varying, distance character varying, distancetype character varying, distancepointchoice integer, geom_nav_distance character varying, type_distance_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, anglepointchoice integer, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, procedureturnrequired character varying, lowerlimit character varying, lowerlimitreference codeverticalreferencetype, upperlimit character varying, upperlimitreference codeverticalreferencetype, altitudeinterpretation codealtitudeusetype, rnav character varying, flyover codeyesnobasetype, role character varying, idsignificantpoint integer, he character varying, geom character varying, xlbl double precision, ylbl double precision, nameprocedure character varying)
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       "type",
       tp2,
       tp1,
       "name",
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       speedLimit,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       rnav,
       flyOver,
       "role",
       idsignificantpoint,
       he,


       CASE
           WHEN as_wkt::bool = FALSE THEN
       (case when  "type_angle_nav" = 'VOR_DME' then

        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    )
      else


        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    )

        end)::varchar

           ELSE st_asewkt(
                    (case when  "type_angle_nav" = 'VOR_DME' then

        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    )
      else


        ST_makeline( st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
            st_transform(ST_geomfromtext( "geom_nav_angle"), '+proj=longlat +datum=WGS84 +no_defs', proj)    )

        end)) END
                  as geom,

       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       nameprocedure
FROM controlledangleind_navaid_mat dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
  AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

  AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

  AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')))
  AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')))
  and "geom_nav_angle" is not null
GROUP BY identifier, designator, "type", tp2, tp1, "name", uuidAirportHeliport, nameAirportHeliport, latitude,
         longitude, srid, beginPosition, speedLimit, speedReference, duration, distance, distanceType,
         distancePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_dist_nav,
         distance_navaid,
         angle,
         angleType,
         anglePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_angle_nav, angle_navaid, procedureTurnRequired,
         lowerLimit, lowerLimitReference, upperlimit, upperlimitreference, altitudeInterpretation, rnav,
         flyOver, "role", idsignificantpoint, geom, proj, he, nameprocedure, geom_nav_angle ;
$$;



create or replace function controlleddistanceind_navaid_sid_map(arpname_filter character varying, procedname_filter character varying DEFAULT NULL::character varying, transitionid_filter character varying DEFAULT NULL::character varying, proceduretype_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, type character varying, tp2 character varying, tp1 character varying, name character varying, uuidairportheliport id, nameairportheliport character varying, latitude character varying, longitude character varying, srid character varying, beginposition datetype, speedlimit character varying, speedreference character varying, duration character varying, distance character varying, distancetype character varying, distancepointchoice integer, geom_nav_distance character varying, type_distance_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, anglepointchoice integer, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, procedureturnrequired character varying, lowerlimit character varying, lowerlimitreference codeverticalreferencetype, upperlimit character varying, upperlimitreference codeverticalreferencetype, altitudeinterpretation codealtitudeusetype, rnav character varying, flyover codeyesnobasetype, role character varying, idsignificantpoint integer, he character varying, geom character varying, xlbl double precision, ylbl double precision, nameprocedure character varying)
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       "type",
       tp2,
       tp1,
       "name",
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       speedLimit,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       rnav,
       flyOver,
       "role",
       idsignificantpoint,
       he,


       CASE
           WHEN as_wkt::bool = FALSE THEN
               (

                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))

                               )::varchar





           ELSE st_asewkt(



                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))) end as geom,

       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       nameprocedure
FROM controlledangleind_navaid_mat dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
  AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

  AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

  AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')))
  AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')))
  and "geom_nav_distance" is not null
GROUP BY identifier, designator, "type", tp2, tp1, "name", uuidAirportHeliport, nameAirportHeliport, latitude,
         longitude, srid, beginPosition, speedLimit, speedReference, duration, distance, distanceType,
         distancePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_dist_nav,
         distance_navaid,
         angle,
         angleType,
         anglePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_angle_nav, angle_navaid, procedureTurnRequired,
         lowerLimit, lowerLimitReference, upperlimit, upperlimitreference, altitudeInterpretation, rnav,
         flyOver, "role", idsignificantpoint, geom, proj, he, nameprocedure, geom_nav_distance ;
$$;



create or replace function controlleddistanceind_sid_map(arpname_filter character varying, procedname_filter character varying DEFAULT NULL::character varying, transitionid_filter character varying DEFAULT NULL::character varying, proceduretype_filter character varying DEFAULT NULL::character varying, rnav_filter character varying DEFAULT NULL::character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, type character varying, tp2 character varying, tp1 character varying, name character varying, uuidairportheliport id, nameairportheliport character varying, latitude character varying, longitude character varying, srid character varying, beginposition datetype, speedlimit character varying, speedreference character varying, duration character varying, distance character varying, distancetype character varying, distancepointchoice integer, geom_nav_distance character varying, type_distance_nav character varying, distance_navaid character varying, angle valbearingtype, angletype character varying, anglepointchoice integer, geom_nav_angle character varying, type_angle_nav character varying, angle_navaid character varying, procedureturnrequired character varying, lowerlimit character varying, lowerlimitreference codeverticalreferencetype, upperlimit character varying, upperlimitreference codeverticalreferencetype, altitudeinterpretation codealtitudeusetype, rnav character varying, flyover codeyesnobasetype, role character varying, idsignificantpoint integer, he character varying, geom character varying, xlbl double precision, ylbl double precision, nameprocedure character varying)
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select identifier,
       designator,
       "type",
       tp2,
       tp1,
       "name",
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       speedLimit,
       speedReference,
       duration,
       distance,
       distanceType,
       distancePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_distance,
       type_dist_nav,
       distance_navaid,
       angle,
       angleType,
       anglePointChoice,
       st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)) as geom_nav_angle,
       type_angle_nav,
       angle_navaid,
       procedureTurnRequired,
       lowerLimit,
       lowerLimitReference,
       upperlimit,
       upperlimitreference,
       altitudeInterpretation,
       rnav,
       flyOver,
       "role",
       idsignificantpoint,
       he,


       CASE
           WHEN as_wkt::bool = FALSE THEN
               (
                   case
                       when ST_GeometryType(
                                    ST_intersection(
                                            ST_ExteriorRing(ST_buffer(
                                                    st_centroid(
                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))
                                                        ),
                                                    st_length(ST_makeline(
                                                            st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                            st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                         '+proj=longlat +datum=WGS84 +no_defs',
                                                                         proj))) / 2)),
                                            ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                      1500)
                                        )
                                ) = 'ST_LineString'
                           then
                           ST_intersection(
                                   ST_ExteriorRing(ST_buffer(
                                           st_centroid(
                                                   ST_makeline(
                                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))
                                               ),
                                           st_length(ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2)),
                                   ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1500)
                               )


                       else
                           ST_ExteriorRing(ST_buffer(
                                   st_centroid(
                                           ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))
                                       ),
                                   st_length(ST_makeline(
                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2))
                       end
                   )::varchar



           ELSE st_asewkt(


                   case
                       when ST_GeometryType(
                                    ST_intersection(
                                            ST_ExteriorRing(ST_buffer(
                                                    st_centroid(
                                                            ST_makeline(
                                                                    st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                                    st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                                 '+proj=longlat +datum=WGS84 +no_defs',
                                                                                 proj))
                                                        ),
                                                    st_length(ST_makeline(
                                                            st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                            st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                         '+proj=longlat +datum=WGS84 +no_defs',
                                                                         proj))) / 2)),
                                            ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                      1500)
                                        )
                                ) = 'ST_LineString'
                           then
                           ST_intersection(
                                   ST_ExteriorRing(ST_buffer(
                                           st_centroid(
                                                   ST_makeline(
                                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))
                                               ),
                                           st_length(ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2)),
                                   ST_buffer(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj), 1500)
                               )


                       else
                           ST_ExteriorRing(ST_buffer(
                                   st_centroid(
                                           ST_makeline(
                                                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                                   st_transform(ST_geomfromtext("geom_nav_distance"),
                                                                '+proj=longlat +datum=WGS84 +no_defs', proj))
                                       ),
                                   st_length(ST_makeline(
                                           st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj),
                                           st_transform(ST_geomfromtext("geom_nav_distance"),
                                                        '+proj=longlat +datum=WGS84 +no_defs', proj))) / 2))
                       end




               )
                END



                  as geom,

       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl,
       nameprocedure
FROM controlledangleind_mat dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
  AND (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')))

  AND (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)

  AND (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')))
  AND (rnav_filter IS NULL OR NULLIF(rnav_filter, '') is NULL OR rnav = any (regexp_split_to_array(rnav_filter, ',')))
  and "geom_nav_distance" is not null
GROUP BY identifier, designator, "type", tp2, tp1, "name", uuidAirportHeliport, nameAirportHeliport, latitude,
         longitude, srid, beginPosition, speedLimit, speedReference, duration, distance, distanceType,
         distancePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_distance),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_dist_nav,
         distance_navaid,
         angle,
         angleType,
         anglePointChoice,
         st_astext(st_transform(st_geomfromtext(geom_nav_angle),'+proj=longlat +datum=WGS84 +no_defs', proj)),
         type_angle_nav, angle_navaid, procedureTurnRequired,
         lowerLimit, lowerLimitReference, upperlimit, upperlimitreference, altitudeInterpretation, rnav,
         flyOver, "role", idsignificantpoint, geom, proj, he, nameprocedure, geom_nav_distance ;
$$;

*/

---#24891 Возвращает все WP (точки участвующие в процедурах). Фильтр: наименование аэродрома.
create function designatedpoint_info_map(arpname_filter character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator character varying, latitude character varying, longitude character varying, srid character varying, beginposition datetype, role character varying, geom character varying)
    immutable
    language sql
as
$$
with arp as (
    select identifier uuid, proj
    FROM airportheliport_mat
    where beginposition <= ((select * FROM set_date_filter(date_filter))))
select distinct identifier,
       designator,
       latitude,
       longitude,
       srid,
       beginPosition,
       replace(replace(role::text, '(,'::text, ''::text), ')'::text, ''::text) as role,
       CASE
           WHEN as_wkt::bool = FALSE THEN st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(
                   st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END                           as geom

FROM designatedpoint_mat_procedure dsgn
         join arp on arp.uuid = dsgn.uuidairportheliport
where beginposition <= (select * FROM set_date_filter(date_filter))
  AND (nameAirportHeliport = arpname_filter or nameAirportHeliport is null)
GROUP BY identifier, designator, latitude,
         longitude, srid, beginPosition,  "role", geom, arp.proj;
$$;



---#24892. Все средства участвующие в процедурах, также с пометкой трассовые. Фильтр: наименование аэродрома.
create function navaid_info_map(arpname_filter character varying, as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id, designator codenavaiddesignatortype, name textnametype, type character varying, frequency character varying, latitude character varying, longitude character varying, srid character varying, present character varying, beginposition datetype, geom character varying)
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
       frequency,
       latitude,
       longitude,
       srid,
       navaid_mat.name || ' ' || navaid_mat.designator || ' ' || navaid_mat.type as present,
       beginposition,
       case
           when as_wkt::bool = FALSE
               then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', (Select proj from pre_arp))::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs',
                                       (Select proj from pre_arp))) END                                              as geom
FROM navaid_mat
WHERE beginposition <= ((select * from set_date_filter(date_filter)))
    AND (nameAirportHeliport = arpname_filter)
GROUP BY identifier,
       designator,
       name,
       type,
       frequency,
       latitude,
       longitude,
       srid, navaid_mat.name || ' ' || navaid_mat.designator || ' ' || navaid_mat.type, beginposition, geom ;
$$;



