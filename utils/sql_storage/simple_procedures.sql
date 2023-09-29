create or replace function airspace_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                type                character,
                nm                  codeairspacedesignatortype,
                nl                  textnametype,
                nl_ru               character varying,
                tp                  character varying,
                upperlimit          character,
                lowerlimit          character,
                lowerlimitreference character,
                upperlimitreference character,
                lowerlimit_ft       numeric,
                upperlimit_ft       numeric,
                upperincludingvalue boolean,
                lowerincludingvalue boolean,
                he                  character varying,
                status              character varying,
                class               codeairspaceclassificationtype,
                beginposition       datetype,
                endposition         datetype,
                "time"              text,
                geom                geometry,
                cs_tf_ru            character varying,
                cs_tf               character varying
            )
    immutable
    language sql
as
$$
select *
FROM airspace_mat
WHERE beginposition <= (select * FROM set_date_filter(date_filter))
  AND (endposition > (select * FROM set_date_filter(date_filter)) OR endposition is NULL);
$$;



create or replace function holdingpattern_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE(identifier id,
     idsegmentpoint integer,
      type codeholdingusagebasetype,
       outboundcourse integer,
        outboundcoursetype codecoursebasetype,
         inboundcourse integer,
          inboundcoursetype codecoursebasetype,
           turndirection codedirectionturntype,
            upperlimit character varying,
             lowerlimit character varying,
              lowerlimitreference character varying,
               upperlimitreference character varying,
                lowerlimit_ft numeric,
                 upperlimit_ft numeric,
                  upperincludingvalue boolean,
                   lowerincludingvalue boolean,
                    duration character varying,
                     speedlimit integer,
                      speed_uom character varying,
                       fix_name character varying,
                        length text,
                        length_uom text,
                         he character varying,
                          geom geometry,
                           beginposition datetype,
                            endposition datetype)
    immutable
    language sql
as
$$
select * FROM holdingpattern_mat
WHERE beginposition <= (select * FROM set_date_filter(date_filter))
          AND (endposition > (select * FROM set_date_filter(date_filter)) OR endposition is NULL);
$$;




create or replace function localizer_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier                id,
                frequency                 character varying,
                magneticbearing           valbearingtype,
                magneticbearingaccuracy   valangletype,
                truebearing               valbearingtype,
                declination               valmagneticvariationtype,
                truebearingaccuracy       valangletype,
                widthcourse               valangletype,
                widthcourseaccuracy       valangletype,
                backcourseusable          codeilsbackcoursetype,
                designator                codenavaiddesignatortype,
                name                      textnametype,
                emissionclass             coderadioemissiontype,
                mobile                    codeyesnotype,
                magneticvariation         valmagneticvariationtype,
                magneticvariationaccuracy valangletype,
                datemagneticvariation     dateyeartype,
                flightchecked             codeyesnotype,
                idsignificantpoint          integer,
                uuidairportheliport       id,
                nameairportheliport       textnametype,
                beginposition             datetype,
                endposition               datetype,
                geom                      geometry
            )
    immutable
    language sql
as
$$
select *
FROM localizer_mat
WHERE beginposition <= (select * FROM set_date_filter(date_filter))
  AND (endposition > (select * FROM set_date_filter(date_filter)) OR endposition is NULL);
$$;



create or replace function markerbeacon_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                class               codemarkerbeaconsignaltype,
                frequency           character varying,
                axisbearing         valbearingtype,
                auralmorsecode      codeauralmorsetype,
                designator          codenavaiddesignatortype,
                magneticvariation   numeric,
                latitude            character,
                longitude           character,
                srid                integer,
                uuidairportheliport id,
                nameairportheliport textnametype,
                beginposition       datetype,
                endposition         datetype,
                geom                geometry
            )
    immutable
    language sql
as
$$
select *
FROM markerbeacon_mat
WHERE beginposition <= (select * FROM set_date_filter(date_filter))
  AND (endposition > (select * FROM set_date_filter(date_filter)) OR endposition is NULL);
$$;

alter function markerbeacon_all(datetype) owner to "nav-user";

create or replace function navaid_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier           id,
                designator           codenavaiddesignatortype,
                name                 textnametype,
                type                 character varying,
                elevation            character varying,
                frequency            character varying,
                magneticvariation    character varying,
                classndb             codendbusagetype,
                zerobearingdirection codenorthreferencetype,
                declination          character varying,
                typedme              codedmetype,
                latitude             character varying,
                longitude            character varying,
                srid                 character varying,
                uuidairportheliport  id,
                nameairportheliport  textnametype,
                beginposition        datetype,
                endposition          datetype,
                geom                 geometry,
                idsignificantpoint   integer
            )
    immutable
    language sql
as
$$
select *
FROM navaid_mat
WHERE beginposition <= (select * FROM set_date_filter(date_filter))
  AND (endposition > (select * FROM set_date_filter(date_filter)) OR endposition is NULL);
$$;

alter function navaid_all(datetype) owner to "nav-user";

create or replace function procedure_all(date_filter datetype DEFAULT NULL::date)
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
                landing                   integer,
                final_profile             integer,
                geom                      geometry,
                beginposition             datetype,
                endposition               datetype
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
       courseReversalInstruction,
       additionalEquipment,
       channelGNSS,
       WAASReliable,
       uuidAirportHeliport,
       nameAirportHeliport,
       "procedure",
       landing,
       final_profile,
       geom,
       beginPosition,
       endPosition
from procedure_mat
WHERE beginposition <= (select * from set_date_filter(date_filter))
  AND (endposition > (select * from set_date_filter(date_filter)) OR endposition is NULL);
$$;

alter function procedure_all(datetype) owner to "nav-user";


create or replace function routesegment_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                country             character varying,
                widthleft           valdistancetype,
                widthright          valdistancetype,
                nm                  textdesignatortype,
                internationaluse    coderouteorigintype,
                lb                  valdistancebasetype,
                lb_unit             uomdistancetype,
                mta                 valbearingtype,
                rmta                valbearingtype,
                he                  character varying,
                beginposition       datetype,
                endposition         datetype,
                geom                geometry,
                upperlimit          text,
                lowerlimit          text,
                upperlimitreference text,
                lowerlimitreference text,
                upperincludingvalue boolean,
                lowerincludingvalue boolean,
                lowerlimit_ft       numeric,
                upperlimit_ft       numeric,
                ps                  character varying,
                pe                  character varying,
                sg_text             character varying,
                wd                  character varying,
                sogl                integer,
                start_point         integer,
                end_point           integer
            )
    immutable
    language sql
as
$$
select *
from routesegment_mat
WHERE beginposition <= (select * from set_date_filter(date_filter))
  AND (endposition > (select * from set_date_filter(date_filter)) OR endposition is NULL);
$$;



create or replace function runway_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier          id,
                designator          textdesignatortype,
                type                coderunwaytype,
                length              text,
                width               text,
                composition         codesurfacecompositionbasetype,
                pavementtypepcn     codepcnpavementtype,
                pavementsubgradepcn codepcnsubgradetype,
                maxtyrepressurepcn  codepcntyrepressuretype,
                evaluationmethodpcn codepcnmethodtype,
                classpcn            valpcntype,
                widthshoulder       valdistancetype,
                uuidairportheliport id,
                nameairportheliport textnametype,
                beginposition       datetype,
                endposition datetype,
                geom                geometry
            )
    immutable
    language sql
as
$$
select *
from runway_mat
WHERE beginposition <= (select * from set_date_filter(date_filter))
  AND (endposition > (select * from set_date_filter(date_filter)) OR endposition is NULL);
$$;



create or replace function verticalstructure_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier    integer,
               ---- trid          character varying,
                type_obs      codeverticalstructuretype,
                name          textnametype,
                ab            text,
                ta            text,
                le            character varying,
                geom          geometry,
                longitude     numeric,
                latitude      numeric,
                srid          integer,
                beginposition datetype,
                endposition   datetype
            )
    immutable
    language sql
as
$$
select identifier,
       ---trID,
       type_obs,
       "name",
       ab,
       ta,
       le,
       geom,
       longitude,
       latitude,
       srid,
       beginPosition,
       endPosition
from verticalstructure_mat
WHERE beginposition <= (select * from set_date_filter(date_filter))
  AND (endposition > (select * from set_date_filter(date_filter)) OR endposition is NULL);
$$;



create or replace function designatedpoint_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier             id,
                designator             character varying,
                type                   character varying,
                idsignificantpoint     integer,
                tp2                    character varying,
                tp1                    character varying,
                name                   character varying,
                uuidairportheliport    id,
                nameairportheliport    character varying,
                latitude               character varying,
                longitude              character varying,
                srid                   character varying,
                beginposition          datetype,
                endposition            datetype,
                geom                   geometry,
                speedlimit             character varying,
                speedreference         character varying,
                duration               character varying,
                distance               character varying,
                distancetype           character varying,
                distancepointchoice    integer,
                geom_nav_distance      character varying,
                angle                  valbearingtype,
                angletype              character varying,
                anglepointchoice       integer,
                geom_nav_angle         character varying,
                procedureturnrequired  character varying,
                lowerlimit             character varying,
                lowerlimitreference    codeverticalreferencetype,
                upperlimit             character varying,
                upperlimitreference    codeverticalreferencetype,
                altitudeinterpretation codealtitudeusetype,
                rnav                   character varying,
                transitionid           codedesignatedpointdesignatortype[],
                procedure              character varying,
                nameprocedure          character varying,
                related_segmentleg     id,
                flyover                codeyesnotype,
                role                   character varying
            )
    immutable
    language sql
as
$$
select identifier,
       designator,
       "type",
       idSignificantpoint,
       tp2,
       tp1,
       name,
       uuidAirportHeliport,
       nameAirportHeliport,
       latitude,
       longitude,
       srid,
       beginPosition,
       endPosition,
       geom,
       speedlimit,
       speedreference,
       duration,
       distance,
       distancetype,
       distancepointchoice,
       geom_nav_distance,
       angle,
       angletype,
       anglepointchoice,
       geom_nav_angle,
       procedureturnrequired,
       lowerlimit,
       lowerlimitreference,
       upperlimit,
       upperlimitreference,
       altitudeinterpretation,
       rnav,
       transitionid,
       "procedure",
       nameProcedure,
       related_segmentleg,
       flyOver,
       role
from designatedpoint_mat
WHERE beginposition <= (select * from set_date_filter(date_filter))
  AND (endposition > (select * from set_date_filter(date_filter)) OR endposition is NULL);
$$;

alter function designatedpoint_all(datetype) owner to "nav-user";

create or replace function airportheliport_all(date_filter datetype DEFAULT NULL::date,
                                    arpname_filter character varying DEFAULT NULL::character varying,
                                    designator_filter character varying DEFAULT NULL::character varying,
                                    type_filter character varying DEFAULT NULL::character varying)
    returns TABLE
            (
                identifier         id,
                type               character,
                name               character,
                name_ru            character,
                designator         codeairportheliportdesignatortype,
                designatoriata     character,
                status             character,
                controltype        character,
                privateuse         character,
                elevation          character,
                uom_elevation      uomdistanceverticaltype,
                magneticvariation  character,
                radio              jsonb,
                latitude           character,
                longitude          character,
                srid               character,
                city               character varying,
                geom               geometry,
                beginposition      datetype,
                endposition        datetype,
                fr                 character,
                fr_ru              character,
                transitionaltitude text,
                transitionlevel    text,
                proj               character
            )
    immutable
    language sql
as
$$
select *
FROM airportheliport_mat
WHERE beginposition <= (select * FROM set_date_filter(date_filter))
  AND (type_filter IS NULL OR NULLIF(type_filter, '') is NULL OR "type" = any (regexp_split_to_array(type_filter, ',')))
  and (arpname_filter IS NULL OR NULLIF(arpname_filter, '') is NULL OR
       "name" = any (regexp_split_to_array(arpname_filter, ',')))
  and (designator_filter IS NULL OR NULLIF(designator_filter, '') is NULL OR
       "designator" = any (regexp_split_to_array(designator_filter, ',')));  ;
$$;



create or replace function specialnavigationstation_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier id,
                type       text,
                latitude   text,
                longitude  text,
                geom       geometry
            )
    immutable
    language sql
as
$$
select identifier, "type", latitude, longitude, geom
from specialnavigationstation_mat;
$$;


---ignore (временно, сейчас нигде не используется)
-- create or replace function segmentleg_all(date_filter datetype DEFAULT NULL::date)
--     returns TABLE
--             (
--                 identifier              id,
--                 endconditiondesignator  character varying,
--                 legpath                 character varying,
--                 legtypearinc            character varying,
--                 course                  valbearingtype,
--                 coursetype              character varying,
--                 coursedirection         character varying,
--                 turndirection           codedirectionturntype,
--                 speedlimit              character varying,
--                 speed_uom               character varying,
--                 speedreference          character varying,
--                 duration                character varying,
--                 distance                character varying,
--                 distancetype            character varying,
--                 distancepointchoice     integer,
--                 geom_nav_distance       character varying,
--                 type_dist_nav           codenavaidservicetype,
--                 distance_navaid         codenavaiddesignatortype,
--                 angle                   valbearingtype,
--                 angletype               character varying,
--                 anglepointchoice        integer,
--                 geom_nav_angle          character varying,
--                 type_angle_nav          codenavaidservicetype,
--                 angle_navaid            codenavaiddesignatortype,
--                 procedureturnrequired   character varying,
--                 lowerlimit              character varying,
--                 lowerlimitreference     codeverticalreferencetype,
--                 upperlimit              character varying,
--                 upperlimitreference     codeverticalreferencetype,
--                 altitudeinterpretation  codealtitudeusetype,
--                 length                  numeric,
--                 uom_length              uomdistancetype,
--                 verticalangle           valangletype,
--                 type                    character varying,
--                 thresholdaftermapt      character varying,
--                 heightmapt              character varying,
--                 geom                    geometry,
--                 startend                integer,
--                 startpoint              integer,
--                 endpoint                integer,
--                 arccentre               integer,
--                 aircraftlandingcategory character varying,
--                 uuidprocedure           id,
--                 legtype                 character varying,
--                 departureleg            id,
--                 uuidairportheliport     uuid,
--                 nameairportheliport     character varying,
--                 nameprocedure           character varying,
--                 beginposition           datetype,
--                 endposition             datetype,
--                 procedure               character varying,
--                 transitionid            codedesignatedpointdesignatortype[],
--                 rnav                    character varying,
--                 proc_geom               geometry,
--                 seqnumberarinc          nosequencebasetype,
--                 point_type              character varying,
--                 navaid                  character varying,
--                 role codeprocedurefixroletype
--             )
--     immutable
--     language sql
-- as
-- $$
-- select *
-- from segmentleg_mat
-- WHERE beginposition <= (select * from set_date_filter(date_filter))
--   AND (endposition > (select * from set_date_filter(date_filter)) OR endposition is NULL);
-- $$;



create or replace function runwaydirection_all(date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                identifier                id,
                designator                textdesignatortype,
                truebearing               valbearingtype,
                magneticbearing           valbearingtype,
                precisionapproachguidance codeapproachguidancetype,
                elevationtdz              valdistanceverticaltype,
                elevation                 valdistanceverticalbasetype,
                elevation_uom             uomdistanceverticaltype,
                truebearingaccuracy       integer,
                slopetdz                  valslopetype,
                role                      coderunwaypointroletype,
                runway_designator         textdesignatortype,
                uuidrunway                id,
                uuidairportheliport       id,
                nameairportheliport       textnametype,
                beginposition             datetype,
                endposition               datetype,
                geom                      geometry
            )
    immutable
    language sql
as
$$
select *
from runwaydirection_mat
WHERE beginposition <= (select * from set_date_filter(date_filter));
    --AND (endposition > (select * from set_date_filter(date_filter)) OR endposition is NULL);
$$;

alter function runwaydirection_all(datetype) owner to "nav-user";





create or replace function airportheliport_props(date_filter datetype DEFAULT NULL::date,
                                      arpname_filter character varying DEFAULT NULL::character varying,
                                      type_filter character varying DEFAULT NULL::character varying)
    returns TABLE
            (
                identifier         id,
                type               character,
                name               character,
                name_ru            character,
                designator         codeairportheliportdesignatortype,
                designatoriata     character,
                status             character,
                controltype        character,
                privateuse         character,
                elevation          character,
                uom_elevation      uomdistanceverticaltype,
                magneticvariation  character,
                radio              jsonb,
                latitude           character,
                longitude          character,
                srid               character,
                city               character varying,
                geom               geometry,
                beginposition      datetype,
                endposition        datetype,
                fr                 character,
                fr_ru              character,
                transitionaltitude text,
                transitionlevel    text,
                proj               character
            )
    immutable
    language sql
as
$$
select *
FROM airportheliport_mat
WHERE beginposition <= (select * FROM set_date_filter(date_filter))
  ----AND (endposition > (select * FROM set_date_filter(date_filter)) OR endposition is NULL)
  AND (type_filter IS NULL OR NULLIF(type_filter, '') is NULL OR "type" = any (regexp_split_to_array(type_filter, ',')))
  and (arpname_filter IS NULL OR NULLIF(arpname_filter, '') is NULL OR
       "name" = any (regexp_split_to_array(arpname_filter, ',')))  and type= 'AIRPORT';
$$;



