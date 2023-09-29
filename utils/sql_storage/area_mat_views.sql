
create materialized view rdc_area as
SELECT st_transform(st_union(st_snaptogrid(airspace_mat.geom, 0.0001::double precision)),
                    '+proj=lcc +lat_0=30 +lon_0=95 +lat_1=15 +lat_2=65 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'::text) AS rdc_geom,
       airspace_mat.nl                                                                                                      AS rdc_name
FROM airspace_mat
WHERE airspace_mat.type ~~ '%RDC'::text
GROUP BY airspace_mat.nl;



create index rdc_area_indx
    on rdc_area (rdc_name);
-----------------
create materialized view firs_area as
SELECT st_transform(st_union(st_snaptogrid(airspace_mat.geom, 0.0001::double precision)),
                    '+proj=lcc +lat_0=30 +lon_0=95 +lat_1=15 +lat_2=65 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'::text) AS fir_geom,
       airspace_mat.nl                                                                                                      AS fir_name,
       airspace_mat.nl_ru                                                                                                   AS fir_name_ru
FROM airspace_mat
WHERE airspace_mat.type = 'FIR'::text
   OR airspace_mat.type = 'FIR/UIR'::text
   OR airspace_mat.type = 'UIR'::text
GROUP BY airspace_mat.nl, airspace_mat.nl_ru;



create index firs_area_indx
    on firs_area (fir_name);
----------------
create materialized view airspace_area2 as
SELECT airspace_mat.identifier,
       rdc_area.rdc_name
FROM airspace_mat
         LEFT JOIN rdc_area ON st_intersects(st_transform(st_centroid(airspace_mat.geom),
                                                          '+proj=lcc +lat_0=30 +lon_0=95 +lat_1=15 +lat_2=65 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'::text),
                                             rdc_area.rdc_geom);


create index airspace2_indx
    on airspace_area2 (identifier);
--------------------
create materialized view airspace_area3 as
SELECT airspace_mat.identifier,
       firs_area.fir_name,
       firs_area.fir_name_ru
FROM airspace_mat
         LEFT JOIN firs_area ON st_intersects(st_transform(st_centroid(airspace_mat.geom),
                                                           '+proj=lcc +lat_0=30 +lon_0=95 +lat_1=15 +lat_2=65 +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'::text),
                                              firs_area.fir_geom);
create index airspace3_indx
    on airspace_area3 (identifier);

create materialized view airspace_area as
SELECT a.identifier,
       a.type,
       a.nm,
       a.nl,
       a.nl_ru,
       a.tp,
       a.lowerlimit,
       a.lowerlimitreference,
       a.lowerlimit_ft,
       a.upperlimit,
       a.upperlimitreference,
       a.upperlimit_ft,
       a.he,
       a.class,
       a.beginposition,
       a.endposition,
      -- a.correctionnumber,
       a.geom,
       a.cs_tf_ru,
       a.cs_tf,
       concat(
               CASE
                   WHEN (a.lowerlimit !~~ 'FL%'::text OR a.lowerlimit <> 'GND'::text) AND
                        (a.lowerlimitreference = ANY (ARRAY ['AGL'::text, 'AMSL'::text, 'SFC'::text, 'MSL'::text]))
                       THEN concat(a.lowerlimit, '/', a.lowerlimit_ft, '`')
                   ELSE a.lowerlimit
                   END,
               CASE
                   WHEN a.lowerlimitreference IS NULL OR a.lowerlimitreference = 'STD'::text THEN ''::text
                   ELSE a.lowerlimitreference
                   END, '-',
               CASE
                   WHEN (a.upperlimit !~~ 'FL%'::text OR a.upperlimit <> 'GND'::text) AND
                        (a.upperlimitreference = ANY (ARRAY ['AGL'::text, 'AMSL'::text, 'SFC'::text, 'MSL'::text]))
                       THEN concat(a.upperlimit, '/', a.upperlimit_ft, '`')
                   ELSE a.upperlimit
                   END,
               CASE
                   WHEN a.lowerlimitreference IS NULL OR a.upperlimitreference = 'STD'::text THEN ''::text
                   ELSE a.upperlimitreference
                   END) AS he_line,
       a.status         AS rw,
       aa2.rdc_name,
       aa3.fir_name,
       aa3.fir_name_ru
FROM airspace_mat a
         JOIN airspace_area2 aa2 ON a.identifier::uuid = aa2.identifier::uuid
         JOIN airspace_area3 aa3 ON a.identifier::uuid = aa3.identifier::uuid;

-----------------

create materialized view fir_area as
SELECT a.identifier,
       a.type,
       a.nm,
       a.nl,
       a.nl_ru,
       a.upperlimit,
       a.upperlimitreference,
       a.upperlimit_ft,
       a.lowerlimit,
       a.lowerlimitreference,
       a.lowerlimit_ft,
       a.he,
       a.class,
       a.beginposition,
       a."time"                                    AS rw,
       concat(a.nl, '#', a.cs_tf, '#', a.he)       AS "time",
       concat(a.nl_ru, '#', a.cs_tf_ru, '#', a.he) AS time_ru,
       a.geom,
       a.cs_tf_ru,
       a.cs_tf,
       aa2.rdc_name,
       aa3.fir_name,
       aa3.fir_name_ru
FROM airspace_mat a
         JOIN airspace_area2 aa2 ON a.identifier::uuid = aa2.identifier::uuid
         JOIN airspace_area3 aa3 ON a.identifier::uuid = aa3.identifier::uuid;

--------------------

create materialized view obs_area as
SELECT verticalstructure_mat.identifier,
       verticalstructure_mat.ab,
       verticalstructure_mat.ta,
       verticalstructure_mat.le,
       verticalstructure_mat.type_obs,
       verticalstructure_mat.geom,
       verticalstructure_mat.beginposition
FROM verticalstructure_mat;

-----------------------

create materialized view procedure_area as
SELECT procedure_mat.identifier,
       procedure_mat.codingstandard,
       procedure_mat.name,
       procedure_mat.rnav,
       procedure_mat.designator,
       procedure_mat.transitionid,
       procedure_mat.transitiontype,
       procedure_mat.approachprefix,
       procedure_mat.approachtype,
       procedure_mat.multipleidentification,
       procedure_mat.coptertrack,
       procedure_mat.circlingidentification,
       procedure_mat.additionalequipment,
       procedure_mat.channelgnss,
       procedure_mat.waasreliable,
       procedure_mat.uuidairportheliport,
       procedure_mat.nameairportheliport,
       procedure_mat.geom,
       procedure_mat.beginposition
FROM procedure_mat;

-----------------------

create materialized view routesegment_area as
SELECT routesegment_mat.identifier,
       routesegment_mat.beginposition,
       routesegment_mat.nm,
       routesegment_mat.mta,
       routesegment_mat.rmta,
       routesegment_mat.wd,
       routesegment_mat.lb,
       routesegment_mat.lb_unit,
       routesegment_mat.he,
       routesegment_mat.ps,
       routesegment_mat.pe,
       routesegment_mat.country,
       routesegment_mat.sogl,
       routesegment_mat.internationaluse,
       routesegment_mat.geom,
       (SELECT st_asewkt(routesegment_mat.geom) AS st_asewkt) AS wkt
FROM routesegment_mat;

---------------------

create materialized view airportheliport_area as
SELECT airportheliport_mat.identifier,
       airportheliport_mat.type,
       airportheliport_mat.name,
       airportheliport_mat.name_ru,
       airportheliport_mat.designator,
       airportheliport_mat.designatoriata,
       airportheliport_mat.status,
       airportheliport_mat.controltype,
       airportheliport_mat.privateuse,
       airportheliport_mat.elevation,
       airportheliport_mat.uom_elevation,
       airportheliport_mat.magneticvariation,
       airportheliport_mat.latitude,
       airportheliport_mat.longitude,
       airportheliport_mat.srid,
       airportheliport_mat.city_distance,
       airportheliport_mat.geom,
       airportheliport_mat.beginposition,
       airportheliport_mat.endposition,
      --- airportheliport_mat.correctionnumber,
       airportheliport_mat.fr,
       airportheliport_mat.fr_ru,
       airportheliport_mat.transitionaltitude,
       airportheliport_mat.transitionlevel,
       airportheliport_mat.proj
FROM airportheliport_mat;



create index arp_area_indx
    on airportheliport_area (identifier);

---------------------
create materialized view holdingpattern_area as
SELECT holdingpattern_mat.identifier,
       holdingpattern_mat.type,
       holdingpattern_mat.outboundcourse,
       holdingpattern_mat.outboundcoursetype,
       holdingpattern_mat.inboundcourse,
       holdingpattern_mat.inboundcoursetype,
       holdingpattern_mat.turndirection,
       holdingpattern_mat.lowerlimit,
       holdingpattern_mat.lowerlimitreference,
       holdingpattern_mat.lowerlimit_ft,
       holdingpattern_mat.upperlimit,
       holdingpattern_mat.upperlimitreference,
       holdingpattern_mat.upperlimit_ft,
       holdingpattern_mat.he,
       holdingpattern_mat.duration,
       holdingpattern_mat.speedlimit,
       holdingpattern_mat.speed_uom,
       holdingpattern_mat.fix_name,
       holdingpattern_mat.length,
       holdingpattern_mat.length_uom,
       holdingpattern_mat.beginposition,
       holdingpattern_mat.geom
FROM holdingpattern_mat;



create index hold_area_indx
    on holdingpattern_area (identifier);
-------------------

create materialized view navaid_area as
SELECT nav.identifier,
       nav.designator,
       nav.name,
       nav.type,
       nav.elevation,
       nav.frequency,
       nav.magneticvariation,
       nav.latitude,
       nav.longitude,
       nav.srid,
       nav.beginposition,
       nav.geom,
       concat(nav.type, ' ', nav.designator, ' ', nav.name) AS present
FROM navaid_mat nav
         JOIN routesegment_mat r ON r.ps::text = nav.designator::text OR r.pe::text = nav.designator::text
WHERE nav.type::text !~~ '%DME'::text
UNION
SELECT nav.identifier,
       nav.designator,
       nav.name,
       nav.type,
       nav.elevation,
       nav.frequency,
       nav.magneticvariation,
       nav.latitude,
       nav.longitude,
       nav.srid,
       nav.beginposition,
       nav.geom,
       concat(nav.type, ' ', nav.designator, ' ', nav.name) AS present
FROM navaid_mat nav
WHERE nav.type::text ~~ '%DME'::text;



create index navaid_area_indx
    on navaid_area (identifier);

----------------------

create materialized view designatedpoint_area as
SELECT designatedpoint_mat.identifier,
       designatedpoint_mat.designator,
       designatedpoint_mat.type,
       designatedpoint_mat.tp2,
       designatedpoint_mat.tp1,
       designatedpoint_mat.name,
       designatedpoint_mat.uuidairportheliport,
       designatedpoint_mat.nameairportheliport,
       designatedpoint_mat.latitude,
       designatedpoint_mat.longitude,
       designatedpoint_mat.srid,
       designatedpoint_mat.beginposition,
       designatedpoint_mat.geom
---FROM designatedpoint_mat
From rout_segmentpoint_mat as designatedpoint_mat
where  designatedpoint_mat.dp_idsign is not null
GROUP BY designatedpoint_mat.identifier, designatedpoint_mat.designator, designatedpoint_mat.type,
         designatedpoint_mat.tp2, designatedpoint_mat.tp1, designatedpoint_mat.name,
         designatedpoint_mat.uuidairportheliport,
         designatedpoint_mat.nameairportheliport,
         designatedpoint_mat.latitude,
         designatedpoint_mat.longitude, designatedpoint_mat.srid, designatedpoint_mat.beginposition,
         designatedpoint_mat.geom;

---------------------


create materialized view exit_routes_area as
SELECT r.identifier,
       r.beginposition,
       r.geom,
       COALESCE(ds.designator::character varying,
                concat(ns.designator, ' ', ns.frequency)::character varying) AS s_designator,
       COALESCE(ds.geom, ns.geom)                                            AS point_geom_s,
       COALESCE(de.designator::character varying,
                concat(ne.designator, ' ', ne.frequency)::character varying) AS e_designator,
       COALESCE(de.geom, ne.geom)                                            AS point_geom_e
FROM routesegment_mat r
         LEFT JOIN navaid_mat ne ON r.pe::text = ne.designator::text
         LEFT JOIN navaid_mat ns ON r.ps::text = ns.designator::text
         LEFT JOIN designatedpoint_mat de ON r.pe::text = de.designator::text
         LEFT JOIN designatedpoint_mat ds ON r.ps::text = ds.designator::text
GROUP BY r.identifier, r.beginposition, r.geom,
         (COALESCE(ds.designator::character varying, concat(ns.designator, ' ', ns.frequency)::character varying)),
         (COALESCE(ds.geom, ns.geom)),
         (COALESCE(de.designator::character varying, concat(ne.designator, ' ', ne.frequency)::character varying)),
         (COALESCE(de.geom, ne.geom));


