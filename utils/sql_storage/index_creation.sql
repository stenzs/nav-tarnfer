--- airportheliport
CREATE INDEX IF NOT EXISTS arp_indx ON airportheliport_mat (identifier);
CREATE INDEX IF NOT EXISTS arp_area_indx ON airportheliport_area (identifier);

--- airspace
CREATE INDEX IF NOT EXISTS airspace_indx ON airspace_mat (identifier);
CREATE INDEX IF NOT EXISTS airspace2_indx ON airspace_AREA2 (identifier);
CREATE INDEX IF NOT EXISTS airspace3_indx ON airspace_AREA3 (identifier);


--- exit_leg
CREATE INDEX IF NOT EXISTS exit_leg_indx ON exit_leg_mat (identifier);


--- exit_leg_nav
CREATE INDEX IF NOT EXISTS exit_leg_nav_indx ON exit_leg_nav_mat (identifier);


--- firs
CREATE INDEX IF NOT EXISTS firs_area_indx ON firs_AREA (fir_name);


--- glidepath
CREATE INDEX IF NOT EXISTS glid_indx ON glidepath_mat (identifier);
CREATE INDEX IF NOT EXISTS glid_sid_indx ON glidepath_sid (identifier);


--- holdingpattern
CREATE INDEX IF NOT EXISTS hold_indx ON holdingpattern_mat (identifier);
CREATE INDEX IF NOT EXISTS hold_area_indx ON holdingpattern_area (identifier);

--- localizer
CREATE INDEX IF NOT EXISTS loc_indx ON localizer_mat (identifier);
CREATE INDEX IF NOT EXISTS loc_sid_indx ON localizer_sid (identifier);

--- markerbeacon
CREATE INDEX IF NOT EXISTS mark_indx ON markerbeacon_mat (identifier);


--- navaid
CREATE INDEX IF NOT EXISTS navaid_indx ON navaid_mat (identifier);
CREATE INDEX IF NOT EXISTS navaid_area_indx ON navaid_area (identifier);
CREATE INDEX IF NOT EXISTS navaid_sid_indx ON navaid_sid (identifier);

--- procedure
CREATE INDEX IF NOT EXISTS proc_indx ON procedure_mat (identifier);
CREATE INDEX IF NOT EXISTS procarp_indx ON procedure_mat (uuidairportheliport);


--- rdc
CREATE INDEX IF NOT EXISTS rdc_area_indx ON rdc_AREA (rdc_name);


--- routesegment
CREATE INDEX IF NOT EXISTS routesegment_indx ON routesegment_mat (identifier);
CREATE INDEX IF NOT EXISTS routesegment_point_indx ON routesegment_mat (ps, pe);


--- runway
CREATE INDEX IF NOT EXISTS runway_indx ON runway_mat (identifier);


--- runwaydirection
CREATE INDEX IF NOT EXISTS runwaydir_indx ON runwaydirection_mat (identifier);
CREATE INDEX IF NOT EXISTS runwaydirarp_indx ON runwaydirection_mat (uuidAirportHeliport);


--- segmentleg
CREATE INDEX IF NOT EXISTS segleg_indx ON segmentleg_mat (identifier);


--- specialnavigationstation
CREATE INDEX IF NOT EXISTS specnav_indx ON specialnavigationstation_mat (identifier);

--- safealtitudeareasector_mat
CREATE INDEX IF NOT EXISTS safealt_indx ON safealtitudeareasector_mat (identifier);

--- verticalstructure
CREATE INDEX IF NOT EXISTS verticalstructure_indx ON verticalstructure_mat (identifier);


--- designatedpoint
CREATE INDEX IF NOT EXISTS dsgn_indx ON designatedpoint_mat (identifier);
CREATE INDEX IF NOT EXISTS dsgnarp_indx ON designatedpoint_mat (uuidairportheliport);
CREATE INDEX IF NOT EXISTS dsgn_designator_indx ON designatedpoint_mat (designator);

/*
vacuum analyse airportheliport_mat, airspace_mat, holdingpattern_mat, localizer_mat, routesegment_mat, markerbeacon_mat,
    navaid_mat, procedure_mat, runway_mat, runwaydirection_mat, segmentleg_mat, specialnavigationstation_mat,
    verticalstructure_mat, designatedpoint_mat, exit_leg_mat, airspace_AREA2, airspace_AREA3, firs_AREA, rdc_AREA;
 */
