create or replace function airportheliport_sid(arpname_filter character varying,
                                    type_filter character varying DEFAULT NULL::character varying,
                                    as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier        id,
                type              character,
                name              character,
                name_ru           character,
                designator        codeairportheliportdesignatortype,
                status            character,
                controltype       character,
                privateuse        character,
                elevation         character,
                uom_elevation     uomdistanceverticaltype,
                magneticvariation character,
                latitude          character,
                longitude         character,
                srid              character,
                geom              character varying,
                beginposition     datetype,
                fr                character,
                fr_ru             character,
                proj              character,
                xlbl              double precision,
                ylbl              double precision
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
           WHEN as_wkt::bool = FALSE then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END                    as geom,
       beginposition,
       fr,
       fr_ru,
       proj::text                                                                                                 as proj,
       ST_X(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as xlbl,
       ST_Y(ST_Centroid(ST_GeomFromewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)))) +
       1000                                                                                                       as ylbl
FROM airportheliport_mat
WHERE beginposition <= ((select * FROM set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * FROM set_date_filter(date_filter)))
  AND (type_filter IS NULL OR NULLIF(type_filter, '') is NULL OR "type" = any (regexp_split_to_array(type_filter, ',')))
  AND "name" = arpname_filter;
$$;




create or replace function runway_sid(arpname_filter character varying, date_filter datetype DEFAULT NULL::date)
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
                uuidairportheliport id,
                nameairportheliport textnametype,
                beginposition       datetype,
                widthshoulder       character varying,
                geom                geometry
            )
    immutable
    language sql
as
$$
select distinct identifier,
                designator,
                "type",
                "length",
                width,
                composition,
                pavementTypePCN,
                pavementSubgradePCN,
                maxTyrePressurePCN,
                evaluationMethodPCN,
                classpcn,
                uuidAirportHeliport,
                nameAirportHeliport,
                beginPosition,
                case
                    when (widthshoulder).value is not null then concat((widthshoulder).value, ' ', (widthshoulder).unit)
                    else (widthshoulder).nilreason
                    end             widthShoulder,
                (case
                     when st_intersects(geom,
                                        st_setsrid(st_makeline(ST_MakePoint(180, -90), ST_MakePoint(-180, 90)), 4326))
                         then ST_ShiftLongitude(geom)
                     else geom end) geom
FROM runway_mat
where beginposition <= ((select * FROM set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  and nameAirportHeliport = arpname_filter;
$$;

create or replace function runwaydirection_sid(arpname_filter character varying, runway_designator_filter character varying,
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
                geom                      character varying,
                elevationtdz              character varying,
                elevation                 numeric,
                elevation_uom             character varying,
                role                      character varying
            )
    immutable
    language sql
as
$$
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
       case
           when as_wkt::bool = FALSE then geom::varchar
           ELSE st_asewkt(geom) end as              geom,
       case
           when (elevationTDZ).value is not NULL
               then concat((elevationTDZ).value, ' ', (elevationTDZ).unit)
           else (elevationTDZ).nonnumeric
           end                                      elevationTDZ,
       floor(elevation),
       elevation_uom,
       coalesce(("role").value, ("role").nilreason) "role"

from runwaydirection_mat
where beginposition <= ((select * from set_date_filter(date_filter)))
  ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
  and nameAirportHeliport = arpname_filter
  and runway_designator = runway_designator_filter;
$$;

create or replace function procedure_sid(arpname_filter character varying, transitionid_filter character varying,
                              proceduretype_filter character varying DEFAULT NULL::character varying,
                              as_wkt character varying DEFAULT true, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier                id,
                codingstandard            codeprocedurecodingstandardtype,
                name                      character,
                rnav                      codeyesnobasetype,
                designator                character,
                transitionid              codedesignatedpointdesignatortype[],
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
                instruction               character varying,
                gradient_air              character varying,
                gradient_obs              character varying,
                geom                      character varying
            )
    immutable
    language sql
as
$$
with arp as (
    select identifier as uuid, proj
    from airportheliport_mat
    where beginposition <= ((select * from set_date_filter(date_filter))))
     ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter))))
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
       courseReversalInstruction,
       additionalEquipment,
       channelGNSS,
       WAASReliable,
       uuidAirportHeliport                                                                        uuidAirportHeliport,
       nameAirportHeliport,
       "procedure",
       beginPosition,
       instruction,
       gradient_air,
       gradient_obs,
       CASE
           WHEN as_wkt::bool = FALSE then st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)::varchar
           ELSE st_asewkt(st_transform(geom, '+proj=longlat +datum=WGS84 +no_defs', proj)) END as geom
from procedure_mat proc
         join arp on arp.uuid = proc.uuidairportheliport
where beginposition <= (select * from set_date_filter(date_filter))
  and (transitionid_filter IS NULL OR NULLIF(transitionid_filter, '') is NULL
    OR array_intersect(transitionId, regexp_split_to_array(transitionid_filter, ',')) IS NOT NULL)
  and nameAirportHeliport = arpname_filter
  and (proceduretype_filter IS NULL OR NULLIF(proceduretype_filter, '') is NULL OR
       "procedure" = any (regexp_split_to_array(proceduretype_filter, ',')));
$$;
-------------------


create or replace function safealtitudearea_sid(arpname_filter character varying, date_filter datetype DEFAULT NULL::date, procedname_filter character varying DEFAULT NULL::character varying)
    returns TABLE
            (
                centerpoint_nm          varchar,
                uuidprocedure           id,
                fromangle               valbearingtype,
                toangle                 valbearingtype,
                angletype               codebearingbasetype,
                angledirectionreference codedirectionreferencebasetype,
                innerdistance           valdistancebasetype,
                innerdistance_uom       uomdistancetype,
                outerdistance           valdistancebasetype,
                outerdistance_uom       uomdistancetype,
                upperlimit              integer,
                upper_uom               uomdistanceverticaltype,
                upperlimitreference     codeverticalreferencetype,
                nameairportheliport     character varying,
                beginposition           datetype
            )
    immutable
    language sql
as
$$
select distinct (case when length(centerpoint_nm)=4 then 'ARP' else centerpoint_nm end  ) ,
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
       beginPosition
from safealtitudeareasector_mat
where beginPosition <= (select * from set_date_filter(date_filter))
  and nameAirportHeliport = arpname_filter
  and nameprocedure = procedname_filter;
$$;

-----------------


create or replace function segmentleg_sid(arpname_filter character varying, geometry_filter character varying,
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
                geom_nav_distance       character varying,
                type_dist_nav           character varying,
                distance_navaid         character varying,
                angle                   valbearingtype,
                angletype               character varying,
                anglepointchoice        integer,
                geom_nav_angle          character varying,
                type_angle_nav          character varying,
                angle_navaid            character varying,
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
                navaid                  character varying

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
       navaid
from segmentleg_mat
where beginPosition <= (select * from set_date_filter(date_filter))
  and ST_Intersects(geom, geometry_filter::geometry)
  and nameAirportHeliport = arpname_filter
  and (procedname_filter IS NULL OR NULLIF(procedname_filter, '') is NULL OR
       nameProcedure = any (regexp_split_to_array(procedname_filter, ',')));
$$;

