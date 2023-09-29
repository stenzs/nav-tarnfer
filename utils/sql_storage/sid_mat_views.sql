-- create materialized view navaid_sid as
-- WITH seg_proc AS (
--     SELECT segleg.identifier,
--            segleg.startend,
--            segleg.startpoint,
--            segleg.endpoint,
--            segleg.uuidairportheliport,
--            segleg.nameairportheliport,
--            proc.rnav,
--            proc.procedure,
--            proc.name AS nameprocedure
--     FROM segmentleg_mat segleg
--              LEFT JOIN procedure_mat proc ON proc.identifier::uuid = segleg.uuidprocedure::uuid
--     WHERE proc.beginposition::date <= (((SELECT set_date_filter.set_date_filter
--                                          FROM set_date_filter() set_date_filter(set_date_filter)))::date)
--       AND COALESCE(segleg.startpoint, segleg.endpoint) IS NOT NULL
-- )
-- SELECT nav.identifier,
--        nav.designator,
--        nav.name,
--        nav.type,
--        nav.elevation,
--        nav.frequency,
--        nav.magneticvariation,
--        nav.classndb,
--        nav.zerobearingdirection,
--        nav.typedme,
--        nav.latitude,
--        nav.longitude,
--        nav.srid,
--        COALESCE(nav.uuidairportheliport, seg_proc.uuidairportheliport) AS uuidairportheliport,
--        COALESCE(nav.nameairportheliport, seg_proc.nameairportheliport) AS nameairportheliport,
--        nav.beginposition,
--        nav.geom,
--        nav.idsignificantpoint,
--        seg_proc.rnav,
--        seg_proc.procedure,
--        concat(nav.type, ' ', nav.designator, ' ', nav.name)            AS present
-- FROM navaid_mat nav
--          LEFT JOIN segmentpoint seg ON seg.idsignificantpoint = nav.idsignificantpoint
--          LEFT JOIN seg_proc ON COALESCE(seg_proc.startpoint, seg_proc.endpoint) = seg.id
-- GROUP BY nav.identifier, nav.designator, nav.name, nav.type, nav.elevation, nav.frequency, nav.magneticvariation,
--          nav.classndb, nav.zerobearingdirection, nav.typedme, nav.latitude, nav.longitude, nav.srid, nav.beginposition,
--          nav.geom, seg_proc.rnav, seg_proc.procedure, nav.uuidairportheliport, seg_proc.uuidairportheliport,
--          nav.idsignificantpoint, nav.nameairportheliport, seg_proc.nameairportheliport;
--
-- alter materialized view navaid_sid owner to "nav-user";
--
-- create index navaid_sid_indx
--     on navaid_sid (identifier);



create materialized view localizer_sid as
WITH seg_proc AS (
    SELECT segleg.identifier,
           segleg.startend,
           segleg.startpoint,
           segleg.endpoint,
           segleg.uuidairportheliport,
           segleg.nameairportheliport,
           proc.rnav,
           proc.procedure,
           proc.name AS nameprocedure
    FROM segmentleg_mat segleg
             LEFT JOIN procedure_mat proc ON proc.identifier::uuid = segleg.uuidprocedure::uuid
    WHERE proc.beginposition::date <= (((SELECT set_date_filter.set_date_filter
                                         FROM set_date_filter() set_date_filter(set_date_filter)))::date)
      AND COALESCE(segleg.startpoint, segleg.endpoint) IS NOT NULL
)
SELECT loc.identifier,
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
       COALESCE(loc.uuidairportheliport, seg_proc.uuidairportheliport) AS uuidairportheliport,
       COALESCE(loc.nameairportheliport, seg_proc.nameairportheliport) AS nameairportheliport,
       loc.beginposition,
       loc.endposition,
       loc.geom,
       loc.idsignificantpoint,
       seg_proc.rnav,
       seg_proc.procedure
FROM localizer_mat loc
         LEFT JOIN segmentpoint seg ON seg.idsignificantpoint = loc.idsignificantpoint
         LEFT JOIN seg_proc ON COALESCE(seg_proc.startpoint, seg_proc.endpoint) = seg.id
GROUP BY loc.identifier, loc.frequency, loc.magneticbearing, loc.magneticbearingaccuracy, loc.truebearing,
         loc.declination, loc.truebearingaccuracy, loc.widthcourse, loc.widthcourseaccuracy, loc.backcourseusable,
         loc.designator, loc.name, loc.emissionclass, loc.mobile, loc.magneticvariation, loc.magneticvariationaccuracy,
         loc.datemagneticvariation, loc.flightchecked, loc.uuidairportheliport, seg_proc.uuidairportheliport,
         loc.nameairportheliport, seg_proc.nameairportheliport, loc.beginposition, loc.endposition, loc.geom,
         loc.idsignificantpoint,
         seg_proc.rnav, seg_proc.procedure;



create index loc_sid_indx
    on localizer_sid (identifier);

create materialized view glidepath_sid as
WITH seg_proc AS (
    SELECT segleg.identifier,
           segleg.startend,
           segleg.startpoint,
           segleg.endpoint,
           segleg.uuidairportheliport,
           segleg.nameairportheliport,
           proc.rnav,
           proc.procedure,
           proc.name AS nameprocedure
    FROM segmentleg_mat segleg
             LEFT JOIN procedure_mat proc ON proc.identifier::uuid = segleg.uuidprocedure::uuid
    WHERE proc.beginposition::date <= (((SELECT set_date_filter.set_date_filter
                                         FROM set_date_filter() set_date_filter(set_date_filter)))::date)
      AND COALESCE(segleg.startpoint, segleg.endpoint) IS NOT NULL
)
SELECT glid.identifier,
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
       COALESCE(glid.uuidairportheliport, seg_proc.uuidairportheliport) AS uuidairportheliport,
       COALESCE(glid.nameairportheliport, seg_proc.nameairportheliport) AS nameairportheliport,
       glid.beginposition,
       glid.endposition,
       glid.geom,
       glid.idsignificantpoint,
       seg_proc.rnav,
       seg_proc.procedure
FROM glidepath_mat glid
         LEFT JOIN segmentpoint seg ON seg.idsignificantpoint = glid.idsignificantpoint
         LEFT JOIN seg_proc ON COALESCE(seg_proc.startpoint, seg_proc.endpoint) = seg.id
GROUP BY glid.identifier, glid.frequency, glid.slope, glid.angleaccuracy, glid.rdh, glid.rdhaccuracy, glid.designator,
         glid.name, glid.emissionclass, glid.mobile, glid.magneticvariation, glid.magneticvariationaccuracy,
         glid.datemagneticvariation, glid.flightchecked, glid.uuidairportheliport, glid.nameairportheliport,
         glid.beginposition, glid.endposition, glid.geom, glid.idsignificantpoint, seg_proc.uuidairportheliport,
         seg_proc.nameairportheliport, seg_proc.rnav, seg_proc.procedure;



create index glid_sid_indx
    on glidepath_sid (identifier);


create materialized view segmentleg_transitionid as
SELECT DISTINCT COALESCE(pr_tran.transitionid::character varying, ''::character varying) AS transitionid,
                segmentleg_mat.nameairportheliport,
                segmentleg_mat.procedure,
                segmentleg_mat.beginposition,
                segmentleg_mat.endposition,
                segmentleg_mat.nameprocedure
FROM segmentleg_mat
         LEFT JOIN proceduretransition pr_tran ON pr_tran.uuidprocedure::uuid = segmentleg_mat.uuidprocedure::uuid;

