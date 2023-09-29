----arp
---from geojson:name_ru,abandoned, lat, lot, fr, fr_ru, radio, status, name_ru
---from xml: designatoriata, city_distance, transitionaltitude, transitionlevel

DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;
DROP materialized view if EXISTS airportheliport_mat CASCADE ;
DROP materialized view if EXISTS airspace_mat CASCADE ;
DROP materialized view if EXISTS gridmora_mat CASCADE ;
DROP materialized view if EXISTS markerbeacon_mat CASCADE ;
DROP materialized view if EXISTS procedure_mat CASCADE ;
DROP materialized view if EXISTS routesegment_mat CASCADE ;
DROP materialized view if EXISTS runway_mat CASCADE ;
DROP materialized view if EXISTS verticalstructure_mat CASCADE ;
DROP materialized view if EXISTS safealtitudeareasector_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat CASCADE ;
DROP materialized view if EXISTS holdingpattern_mat_terminal CASCADE ;
DROP materialized view if EXISTS localizer_mat CASCADE ;
DROP materialized view if EXISTS glidepath_mat CASCADE ;
DROP materialized view if EXISTS specialnavigationstation_mat CASCADE ;
DROP materialized view if EXISTS runwaydirection_mat CASCADE ;
DROP materialized view if EXISTS segmentleg_mat CASCADE ;
DROP materialized view if EXISTS final_profiel_leg_mat CASCADE ;
DROP materialized view if EXISTS segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS rout_segmentpoint_mat CASCADE ;
DROP materialized view if EXISTS navaid_mat_procedure CASCADE ;
DROP materialized view if EXISTS navaid_mat CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat_procedure CASCADE ;
DROP materialized view if EXISTS designatedpoint_mat CASCADE ;
DROP materialized view if EXISTS exit_leg_mat CASCADE ;
DROP materialized view if EXISTS navaid_sid CASCADE ;
DROP materialized view if EXISTS exit_leg_nav_mat CASCADE ;



create materialized view airportheliport_mat as
WITH unique_service AS (
    SELECT DISTINCT service_radiocommunicationchannel.uuidservice                   AS uu,
                    service_radiocommunicationchannel.uuidradiocommunicationchannel AS uuidradio
    FROM service_radiocommunicationchannel
),
     cor AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM airportheliporttimeslice dp
                  LEFT JOIN airportheliport d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     ),
    cor_geojson AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM airportheliporttimeslice dp
                  LEFT JOIN airportheliport d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL and dp.source_ is not null
         GROUP BY d.uuid
     ),
    cor_xml AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM airportheliporttimeslice dp
                  LEFT JOIN airportheliport d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL and dp.source_ is null
         GROUP BY d.uuid
     ),
     runway_actual AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM runwaytimeslice dp
                  LEFT JOIN runway d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     longest_pre AS (
         SELECT runwaytimeslice.uuid                                    AS uuidrunway,
                round((runwaytimeslice.length).value::numeric, 1)::text AS lrv,
                (runwaytimeslice.length).unit                           AS lru,
                runwaytimeslice.uuidarphlp                              AS rwy_arp,
                runwaytimeslice.composition
         FROM runwaytimeslice
                  LEFT JOIN runway_actual ON runway_actual.a::integer = runwaytimeslice.idtimeslice
         WHERE (runwaytimeslice.idtimeslice::text IN (SELECT runway_actual_1.a
                                                      FROM runway_actual runway_actual_1))
     ),
     actual_rwy AS (
         WITH uniqarp AS (
             SELECT DISTINCT longest_pre.rwy_arp  AS arp,
                             max(longest_pre.lrv) AS maxlr
             FROM longest_pre
             GROUP BY longest_pre.rwy_arp
         ),
              actual AS (
                  SELECT longest_pre.uuidrunway,
                         longest_pre.lrv,
                         longest_pre.lru,
                         longest_pre.rwy_arp,
                         longest_pre.composition
                  FROM longest_pre
              )
         SELECT DISTINCT ON ((uniqarp.arp || uniqarp.maxlr)) uniqarp.arp,
                                                             uniqarp.maxlr,
                                                             actual.lru,
                                                             actual.composition
         FROM uniqarp
                  JOIN actual ON uniqarp.maxlr = actual.lrv AND uniqarp.arp::uuid = actual.rwy_arp::uuid
     ),
     --добавляем отбор по _sourse
     united_fr AS (
         SELECT arp_1.uuid,
                arp_1.idtimeslice,
                array_to_string(array_agg(DISTINCT
                                          CASE
                                              WHEN c.callsign::text ~~ '%ATIS%'::text AND c.translation::text IS NULL OR
                                                   c.translation::text = ''::text THEN 'ATIS-eng'::character varying
                                              WHEN c.callsign::text ~~ '%ATIS%'::text AND
                                                   c.translation::text ~~ '%АТИС%'::text
                                                  THEN 'ATIS-rus/eng'::character varying
                                              WHEN c.callsign::text ~ similar_escape('%(-)%'::text, NULL::text)
                                                  THEN concat("substring"(c.callsign::text, '^.*-'::text), initcap(
                                                      reverse(split_part(reverse(c.callsign::text), '-'::text, 1))))::character varying
                                              ELSE c.callsign::character varying
                                              END), ''::text)  AS name_en,
                array_to_string(array_agg(DISTINCT
                                          CASE
                                              WHEN c.translation::text ~~ '%АТИС%'::text
                                                  THEN 'ATIS-rus/eng'::character varying
                                              WHEN c.translation::text ~ similar_escape('%(-)%'::text, NULL::text)
                                                  THEN concat("substring"(c.translation::text, '^.*-'::text), initcap(
                                                      reverse(split_part(reverse(c.translation::text), '-'::text, 1))))::character varying
                                              ELSE c.translation
                                              END), ''::text)  AS name_ru,
                array_to_string(array_agg(DISTINCT
                                          CASE
                                              WHEN floor((rts_1.frequencytransmission).value::numeric) < 1000::numeric
                                                  THEN (rts_1.frequencytransmission).value::double precision::numeric(10, 3)
                                              ELSE floor((rts_1.frequencytransmission).value::numeric)
                                              END), ' '::text) AS freq
         FROM airportheliporttimeslice arp_1
                  LEFT JOIN unit_servicetimeslice unit_service_1 ON arp_1.uuid::uuid = unit_service_1.uuidarphlp::uuid
                  LEFT JOIN unique_service unique_service_1 ON unique_service_1.uu::uuid = unit_service_1.uuid::uuid
                  LEFT JOIN radiocommunicationchanneltimeslice rts_1 ON unique_service_1.uuidradio::uuid = rts_1.uuid::uuid
                  LEFT JOIN callsigndetail c ON c.uuidservice::uuid = unit_service_1.uuid::uuid
                  LEFT JOIN cor_geojson cor_1  ON  cor_1.a::integer = arp_1.idtimeslice
                  LEFT JOIN cor  ON  cor.a::integer = arp_1.idtimeslice
           where arp_1.idtimeslice::text in (select a::text from cor_geojson)
         GROUP BY arp_1.uuid, arp_1.idtimeslice, c.callsign, c.translation
     ),
     fr_with_name AS (
         SELECT arp_1.uuid,
                arp_1.idtimeslice,
                array_to_string(array_agg(
                                        CASE
                                            WHEN u_fr.name_en IS NOT NULL AND u_fr.name_en <> ''::text AND
                                                 u_fr.freq IS NOT NULL AND u_fr.freq <> ''::text THEN concat(
                                                    replace(replace(upper(u_fr.name_en), '`'::text, ''::text),
                                                            ''''::text, ''::text), '#', u_fr.freq)
                                            ELSE 'not published'::text
                                            END), ','::text) AS frequency_en,
                array_to_string(array_agg(
                                        CASE
                                            WHEN u_fr.name_ru IS NOT NULL AND u_fr.name_ru <> ''::text AND
                                                 u_fr.freq IS NOT NULL AND u_fr.freq <> ''::text THEN concat(
                                                    replace(replace(upper(u_fr.name_ru), '`'::text, ''::text),
                                                            ''''::text, ''::text), '#', u_fr.freq)
                                            ELSE 'не опубл.'::text
                                            END), ','::text) AS frequency_ru
         FROM airportheliporttimeslice arp_1
                  LEFT JOIN united_fr u_fr
                            ON u_fr.uuid::uuid = arp_1.uuid::uuid AND u_fr.idtimeslice = arp_1.idtimeslice
                 LEFT JOIN cor_geojson cor_1  ON  cor_1.a::integer = arp_1.idtimeslice
                  LEFT JOIN cor  ON  cor.a::integer = arp_1.idtimeslice
           where arp_1.idtimeslice::text in (select a::text from cor_geojson)
         GROUP BY arp_1.uuid, arp_1.idtimeslice
     ),
     fr AS (
         SELECT arp_1.uuid,
                arp_1.idtimeslice,
                jsonb_agg(
                        CASE
                            WHEN (rts_1.frequencyreception).value IS NOT NULL THEN jsonb_build_object('frValue',
                                                                                                      (rts_1.frequencyreception).value,
                                                                                                      'frUnit',
                                                                                                      (rts_1.frequencyreception).unit,
                                                                                                      'ftValue',
                                                                                                      (rts_1.frequencytransmission).value,
                                                                                                      'ftUnit',
                                                                                                      (rts_1.frequencytransmission).unit,
                                                                                                      'cs',
                                                                                                      callsigndetail_1.callsign,
                                                                                                      'tp', COALESCE(
                                                                                                              replace(its_1.type::text, 'OTHER: '::text, ''::text),
                                                                                                              replace(airtraf.type::text, 'OTHER: '::text, ''::text),
                                                                                                              replace(gndtraf.type::text, 'OTHER: '::text, ''::text),
                                                                                                              replace(unit_service_1.type::text, 'OTHER: '::text, ''::text)))
                            ELSE NULL::jsonb
                            END) AS radio
         FROM airportheliporttimeslice arp_1
                  LEFT JOIN unit_servicetimeslice unit_service_1 ON arp_1.uuid::uuid = unit_service_1.uuidarphlp::uuid
                  LEFT JOIN unique_service unique_service_1 ON unique_service_1.uu::uuid = unit_service_1.uuid::uuid
                  LEFT JOIN radiocommunicationchanneltimeslice rts_1 ON unique_service_1.uuidradio::uuid = rts_1.uuid::uuid
                  LEFT JOIN callsigndetail callsigndetail_1 ON callsigndetail_1.uuidservice::uuid = unit_service_1.uuid::uuid
                  LEFT JOIN informationservice its_1 ON unit_service_1.idtimeslice = its_1.idtimeslice
                  LEFT JOIN trafficseparationservice trafsep ON unit_service_1.idtimeslice = trafsep.idtimeslice
                  LEFT JOIN airtrafficcontrolservice airtraf ON trafsep.idtimeslice = airtraf.idtimeslice
                  LEFT JOIN groundtrafficcontrolservice gndtraf ON trafsep.idtimeslice = gndtraf.idtimeslice
                  LEFT JOIN cor_geojson cor_1  ON  cor_1.a::integer = arp_1.idtimeslice
                  LEFT JOIN cor  ON  cor.a::integer = arp_1.idtimeslice
           where arp_1.idtimeslice::text in (select a::text from cor_geojson)
         GROUP BY arp_1.uuid, arp_1.idtimeslice
     ),
     lat_lon_arp AS (
         SELECT arp_1.uuid,
                arp_1.idtimeslice,
                CASE
                    WHEN arp_1.latitude::numeric < 0::numeric THEN arp_1.latitude::numeric * '-1'::integer::numeric
                    ELSE arp_1.latitude::numeric
                    END AS latitude,
                CASE
                    WHEN arp_1.latitude::numeric < 0::numeric THEN 'S'::text
                    ELSE 'N'::text
                    END AS lat_dir,
                CASE
                    WHEN arp_1.longitude::numeric < 0::numeric THEN arp_1.longitude::numeric * '-1'::integer::numeric
                    ELSE arp_1.longitude::numeric
                    END AS longitude,
                CASE
                    WHEN arp_1.longitude::numeric < 0::numeric THEN 'W'::text
                    ELSE 'E'::text
                    END AS lon_dir
         FROM airportheliporttimeslice arp_1
                LEFT JOIN cor_geojson cor_1  ON  cor_1.a::integer = arp_1.idtimeslice
                  LEFT JOIN cor  ON  cor.a::integer = arp_1.idtimeslice
           where arp_1.idtimeslice::text in (select a::text from cor_geojson)
     ),
     status_arp as (  SELECT arp_1.uuid,
                arp_1.idtimeslice,
                (arp_1.abandoned).value as abandoned
         FROM airportheliporttimeslice arp_1
                LEFT JOIN cor_geojson cor_1  ON  cor_1.a::integer = arp_1.idtimeslice
                  LEFT JOIN cor  ON  cor.a::integer = arp_1.idtimeslice
           where arp_1.idtimeslice::text in (select a::text from cor_geojson)),
     translation_arp as (  SELECT arp_1.uuid,
                arp_1.idtimeslice,
                arp_1.translation
         FROM airportheliporttimeslice arp_1
                LEFT JOIN cor_geojson cor_1  ON  cor_1.a::integer = arp_1.idtimeslice
                LEFT JOIN cor  ON  cor.a::integer = arp_1.idtimeslice
           where arp_1.idtimeslice::text in (select a::text from cor_geojson)),
     transitionaltitude_arp as (SELECT arp_1.uuid,
                arp_1.idtimeslice,
                arp_1.transitionaltitude
         FROM airportheliporttimeslice arp_1
                LEFT JOIN cor_geojson cor_1  ON  cor_1.a::integer = arp_1.idtimeslice
                LEFT JOIN cor  ON  cor.a::integer = arp_1.idtimeslice
                LEFT JOIN cor_xml  ON  cor_xml.a::integer = arp_1.idtimeslice
           where arp_1.idtimeslice::text in (select a::text from cor_xml))

SELECT arp.uuid                                                                                    AS identifier,
       CASE
           WHEN arp.type::text = 'OTHER: helipad'::text THEN 'HELIPAD'::text
           WHEN arp.type::text = 'HP'::text THEN 'HELIPORT'::text
           WHEN arp.type::text = 'LS'::text THEN 'LANDING'::text
           WHEN arp.type::text = 'OTHER: HA'::text THEN 'SEAPLANE_BASE'::text
           WHEN arp.type::text = 'AD'::text THEN 'AIRPORT'::text
           ELSE NULL::text
           END
           AS type,

       replace(arp.name::text, ''''::text, ''::text)                                                AS name,
       replace(translation_arp.translation::text, ''''::text, ''::text)                              AS name_ru,
       arp.designator,
       arp.designatoriata,
       status_arp.abandoned                                                                      AS status,
       CASE
           WHEN arp.controltype::text = 'OTHER: PRIVATE'::text THEN 'CIVIL'::character varying
           WHEN arp.controltype::text = 'MIL'::text THEN 'MILITARY'::character varying
           ELSE arp.controltype::character varying
           END                                                                                     AS controltype,
       CASE
           WHEN arp.controltype::text = 'OTHER: PRIVATE'::text THEN 'YES'::text
           ELSE 'NO'::text
           END                                                                                     AS privateuse,
       replace((arp.elevation).value::text, '.0000'::text, ''::text)                               AS elevation,
       (arp.elevation).unit                                                                        AS uom_elevation,
       round(arp.magneticvariation::numeric, 1)::text                                              AS magneticvariation,
       fr.radio,
       concat(dd2dms(lat_lon_arp.latitude::double precision, 'lat'::character varying), lat_lon_arp.lat_dir,
              CASE
                  WHEN arp.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)                                                                             AS latitude,
       concat(dd2dms(lat_lon_arp.longitude::double precision, 'lon'::character varying), lat_lon_arp.lon_dir,
              CASE
                  WHEN arp.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)                                                                             AS longitude,
       CASE
           WHEN arp.srid = 4284 THEN 'PUK'::text
           WHEN arp.srid = 4326 THEN 'WGE'::text
           WHEN arp.srid = 7677 THEN 'RPE'::text
           WHEN arp.srid = 7679 THEN 'RP1'::text
           WHEN arp.srid = 4200 THEN 'S95'::text
           WHEN arp.srid = 4269 THEN 'NAR'::text
           WHEN arp.srid = 4230 THEN 'EUR'::text
           WHEN arp.srid = 4618 THEN 'SAN'::text
           WHEN arp.srid = 4740 THEN 'PZ9'::text
           WHEN arp.srid = 4205 THEN 'AFG'::text
           WHEN arp.srid = 4222 THEN 'CAP'::text
           WHEN arp.srid = 6672 THEN 'CHI'::text
           WHEN arp.srid = 4668 THEN 'EUS'::text
           WHEN arp.srid = 4121 THEN 'GRS'::text
           WHEN arp.srid = 6714 THEN 'IGN'::text
           WHEN arp.srid = 4240 THEN 'INH'::text
           WHEN arp.srid = 4245 THEN 'KEA'::text
           WHEN arp.srid = 4263 THEN 'MIN'::text
           WHEN arp.srid = 4267 THEN 'NAS'::text
           WHEN arp.srid = 5498 THEN 'NAW'::text
           WHEN arp.srid = 4277 THEN 'OGB'::text
           WHEN arp.srid = 4248 THEN 'PRP'::text
           WHEN arp.srid = 4139 THEN 'PUR'::text
           WHEN arp.srid = 4287 THEN 'QUO'::text
           WHEN arp.srid = 4806 THEN 'ROM'::text
           WHEN arp.srid = 4618 THEN 'SAD'::text
           WHEN arp.srid = 4730 THEN 'SAE'::text
           WHEN arp.srid = 4700 THEN 'SHB'::text
           WHEN arp.srid = 4284 THEN 'SPK'::text
           WHEN arp.srid = 4814 THEN 'STO'::text
           WHEN arp.srid = 4301 THEN 'TOK'::text
           WHEN arp.srid = 4733 THEN 'WAK'::text
           WHEN arp.srid = 4322 THEN 'WGC'::text
           ELSE 'Unknown'::text
           END                                                                                     AS srid,
       CASE
           WHEN city.note::text = 'NULL'::text OR city.note IS NULL THEN initcap(city.name::text)
           ELSE
               CASE
                   WHEN city.note::text ~~ '% of%'::text THEN concat(
                           replace(replace(split_part(city.note::text, ' of '::text, 1), ' KM'::text, ' km'::text),
                                   ' NM'::text, ' nm'::text), ' of ',
                           initcap(split_part(city.note::text, ' of '::text, 2)))
                   ELSE initcap(city.note::text)
                   END
           END                                                                                     AS city_distance,
       CASE
           WHEN st_isvalid(arp.geom) THEN arp.geom
           ELSE NULL::geometry
           END                                                                                     AS geom,
       t.validtimebegin                                                                            AS beginposition,
       t.validtimeend                                                                              AS endposition,
       fr_with_name.frequency_en                                                                   AS fr,
       fr_with_name.frequency_ru                                                                   AS fr_ru,
       CASE
           WHEN (transitionaltitude_arp.transitionaltitude).value IS NOT NULL THEN
               CASE
                   WHEN (trunc((transitionaltitude_arp.transitionaltitude).value::numeric) - (transitionaltitude_arp.transitionaltitude).value::numeric) > 0::numeric
                       THEN concat((transitionaltitude_arp.transitionaltitude).value, ' ', (transitionaltitude_arp.transitionaltitude).unit)
                   ELSE concat(trunc((transitionaltitude_arp.transitionaltitude).value::numeric), ' ', (transitionaltitude_arp.transitionaltitude).unit)
                   END
           ELSE NULL::text
           END                                                                                     AS transitionaltitude,
       CASE
           WHEN (arp.transitionlevel).value IS NOT NULL
               THEN concat((arp.transitionlevel).unit, (arp.transitionlevel).value)
           ELSE 'FL'::text
           END                                                                                     AS transitionlevel,
       ((((('+proj=lcc +lat_1='::text || (round(arp.latitude::numeric) - 1::numeric + 0.66)) || ' +lat_2='::text) ||
          (round(arp.latitude::numeric) + 1::numeric - 0.66)) || ' +lat_0=30 +lon_0='::text) ||
        round(arp.longitude::numeric, 2)) || ' +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'::text AS proj
FROM airportheliporttimeslice arp
         LEFT JOIN actual_rwy r ON arp.uuid::uuid = r.arp::uuid
         LEFT JOIN unit_servicetimeslice ON arp.uuid::uuid = unit_servicetimeslice.uuidarphlp::uuid
         LEFT JOIN unique_service ON unique_service.uu::uuid = unit_servicetimeslice.uuid::uuid
         LEFT JOIN radiocommunicationchannel rts ON unique_service.uuidradio::uuid = rts.uuid::uuid
         LEFT JOIN callsigndetail ON callsigndetail.uuidservice::uuid = unit_servicetimeslice.uuid::uuid
         LEFT JOIN informationservice its ON unit_servicetimeslice.idtimeslice = its.idtimeslice
         LEFT JOIN fr ON fr.uuid::uuid = arp.uuid::uuid AND fr.idtimeslice = arp.idtimeslice
         LEFT JOIN fr_with_name
                   ON fr_with_name.uuid::uuid = arp.uuid::uuid ----AND fr_with_name.idtimeslice = arp.idtimeslice
         LEFT JOIN airportheliportcity a_city ON a_city.uuidarphlp::uuid = arp.uuid::uuid
         LEFT JOIN city ON city.uuid::uuid = a_city.uuidcity::uuid
         LEFT JOIN lat_lon_arp ON lat_lon_arp.uuid::uuid = arp.uuid::uuid ---AND lat_lon_arp.idtimeslice = arp.idtimeslice
         left join status_arp ON status_arp.uuid::uuid = arp.uuid::uuid ---AND status_arp.idtimeslice = arp.idtimeslice
         left join translation_arp ON translation_arp.uuid::uuid = arp.uuid::uuid ---AND translation_arp.idtimeslice = arp.idtimeslice
         left join transitionaltitude_arp  ON transitionaltitude_arp.uuid::uuid = arp.uuid::uuid
         LEFT JOIN timeslice t ON t.idtimeslice = arp.idtimeslice
         LEFT JOIN cor ON cor.a::integer = arp.idtimeslice
WHERE (arp.idtimeslice::text IN (SELECT cor_1.a
                                 FROM cor cor_1))

GROUP BY arp.uuid, replace(arp.name::text, ''''::text, ''::text) , replace(translation_arp.translation::text, ''''::text, ''::text), arp.designator, status_arp.abandoned, arp.type, arp.controltype,
         arp.privateuse, arp.elevation, fr.radio, lat_lon_arp.longitude, lat_lon_arp.latitude, lat_lon_arp.lat_dir,
         lat_lon_arp.lon_dir, arp.latitude, arp.longitude, arp.srid, arp.geom, t.validtimebegin, t.validtimeend,
         t.correctionnumber, t.idtimeslice, fr_with_name.frequency_ru, fr_with_name.frequency_en,
         (((((('+proj=lcc +lat_1='::text || (round(arp.latitude::numeric) - 1::numeric + 0.66)) || ' +lat_2='::text) ||
             (round(arp.latitude::numeric) + 1::numeric - 0.66)) || ' +lat_0=30 +lon_0='::text) ||
           round(arp.longitude::numeric, 2)) || ' +x_0=0 +y_0=0 +datum=WGS84 +units=m +no_defs'::text),
         arp.designatoriata, transitionaltitude_arp.transitionaltitude, arp.transitionlevel,
         (
             CASE
                 WHEN city.note::text = 'NULL'::text OR city.note IS NULL THEN initcap(city.name::text)
                 ELSE
                     CASE
                         WHEN city.note::text ~~ '% of%'::text THEN concat(replace(replace(
                                                                                           split_part(city.note::text, ' of '::text, 1),
                                                                                           ' KM'::text, ' km'::text),
                                                                                   ' NM'::text, ' nm'::text), ' of ',
                                                                           initcap(split_part(city.note::text, ' of '::text, 2)))
                         ELSE initcap(city.note::text)
                         END
                 END), arp.magneticvariation;



create index arp_indx
    on airportheliport_mat (identifier);



----------------





create materialized view airspace_mat as
WITH
     rw AS (
    SELECT tsh.idpropertieswithschedule,
           array_to_string(array_agg(concat(tsh.day, ' ', tsh.starttime, '-', tsh.endtime)), '; '::text) AS "time"
    FROM timesheet tsh
             LEFT JOIN airspaceactivation aact_1 ON tsh.idpropertieswithschedule = aact_1.id
             LEFT JOIN radiocommunicationoperationalstatus rcos_1 ON tsh.idpropertieswithschedule = rcos_1.id
             LEFT JOIN airspace a_1 ON a_1.uuid::uuid = aact_1.uuidairspc::uuid
    GROUP BY tsh.idpropertieswithschedule
),
      cor AS
     (SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM airspacetimeslice dp
         LEFT JOIN airspace d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid)
     ,
     united_fr AS (
         SELECT a_1.uuid, a_1.idtimeslice,
                array_to_string(array_agg(DISTINCT
                                          CASE
                                              WHEN c.callsign::text ~ similar_escape('%(-)%'::text, NULL::text)
                                                  THEN concat("substring"(c.callsign::text, '^.*-'::text), initcap(
                                                      reverse(split_part(reverse(c.callsign::text), '-'::text, 1))))::character varying
                                              ELSE c.callsign::character varying
                                              END), ''::text)  AS name_en,
                array_to_string(array_agg(DISTINCT
                                          CASE
                                              WHEN c.translation::text ~ similar_escape('%(-)%'::text, NULL::text)
                                                  THEN concat("substring"(c.translation::text, '^.*-'::text), initcap(
                                                      reverse(split_part(reverse(c.translation::text), '-'::text, 1))))::character varying
                                              ELSE c.translation
                                              END), ''::text)  AS name_ru,
                array_to_string(array_agg(DISTINCT
                                          CASE
                                              WHEN floor((rcchts_1.frequencytransmission).value::numeric) < 1000::numeric
                                                  THEN (rcchts_1.frequencytransmission).value::double precision::numeric(10, 3)
                                              ELSE floor((rcchts_1.frequencytransmission).value::numeric)
                                              END), ' '::text) AS freq
         FROM airspacetimeslice a_1
                  LEFT JOIN airspace_service a_management_1 ON a_1.uuid::uuid = a_management_1.uuidairspc::uuid
                  LEFT JOIN airtrafficmanagementservice amsts_1
                            ON a_management_1.uuidairtrafficmanagementservice::uuid = amsts_1.uuid::uuid
                  LEFT JOIN callsigndetail c ON amsts_1.uuid::uuid = c.uuidservice::uuid
                  LEFT JOIN service_radiocommunicationchannel s_rcch_1
                            ON a_management_1.uuidairtrafficmanagementservice::uuid = s_rcch_1.uuidservice::uuid
                  LEFT JOIN radiocommunicationchanneltimeslice rcchts_1
                            ON s_rcch_1.uuidradiocommunicationchannel::uuid = rcchts_1.uuid::uuid
                  left join  cor ON  cor.a::integer =  a_1.idtimeslice
                where  a_1.idtimeslice::text in (select * from cor )
                  and  rcchts_1.idtimeslice::text in ( SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
    FROM radiocommunicationchanneltimeslice dp
    LEFT JOIN radiocommunicationchannel d on d.uuid = dp.uuid
    LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid    )
         GROUP BY a_1.uuid, c.callsign, a_1.idtimeslice
     ),
     fr_with_name AS (
         SELECT a_1.uuid, a_1.idtimeslice,
                array_to_string(array_agg(
                                        CASE
                                            WHEN u_fr.name_en IS NOT NULL AND u_fr.name_en <> ''::text AND
                                                 u_fr.freq IS NOT NULL AND u_fr.freq <> ''::text
                                                THEN concat(u_fr.name_en, '#', u_fr.freq)
                                            ELSE 'not published'::text
                                            END), ','::text) AS cs_tf,
                array_to_string(array_agg(
                                        CASE
                                            WHEN u_fr.name_ru IS NOT NULL AND u_fr.name_ru <> ''::text AND
                                                 u_fr.freq IS NOT NULL AND u_fr.freq <> ''::text
                                                THEN concat(u_fr.name_ru, '#', u_fr.freq)
                                            ELSE 'не опубл.'::text
                                            END), ','::text) AS cs_tf_ru
         FROM airspacetimeslice a_1
                  LEFT JOIN united_fr u_fr ON u_fr.uuid::uuid = a_1.uuid::uuid and u_fr.idtimeslice = a_1.idtimeslice
                  left Join cor ON cor.a::integer = a_1.idtimeslice
         GROUP BY a_1.uuid, a_1.idtimeslice
     )
SELECT DISTINCT a.uuid                        AS identifier,
                CASE
                    WHEN a.type::text = 'R'::text THEN 'RESTRICTED'::text
                    WHEN a.type::text = 'D'::text THEN 'DANGEROUS'::text
                    WHEN a.type::text = 'P'::text THEN 'PROHIBITED'::text
                    WHEN a.type::text = 'A'::text THEN 'ALERT'::text
                    WHEN a.type::text = 'B'::text THEN 'BLASTING'::text
                    WHEN a.type::text = 'C'::text THEN 'CAUTION'::text
                    WHEN a.type::text = 'F'::text THEN 'ARTILLERY'::text
                    WHEN a.type::text = 'M'::text THEN 'MILITARY'::text
                    WHEN a.type::text = 'N'::text THEN 'NATIONAL'::text
                    WHEN a.type::text = 'S'::text THEN 'NATURE'::text
                    WHEN a.type::text = 'T'::text THEN 'TRAINING'::text
                    WHEN a.type::text = 'U'::text THEN 'UNKNOWN'::text
                    WHEN a.type::text = 'W'::text THEN 'WARNING'::text
                    WHEN a.type::text = 'FIR/UIR'::text THEN 'FIR_UIR'::text
                    --WHEN a._transasid::text ~~ 'MET%'::text THEN 'MET'::text
                    ELSE replace(a.type::text, 'OTHER: '::text, ''::text)
                    END                       AS type,
                a.designator                  AS nm,
                a.name                        AS nl,
                a.translation                 AS nl_ru,
                CASE
                    WHEN a.controltype::text = 'OTHER: PRIVATE'::text THEN 'PRIVATE'::character varying
                    ELSE a.controltype::character varying
                    END                       AS tp,
                concat(
                        CASE
                            WHEN a.upperlimitreference::text = 'SFC'::text THEN ''::text
                            ELSE NULL::text
                            END,
                        CASE
                            WHEN (a.upperlimit).unit::text = 'FL'::text THEN (a.upperlimit).unit::character varying
                            ELSE ''::character varying
                            END,
                        CASE
                            WHEN (a.upperlimit).value IS NULL THEN 'UNL'::text
                            ELSE round((a.upperlimit).value::numeric, 0)::text
                            END,
                        CASE
                            WHEN (a.upperlimit).unit::text = 'FT'::text THEN (a.upperlimit).unit::character varying
                            ELSE ''::character varying
                            END)              AS upperlimit,
                concat(
                        CASE
                            WHEN a.lowerlimitreference::text = 'SFC'::text THEN ''::text
                            ELSE NULL::text
                            END,
                        CASE
                            WHEN (a.lowerlimit).unit::text = 'FL'::text THEN (a.lowerlimit).unit::character varying
                            ELSE ''::character varying
                            END,
                        CASE
                            WHEN (a.lowerlimit).value IS NULL THEN 'GND'::text
                            ELSE round((a.lowerlimit).value::numeric, 0)::text
                            END,
                        CASE
                            WHEN (a.lowerlimit).unit::text = 'FT'::text THEN (a.lowerlimit).unit::character varying
                            ELSE ''::character varying
                            END)              AS lowerlimit,
                CASE
                    WHEN a.lowerlimitreference::text = 'SFC'::text THEN 'AGL'::text
                    WHEN a.lowerlimitreference::text = 'MSL'::text THEN 'AMSL'::text
                    WHEN a.lowerlimitreference::text = 'STD'::text THEN 'STD'::text
                    ELSE NULL::text
                    END                       AS lowerlimitreference,
                CASE
                    WHEN a.upperlimitreference::text = 'SFC'::text THEN 'AGL'::text
                    WHEN a.upperlimitreference::text = 'MSL'::text THEN 'AMSL'::text
                    WHEN a.upperlimitreference::text = 'STD'::text THEN 'STD'::text
                    ELSE NULL::text
                    END                       AS upperlimitreference,
                CASE
                    WHEN (a.lowerlimit).unit::text = 'M'::text THEN
                        CASE
                            WHEN (a.lowerlimit).value::numeric < 1000::numeric THEN
                                    round(floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                            ELSE round(floor((a.lowerlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                            END
                    ELSE NULL::numeric
                    END                       AS lowerlimit_ft,
                CASE
                    WHEN (a.upperlimit).unit::text = 'M'::text THEN
                        CASE
                            WHEN (a.upperlimit).value::numeric < 1000::numeric THEN
                                    round(floor((a.upperlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                            ELSE round(floor((a.upperlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                            END
                    ELSE NULL::numeric
                    END                       AS upperlimit_ft,
                (a.upperincludingvalue).value AS upperincludingvalue,
                (a.lowerincludingvalue).value AS lowerincludingvalue,
                concat(
                        CASE
                            WHEN (a.upperlimit).value IS NULL THEN 'UNL'::text
                            ELSE concat(
                                    CASE
                                        WHEN (a.upperincludingvalue).value IS FALSE OR
                                             (a.upperincludingvalue).value IS NULL THEN 'blw '::text
                                        ELSE NULL::text
                                        END,
                                    CASE
                                        WHEN (a.upperlimit).unit::text = 'FL'::text
                                            THEN (a.upperlimit).unit::character varying
                                        ELSE NULL::character varying
                                        END, round((a.upperlimit).value::numeric, 0)::text,
                                    CASE
                                        WHEN a.upperlimitreference::text = 'SFC'::text AND
                                             (a.upperlimit).unit::text = 'FT'::text THEN '`AGL'::text
                                        WHEN a.upperlimitreference::text = 'MSL'::text AND
                                             (a.upperlimit).unit::text = 'FT'::text THEN '`AMSL'::text
                                        WHEN (a.upperlimit).unit::text = 'FT'::text THEN '`'::text
                                        WHEN a.upperlimitreference::text = 'SFC'::text THEN concat('/',
                                                                                                   CASE
                                                                                                       WHEN (a.upperlimit).value::numeric < 1000::numeric
                                                                                                           THEN round(
                                                                                                                        floor((a.upperlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                                100::numeric
                                                                                                       ELSE round(
                                                                                                                    floor((a.upperlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                            500::numeric
                                                                                                       END, '`AGL')
                                        WHEN a.upperlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                                   CASE
                                                                                                       WHEN (a.upperlimit).value::numeric < 1000::numeric
                                                                                                           THEN round(
                                                                                                                        floor((a.upperlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                                100::numeric
                                                                                                       ELSE round(
                                                                                                                    floor((a.upperlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                            500::numeric
                                                                                                       END, '`AMSL')
                                        ELSE NULL::text
                                        END)
                            END, '#',
                        CASE
                            WHEN (a.lowerlimit).value IS NULL THEN 'GND'::text
                            ELSE concat(
                                    CASE
                                        WHEN (a.lowerincludingvalue).value IS FALSE OR
                                             (a.lowerincludingvalue).value IS NULL THEN 'abv '::text
                                        ELSE NULL::text
                                        END,
                                    CASE
                                        WHEN (a.lowerlimit).unit::text = 'FL'::text
                                            THEN (a.lowerlimit).unit::character varying
                                        ELSE NULL::character varying
                                        END, round((a.lowerlimit).value::numeric, 0)::text,
                                    CASE
                                        WHEN a.lowerlimitreference::text = 'SFC'::text AND
                                             (a.lowerlimit).unit::text = 'FT'::text THEN '`AGL'::text
                                        WHEN a.lowerlimitreference::text = 'MSL'::text AND
                                             (a.lowerlimit).unit::text = 'FT'::text THEN '`AMSL'::text
                                        WHEN (a.lowerlimit).unit::text = 'FT'::text THEN '`'::text
                                        WHEN a.lowerlimitreference::text = 'SFC'::text THEN concat('/',
                                                                                                   CASE
                                                                                                       WHEN (a.lowerlimit).value::numeric < 1000::numeric
                                                                                                           THEN round(
                                                                                                                        floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                                100::numeric
                                                                                                       ELSE round(
                                                                                                                    floor((a.lowerlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                            500::numeric
                                                                                                       END, '`AGL')
                                        WHEN a.lowerlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                                   CASE
                                                                                                       WHEN (a.lowerlimit).value::numeric < 1000::numeric
                                                                                                           THEN round(
                                                                                                                        floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                                100::numeric
                                                                                                       ELSE round(
                                                                                                                    floor((a.lowerlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                            500::numeric
                                                                                                       END, '`AMSL')
                                        ELSE NULL::text
                                        END)
                            END)              AS he,
                CASE
                    WHEN aact.status::text IS NOT NULL THEN aact.status::text
                    WHEN rcos.operationalstatus::text IS NOT NULL THEN rcos.operationalstatus::text
                    ELSE NULL::text
                    END                       AS status,
                alc.classification            AS class,
                timeslice.validtimebegin              AS beginposition,
                timeslice.validtimeend                AS endposition,
               --- timeslice.correctionnumber AS correctionnumber,
                rw."time",
                CASE
                    WHEN NOT st_isvalid(a.geom) THEN NULL::geometry
                    WHEN st_intersects(a.geom, st_setsrid(
                            st_makeline(st_makepoint(180::double precision, '-90'::integer::double precision),
                                        st_makepoint('-180'::integer::double precision, 90::double precision)), 4326))
                        THEN st_shiftlongitude(a.geom)
                    ELSE a.geom
                    END                       AS geom,
            fr_with_name.cs_tf_ru,
            fr_with_name.cs_tf
FROM airspacetimeslice a
         LEFT JOIN airspace_service a_management ON a.uuid::uuid = a_management.uuidairspc::uuid
         LEFT JOIN airtrafficmanagementservice amsts ON a_management.uuidairtrafficmanagementservice::uuid = amsts.uuid::uuid
         LEFT JOIN callsigndetail ON amsts.uuid::uuid = callsigndetail.uuidservice::uuid
         LEFT JOIN service_radiocommunicationchannel s_rcch
                   ON a_management.uuidairtrafficmanagementservice::uuid = s_rcch.uuidservice::uuid
         LEFT JOIN radiocommunicationchannel rcchts ON s_rcch.uuidradiocommunicationchannel::uuid = rcchts.uuid::uuid
         LEFT JOIN airspaceactivation aact ON a.uuid::uuid = aact.uuidairspc::uuid
         LEFT JOIN radiocommunicationoperationalstatus rcos ON a.uuid::uuid = rcos.uuidairspc::uuid
         LEFT JOIN airspacelayerclass alc ON a.uuid::uuid = alc.uuidairspc::uuid
         LEFT JOIN rw ON rw.idpropertieswithschedule = aact.id
         --- зависает если OR
         -- OR rw.idpropertieswithschedule = rcos.id
         LEFT JOIN fr_with_name ON fr_with_name.uuid::uuid = a.uuid::uuid and fr_with_name.idtimeslice = a.idtimeslice
         LEFT JOIN timeslice ON timeslice.idtimeslice = a.idtimeslice
         LEFT JOIN cor ON cor.a::integer = a.idtimeslice
where a.idtimeslice::text in (select * from cor)
GROUP BY a.uuid, a.designator, a.name, a.translation,
         (
             CASE
                 WHEN a.controltype::text = 'OTHER: PRIVATE'::text THEN 'PRIVATE'::character varying
                 ELSE a.controltype::character varying
                 END), a.lowerlimit, a.lowerlimitreference, a.upperlimit, a.upperlimitreference,
         (concat(
                 CASE
                     WHEN (a.upperlimit).value IS NULL THEN 'UNL'::text
                     ELSE concat(
                             CASE
                                 WHEN (a.upperincludingvalue).value IS FALSE OR (a.upperincludingvalue).value IS NULL
                                     THEN 'blw '::text
                                 ELSE NULL::text
                                 END,
                             CASE
                                 WHEN (a.upperlimit).unit::text = 'FL'::text THEN (a.upperlimit).unit::character varying
                                 ELSE NULL::character varying
                                 END, round((a.upperlimit).value::numeric, 0)::text,
                             CASE
                                 WHEN a.upperlimitreference::text = 'SFC'::text AND (a.upperlimit).unit::text = 'FT'::text
                                     THEN '`AGL'::text
                                 WHEN a.upperlimitreference::text = 'MSL'::text AND (a.upperlimit).unit::text = 'FT'::text
                                     THEN '`AMSL'::text
                                 WHEN (a.upperlimit).unit::text = 'FT'::text THEN '`'::text
                                 WHEN a.upperlimitreference::text = 'SFC'::text THEN concat('/',
                                                                                            CASE
                                                                                                WHEN (a.upperlimit).value::numeric < 1000::numeric
                                                                                                    THEN round(
                                                                                                                 floor((a.upperlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                         100::numeric
                                                                                                ELSE round(
                                                                                                             floor((a.upperlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                     500::numeric
                                                                                                END, '`AGL')
                                 WHEN a.upperlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                            CASE
                                                                                                WHEN (a.upperlimit).value::numeric < 1000::numeric
                                                                                                    THEN round(
                                                                                                                 floor((a.upperlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                         100::numeric
                                                                                                ELSE round(
                                                                                                             floor((a.upperlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                     500::numeric
                                                                                                END, '`AMSL')
                                 ELSE NULL::text
                                 END)
                     END, '#',
                 CASE
                     WHEN (a.lowerlimit).value IS NULL THEN 'GND'::text
                     ELSE concat(
                             CASE
                                 WHEN (a.lowerincludingvalue).value IS FALSE OR (a.lowerincludingvalue).value IS NULL
                                     THEN 'abv '::text
                                 ELSE NULL::text
                                 END,
                             CASE
                                 WHEN (a.lowerlimit).unit::text = 'FL'::text THEN (a.lowerlimit).unit::character varying
                                 ELSE NULL::character varying
                                 END, round((a.lowerlimit).value::numeric, 0)::text,
                             CASE
                                 WHEN a.lowerlimitreference::text = 'SFC'::text AND (a.lowerlimit).unit::text = 'FT'::text
                                     THEN '`AGL'::text
                                 WHEN a.lowerlimitreference::text = 'MSL'::text AND (a.lowerlimit).unit::text = 'FT'::text
                                     THEN '`AMSL'::text
                                 WHEN (a.lowerlimit).unit::text = 'FT'::text THEN '`'::text
                                 WHEN a.lowerlimitreference::text = 'SFC'::text THEN concat('/',
                                                                                            CASE
                                                                                                WHEN (a.lowerlimit).value::numeric < 1000::numeric
                                                                                                    THEN round(
                                                                                                                 floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                         100::numeric
                                                                                                ELSE round(
                                                                                                             floor((a.lowerlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                     500::numeric
                                                                                                END, '`AGL')
                                 WHEN a.lowerlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                            CASE
                                                                                                WHEN (a.lowerlimit).value::numeric < 1000::numeric
                                                                                                    THEN round(
                                                                                                                 floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                                         100::numeric
                                                                                                ELSE round(
                                                                                                             floor((a.lowerlimit).value::numeric) / 0.3048 / 500::numeric) *
                                                                                                     500::numeric
                                                                                                END, '`AMSL')
                                 ELSE NULL::text
                                 END)
                     END)), aact.status, rcos.operationalstatus, alc.classification, timeslice.validtimebegin, timeslice.validtimeend, timeslice.correctionnumber,
         rw."time",
        fr_with_name.cs_tf_ru, fr_with_name.cs_tf,
         a.geom,
         (
             CASE
                 WHEN (a.upperlimit).unit::text = 'M'::text THEN
                     CASE
                         WHEN (a.upperlimit).value::numeric < 1000::numeric THEN
                                 round(floor((a.upperlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                         ELSE round(floor((a.upperlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                         END
                 ELSE NULL::numeric
                 END),
         (
             CASE
                 WHEN (a.lowerlimit).unit::text = 'M'::text THEN
                     CASE
                         WHEN (a.lowerlimit).value::numeric < 1000::numeric THEN
                                 round(floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                         ELSE round(floor((a.lowerlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                         END
                 ELSE NULL::numeric
                 END), a.type, a.upperincludingvalue, a.lowerincludingvalue;



create index airspace_indx
    on airspace_mat (identifier);
-------------

--------------gridmora_mat ----удалено округление к 500 при переводе в футы (оставлено до 100)

create materialized view gridmora_mat as
WITH cor AS (
    SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text, 1) AS a
    FROM airspacetimeslice dp
             LEFT JOIN airspace d ON d.uuid::uuid = dp.uuid::uuid
             LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
    WHERE t.validtimeend IS NULL
      AND dp.localtype::text IS NOT NULL
    GROUP BY d.uuid
)
SELECT DISTINCT a.uuid                   AS identifier,
                CASE
                    WHEN air._transasid::text ~~ '1deg%'::text THEN 'AMA30'::text
                    WHEN air._transasid::text ~~ '2deg%'::text THEN 'AMA1'::text
                    WHEN air._transasid::text ~~ 'ama%'::text THEN 'AMA15'::text
                    ELSE NULL::text
                    END                  AS type,
                a.localtype::text        AS tp,
                concat(
                        CASE
                            WHEN a.lowerlimitreference::text = 'SFC'::text THEN ''::text
                            ELSE NULL::text
                            END,
                        CASE
                            WHEN (a.lowerlimit).unit::text = 'FL'::text THEN (a.lowerlimit).unit::character varying
                            ELSE ''::character varying
                            END,
                        CASE
                            WHEN (a.lowerlimit).value IS NULL THEN 'GND'::text
                            ELSE round((a.lowerlimit).value::numeric, 0)::text
                            END,
                        CASE
                            WHEN (a.lowerlimit).unit::text = 'FT'::text THEN (a.lowerlimit).unit::character varying
                            ELSE ''::character varying
                            END)         AS lowerlimit,
                CASE
                    WHEN (a.lowerlimit).unit::text = 'M'::text THEN
                            round(floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                    ELSE NULL::numeric
                    END                  AS lowerlimit_ft,
                timeslice.validtimebegin AS beginposition,
                timeslice.validtimeend   AS endposition,
                CASE
                    WHEN NOT st_isvalid(a.geom) THEN NULL::geometry
                    WHEN st_intersects(a.geom, st_setsrid(
                            st_makeline(st_makepoint(180::double precision, '-90'::integer::double precision),
                                        st_makepoint('-180'::integer::double precision, 90::double precision)), 4326))
                        THEN st_shiftlongitude(a.geom)
                    ELSE a.geom
                    END                  AS geom
FROM airspacetimeslice a
         LEFT JOIN airspace_service a_management ON a.uuid::uuid = a_management.uuidairspc::uuid
         LEFT JOIN airtrafficmanagementservice amsts ON a_management.uuidairtrafficmanagementservice::uuid = amsts.uuid::uuid
         LEFT JOIN callsigndetail ON amsts.uuid::uuid = callsigndetail.uuidservice::uuid
         LEFT JOIN service_radiocommunicationchannel s_rcch
                   ON a_management.uuidairtrafficmanagementservice::uuid = s_rcch.uuidservice::uuid
         LEFT JOIN radiocommunicationchannel rcchts ON s_rcch.uuidradiocommunicationchannel::uuid = rcchts.uuid::uuid
         LEFT JOIN airspaceactivation aact ON a.uuid::uuid = aact.uuidairspc::uuid
         LEFT JOIN radiocommunicationoperationalstatus rcos ON a.uuid::uuid = rcos.uuidairspc::uuid
         LEFT JOIN airspacelayerclass alc ON a.uuid::uuid = alc.uuidairspc::uuid
         LEFT JOIN timeslice ON timeslice.idtimeslice = a.idtimeslice
         LEFT JOIN airspace air ON a.uuid::uuid = air.uuid::uuid
         LEFT JOIN cor ON cor.a::integer = a.idtimeslice
WHERE (a.idtimeslice::text IN (SELECT cor_1.a
                               FROM cor cor_1))
  AND a.localtype::text IS NOT NULL
  AND (air._transasid::text ~~ '1deg%'::text OR air._transasid::text ~~ '2deg%'::text OR
       air._transasid::text ~~ 'ama%'::text)
GROUP BY a.uuid,
                CASE
                    WHEN air._transasid::text ~~ '1deg%'::text THEN 'AMA30'::text
                    WHEN air._transasid::text ~~ '2deg%'::text THEN 'AMA1'::text
                    WHEN air._transasid::text ~~ 'ama%'::text THEN 'AMA15'::text
                    ELSE NULL::text
                    END ,
                a.localtype::text,
                concat(
                        CASE
                            WHEN a.lowerlimitreference::text = 'SFC'::text THEN ''::text
                            ELSE NULL::text
                            END,
                        CASE
                            WHEN (a.lowerlimit).unit::text = 'FL'::text THEN (a.lowerlimit).unit::character varying
                            ELSE ''::character varying
                            END,
                        CASE
                            WHEN (a.lowerlimit).value IS NULL THEN 'GND'::text
                            ELSE round((a.lowerlimit).value::numeric, 0)::text
                            END,
                        CASE
                            WHEN (a.lowerlimit).unit::text = 'FT'::text THEN (a.lowerlimit).unit::character varying
                            ELSE ''::character varying
                            END),
                CASE
                    WHEN (a.lowerlimit).unit::text = 'M'::text THEN
                            round(floor((a.lowerlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                    ELSE NULL::numeric
                    END,
                timeslice.validtimebegin,
                timeslice.validtimeend,
                CASE
                    WHEN NOT st_isvalid(a.geom) THEN NULL::geometry
                    WHEN st_intersects(a.geom, st_setsrid(
                            st_makeline(st_makepoint(180::double precision, '-90'::integer::double precision),
                                        st_makepoint('-180'::integer::double precision, 90::double precision)), 4326))
                        THEN st_shiftlongitude(a.geom)
                    ELSE a.geom
                    END;


create index gridmora_indx
    on gridmora_mat (identifier);



-------
create materialized view markerbeacon_mat as

    with cor as
(
SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM markerbeacon dp
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY dp.uuid
    )
SELECT mb.uuid            AS identifier,
       mb.class,
       CASE
           WHEN (mb.frequency).value IS NOT NULL THEN concat((mb.frequency).value, ' ', (mb.frequency).unit)
           ELSE NULL::text
           END            AS frequency,
       mb.axisbearing,
       mb.auralmorsecode,
       naveq.designator,
       CASE
           WHEN naveq.magneticvariation::numeric <> trunc(naveq.magneticvariation::numeric) THEN naveq.magneticvariation::numeric
           ELSE trunc(naveq.magneticvariation::numeric)
           END            AS magneticvariation,
       concat(dd2dms(
                      CASE
                          WHEN naveq.latitude::numeric < 0::numeric THEN naveq.latitude::numeric * '-1'::integer::numeric
                          ELSE naveq.latitude::numeric
                          END::double precision, 'lat'::character varying),
              CASE
                  WHEN naveq.latitude::numeric < 0::numeric THEN 'S'::text
                  ELSE 'N'::text
                  END,
              CASE
                  WHEN naveq.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)    AS latitude,
       concat(dd2dms(
                      CASE
                          WHEN naveq.longitude::numeric < 0::numeric THEN naveq.longitude::numeric * '-1'::integer::numeric
                          ELSE naveq.longitude::numeric
                          END::double precision, 'lon'::character varying),
              CASE
                  WHEN naveq.longitude::numeric < 0::numeric THEN 'W'::text
                  ELSE 'E'::text
                  END,
              CASE
                  WHEN naveq.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)    AS longitude,
       naveq.srid,
       nav.uuidarphlp     AS uuidairportheliport,
       arp.name           AS nameairportheliport,
       t.validtimebegin AS beginposition,
       t.validtimeend   AS endposition,
       ---t.correctionnumber AS correctionnumber,
       CASE
           WHEN st_isvalid(naveq.geom) THEN naveq.geom
           ELSE NULL::geometry
           END            AS geom
FROM markerbeacon mb
         LEFT JOIN navaidequipmenttimeslice naveq ON mb.idtimeslice = naveq.idtimeslice
         LEFT JOIN navaid_navaidequipment ON naveq.uuid::uuid = navaid_navaidequipment.uuidnavaidequipment::uuid
         LEFT JOIN navaidtimeslice nav ON navaid_navaidequipment.uuidnavaid::uuid = nav.uuid::uuid
         LEFT JOIN airportheliporttimeslice arp ON arp.uuid::uuid = nav.uuidarphlp::uuid
         LEFT JOIN timeslice t on mb.idtimeslice = t.idtimeslice
         LEFT JOIN cor on mb.idtimeslice = cor.a::integer
   where mb.idtimeslice::text in (select * from cor);

create index mark_indx
    on markerbeacon_mat (identifier);


-----------------procedure_mat добавлен flighttransition---------

create materialized view procedure_mat as
WITH geometry AS (
    SELECT airportheliport.uuid               AS arp_id,
           st_asgeojson(airportheliport.geom) AS geom
    FROM airportheliporttimeslice airportheliport
),
     transitionid_sel AS (
         SELECT array_agg(DISTINCT pr_tran_1.transitionid) AS transitionid,
                pr_1.uuid
         FROM procedure pr_1
                  LEFT JOIN proceduretransition pr_tran_1 ON pr_tran_1.uuidprocedure::uuid = pr_1.uuid::uuid
         GROUP BY pr_1.uuid
     ),
     cor_sid AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text,
                           1) AS a
         FROM standardinstrumentdeparturetimeslice dp
                  LEFT JOIN standardinstrumentdeparture d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         WHERE t.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     cor_star AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text,
                           1) AS a
         FROM standardinstrumentarrivaltimeslice dp
                  LEFT JOIN standardinstrumentarrival d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         WHERE t.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     cor_iap AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text,
                           1) AS a
         FROM instrumentapproachproceduretimeslice dp
                  LEFT JOIN instrumentapproachprocedure d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         WHERE t.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     cor AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text,
                           1) AS a
         FROM proceduretimeslice dp
                  LEFT JOIN procedure d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         WHERE t.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     instructions AS (
         SELECT pr_1.uuid,
                pr_1.instruction,
                regexp_split_to_table(pr_1.instruction::text, ','::text) AS splited_instruction
         FROM proceduretimeslice pr_1
                  JOIN airportheliporttimeslice arp_1 ON pr_1.uuidarphlp::uuid = arp_1.uuid::uuid
                  LEFT JOIN cor cor_1 ON pr_1.idtimeslice = cor_1.a::integer
         WHERE (pr_1.idtimeslice::text IN (SELECT cor_1_1.a
                                           FROM cor cor_1_1))
     ),
     air_instructions AS (
         SELECT instructions_1.uuid,
                instructions_1.splited_instruction AS gradient_air
         FROM instructions instructions_1
         WHERE instructions_1.splited_instruction ~~ '%air%'::text
     ),
     obs_instructions AS (
         SELECT instructions_1.uuid,
                instructions_1.splited_instruction AS gradient_obs
         FROM instructions instructions_1
         WHERE instructions_1.splited_instruction ~~ '%obstacl%'::text
     )
SELECT pr.uuid                                                               AS identifier,
       pr.codingstandard,
       pr.name,
       (pr.rnav).value                                                       AS rnav,
       COALESCE((stin_dep.designator).pattern, (stin_ar.designator).pattern) AS designator,
       tr.transitionid,
       (pr_tran.type).value                                                  AS transitiontype,
       (inap_pr.approachprefix).value                                        AS approachprefix,
       (inap_pr.approachtype).value                                          AS approachtype,
       inap_pr.multipleidentification,
       inap_pr.coptertrack,
       inap_pr.circlingidentification,
       inap_pr.coursereversalinstruction,
       (inap_pr.additionalequipment).value                                   AS additionalequipment,
       (inap_pr.channelgnss).value                                           AS channelgnss,
       inap_pr.waasreliable,
       arp.uuid                                                              AS uuidairportheliport,
       arp.name                                                              AS nameairportheliport,
       CASE
           WHEN inap_pr.uuid IS NOT NULL THEN 'IAP'::text
           WHEN stin_ar.uuid IS NOT NULL THEN 'STAR'::text
           WHEN stin_dep.uuid IS NOT NULL THEN 'SID'::text
           ELSE NULL::text
           END                                                               AS procedure,
       inap_pr.idlanding                                                     AS landing,
       inap_pr.idfinalprofile                                                AS final_profile,
       CASE
           WHEN st_isvalid(curve.geom) THEN curve.geom
           ELSE NULL::geometry
           END                                                               AS geom,
       timeslice.validtimebegin                                              AS beginposition,
       timeslice.validtimeend                                                AS endposition,
       timeslice.correctionnumber,
       timeslice.idtimeslice,
       instructions.instruction,
       air_instructions.gradient_air,
       obs_instructions.gradient_obs,
       pr.flighttransition
FROM proceduretimeslice pr
         LEFT JOIN airportheliporttimeslice arp ON pr.uuidarphlp::uuid = arp.uuid::uuid
         LEFT JOIN geometry g ON arp.uuid::uuid = g.arp_id::uuid
         LEFT JOIN standardinstrumentdeparturetimeslice stin_dep
                   ON stin_dep.uuid::uuid = pr.uuid::uuid AND (stin_dep.idtimeslice::text IN (SELECT cor_1.a
                                                                                              FROM cor_sid cor_1))
         LEFT JOIN instrumentapproachproceduretimeslice inap_pr
                   ON inap_pr.uuid::uuid = pr.uuid::uuid AND (inap_pr.idtimeslice::text IN (SELECT cor_1.a
                                                                                            FROM cor_iap cor_1))
         LEFT JOIN standardinstrumentarrivaltimeslice stin_ar
                   ON stin_ar.uuid::uuid = pr.uuid::uuid AND (stin_ar.idtimeslice::text IN (SELECT cor_1.a
                                                                                            FROM cor_star cor_1))
         LEFT JOIN proceduretransition pr_tran ON pr_tran.uuidprocedure::uuid = pr.uuid::uuid AND
                                                  pr_tran.flighttransition::uuid = pr.flighttransition::uuid
         LEFT JOIN transitionid_sel tr ON tr.uuid::uuid = pr.uuid::uuid
         LEFT JOIN curve ON pr_tran.idcurve = curve.id AND pr_tran.flighttransition::uuid = pr.flighttransition::uuid
         LEFT JOIN instructions ON instructions.uuid::uuid = pr.uuid::uuid
         LEFT JOIN air_instructions ON air_instructions.uuid::uuid = pr.uuid::uuid
         LEFT JOIN obs_instructions ON obs_instructions.uuid::uuid = pr.uuid::uuid
         LEFT JOIN timeslice ON timeslice.idtimeslice = pr.idtimeslice
         LEFT JOIN cor ON pr.idtimeslice = cor.a::integer
         LEFT JOIN cor_sid ON stin_dep.idtimeslice = cor_sid.a::integer
         LEFT JOIN cor_star ON stin_ar.idtimeslice = cor_star.a::integer
         LEFT JOIN cor_iap ON inap_pr.idtimeslice = cor_iap.a::integer
WHERE (pr.idtimeslice::text IN (SELECT cor_1.a
                                FROM cor cor_1))
GROUP BY pr.uuid, pr.codingstandard, pr.name, pr.rnav, tr.transitionid, pr_tran.type,
         (COALESCE((stin_dep.designator).pattern, (stin_ar.designator).pattern)), inap_pr.approachprefix,
         inap_pr.approachtype, inap_pr.multipleidentification, inap_pr.coptertrack, inap_pr.circlingidentification,
         inap_pr.coursereversalinstruction, inap_pr.additionalequipment, inap_pr.channelgnss, inap_pr.waasreliable,
         arp.uuid, arp.name,
         (
             CASE
                 WHEN inap_pr.uuid IS NOT NULL THEN 'IAP'::text
                 WHEN stin_ar.uuid IS NOT NULL THEN 'STAR'::text
                 WHEN stin_dep.uuid IS NOT NULL THEN 'SID'::text
                 ELSE NULL::text
                 END), inap_pr.idlanding, inap_pr.idfinalprofile, curve.geom, timeslice.validtimebegin,
         timeslice.validtimeend, timeslice.correctionnumber, timeslice.idtimeslice, instructions.instruction,
         air_instructions.gradient_air, obs_instructions.gradient_obs, pr.flighttransition;

create index proc_indx
    on procedure_mat (identifier);

create index procarp_indx
    on procedure_mat (uuidairportheliport);


----------------------nav_points---design_points---rt_note---уточнить---
-------------------routesegment_mat_test---добавлены поля start_point \ endpoint для связи  c segmentpoint
----(mbase добавлена связь между routesegmenttimeslice - segmentpoint)

create materialized view routesegment_mat as
WITH nav_actual AS (
    SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text, 1) AS a
    FROM navaidtimeslice dp
             LEFT JOIN navaid d ON d.uuid::uuid = dp.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d.uuid
),
     des_actual AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM designatedpointtimeslice dp
                  LEFT JOIN designatedpoint d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
           ---костыль от дублей из xml
           and dp.name is null and type not in ('TERMINAL')
         GROUP BY d.uuid
     ),
     nav_points AS (
         SELECT nav.idelevatedpoint AS id,
                nav.designator,
                nav.idtimeslice
         FROM navaidtimeslice nav
                  LEFT JOIN nav_actual ON nav.idtimeslice = nav_actual.a::integer
         WHERE (nav.idtimeslice::text IN (SELECT nav_actual_1.a
                                          FROM nav_actual nav_actual_1))
     ),
     design_points AS (
         SELECT nav.idelevatedpoint AS id,
                nav.designator
         FROM designatedpointtimeslice nav
                  LEFT JOIN des_actual ON nav.idtimeslice = des_actual.a::integer
         WHERE (nav.idtimeslice::text IN (SELECT des_actual_1.a
                                          FROM des_actual des_actual_1))
     ),
     rt_note AS (
         SELECT rn.idtimeslicertseg,
                string_agg(note.propertyname::text, ';'::text) AS name
         FROM note
                  JOIN routesegment_note rn ON note.id = rn.idnote
         GROUP BY rn.idtimeslicertseg
     ),
     cor AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM routesegmenttimeslice dp
                  LEFT JOIN routesegment d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     )
SELECT rs.uuid                                                                                       AS identifier,
       r.country,
       rs.widthleft,
       rs.widthright,
       r.locationdesignator                                                                          AS nm,
       r.internationaluse,
       (rs.length).value                                                                             AS lb,
       (rs.length).unit                                                                              AS lb_unit,
       rs.magnetictrack                                                                              AS mta,
       rs.reversemagnetictrack                                                                       AS rmta,
       concat(
               CASE
                   WHEN (rs.lowerlimit).value IS NULL THEN 'GND'::text
                   ELSE concat(
                           CASE
                               WHEN (rs.lowerlimit).unit::text = 'FL'::text THEN 'FL'::text
                               ELSE NULL::text
                               END,
                           CASE
                               WHEN round((rs.lowerlimit).value::numeric, 0)::integer < 100
                                   THEN concat('0', round((rs.lowerlimit).value::numeric, 0))
                               ELSE round((rs.lowerlimit).value::numeric, 0)::text
                               END,
                           CASE
                               WHEN (rs.lowerlimit).unit IS NULL OR ((rs.lowerlimit).unit::text = ANY
                                                                     (ARRAY ['FT'::character varying::text, 'ft'::character varying::text]))
                                   THEN 'ft'::text
                               ELSE NULL::text
                               END,
                           CASE
                               WHEN (rs.lowerlimit).value IS NULL THEN ''::text
                               WHEN (rs.lowerlimit).unit::text = 'M'::text THEN concat('/', round(
                                                                                                    floor((rs.lowerlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                            100::numeric, 'ft')
                               ELSE NULL::text
                               END)
                   END, '-',
               CASE
                   WHEN (rs.upperlimit).value IS NULL THEN 'UNL'::text
                   ELSE concat(
                           CASE
                               WHEN (rs.upperlimit).unit::text = 'FL'::text THEN 'FL'::text
                               ELSE NULL::text
                               END,
                           CASE
                               WHEN round((rs.upperlimit).value::numeric, 0)::integer < 100
                                   THEN concat('0', round((rs.upperlimit).value::numeric, 0))
                               ELSE round((rs.upperlimit).value::numeric, 0)::text
                               END,
                           CASE
                               WHEN (rs.upperlimit).unit IS NULL OR ((rs.upperlimit).unit::text = ANY
                                                                     (ARRAY ['FT'::character varying::text, 'ft'::character varying::text]))
                                   THEN 'ft'::text
                               ELSE NULL::text
                               END,
                           CASE
                               WHEN (rs.upperlimit).value IS NULL THEN ''::text
                               WHEN (rs.upperlimit).unit::text = 'M'::text THEN concat('/', round(
                                                                                                    floor((rs.upperlimit).value::numeric) / 0.3048 / 100::numeric) *
                                                                                            100::numeric, 'ft')
                               ELSE NULL::text
                               END)
                   END)                                                                              AS he,
       t.validtimebegin                                                                              AS beginposition,
       t.validtimeend                                                                                AS endposition,
       CASE
           WHEN st_isvalid(rs.geom) THEN rs.geom
           ELSE NULL::geometry
           END                                                                                       AS geom,
       concat(
               CASE
                   WHEN rs.upperlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (rs.upperlimit).unit::text = 'FL'::text THEN (rs.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (rs.upperlimit).value IS NULL THEN 'UNL'::text
                   ELSE round((rs.upperlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (rs.upperlimit).unit::text = 'FT'::text THEN (rs.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END)                                                                              AS upperlimit,
       concat(
               CASE
                   WHEN rs.lowerlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (rs.lowerlimit).unit::text = 'FL'::text THEN (rs.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (rs.lowerlimit).value IS NULL THEN 'GND'::text
                   ELSE round((rs.lowerlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (rs.lowerlimit).unit::text = 'FT'::text THEN (rs.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END)                                                                              AS lowerlimit,
       rs.upperlimitreference,
       rs.lowerlimitreference,
       (rs.upperincludingvalue).value                                                                AS upperincludingvalue,
       (rs.lowerincludingvalue).value                                                                AS lowerincludingvalue,
       CASE
           WHEN (rs.lowerlimit).unit::text = 'M'::text THEN
               CASE
                   WHEN (rs.lowerlimit).value::numeric < 1000::numeric THEN
                           round(floor((rs.lowerlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                   ELSE round(floor((rs.lowerlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                   END
           ELSE NULL::numeric
           END                                                                                       AS lowerlimit_ft,
       CASE
           WHEN (rs.upperlimit).unit::text = 'M'::text THEN
               CASE
                   WHEN (rs.upperlimit).value::numeric < 1000::numeric THEN
                           round(floor((rs.upperlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                   ELSE round(floor((rs.upperlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                   END
           ELSE NULL::numeric
           END                                                                                       AS upperlimit_ft,
       COALESCE(nav_start.designator::character varying, design_start.designator::character varying) AS ps,
       COALESCE(nav_end.designator::character varying, design_end.designator::character varying)     AS pe,
       rtn.name                                                                                      AS sg_text,
       concat((
                      CASE
                          WHEN (rs.widthleft).value IS NULL THEN 0::numeric
                          ELSE (rs.widthleft).value::numeric
                          END +
                      CASE
                          WHEN (rs.widthright).value IS NULL THEN 0::numeric
                          ELSE (rs.widthright).value::numeric
                          END)::integer, ' км')                                                      AS wd,
       CASE
           WHEN rtn.name = 'по согласованию с ОВД'::text THEN 1
           ELSE 0
           END                                                                                       AS sogl,
       rs.idenroutesegmentpointstart as start_point,
       rs.idenroutesegmentpointend  as end_point
FROM routesegmenttimeslice rs
         LEFT JOIN route ON route.uuid::uuid = rs.uuidroute::uuid
         LEFT JOIN routetimeslice r ON route.uuid::uuid = r.uuid::uuid
         LEFT JOIN rt_note rtn ON rs.idtimeslice = rtn.idtimeslicertseg

         LEFT JOIN nav_points nav_start ON nav_start.id = rs.idpointstart
         LEFT JOIN design_points design_start ON design_start.id = rs.idpointstart
         LEFT JOIN nav_points nav_end ON nav_end.id = rs.idpointend
         LEFT JOIN design_points design_end ON design_end.id = rs.idpointend

         LEFT JOIN timeslice t ON rs.idtimeslice = t.idtimeslice
         LEFT JOIN cor ON rs.idtimeslice = cor.a::integer
WHERE (route._transasid::text ~~* 'MVL%'::text OR route._transasid::text ~~* 'TRA%'::text)
  AND (rs.idtimeslice::text IN (SELECT cor_1.a
                                FROM cor cor_1));

create index routesegment_indx
    on routesegment_mat (identifier);

create index routesegment_2_indx
    on routesegment_mat (ps, pe);


--------

-------runway geom ????---

create materialized view runway_mat as
WITH cor AS (
    SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text, 1) AS a
    FROM runwaytimeslice dp
             LEFT JOIN runway d ON d.uuid::uuid = dp.uuid::uuid
             LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
    WHERE t.validtimeend IS NULL
      and geom is not null
    GROUP BY d.uuid
),
     actual_arp AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text,
                           1) AS a
         FROM airportheliporttimeslice dp
                  LEFT JOIN airportheliport d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         WHERE t.validtimeend IS NULL
         GROUP BY d.uuid
     )
SELECT runwaytimeslice.uuid                                                             AS identifier,
       runwaytimeslice.designator,
       runwaytimeslice.type,
       concat((runwaytimeslice.length).value::text, ' ', (runwaytimeslice.length).unit) AS length,
       concat((runwaytimeslice.width).value::text, ' ', (runwaytimeslice.width).unit)   AS width,
       (runwaytimeslice.composition).value                                              AS composition,
       runwaytimeslice.pavementtypepcn,
       runwaytimeslice.pavementsubgradepcn,
       runwaytimeslice.maxtyrepressurepcn,
       runwaytimeslice.evaluationmethodpcn,
       runwaytimeslice.classpcn,
       runwaytimeslice.widthshoulder,
       runwaytimeslice.uuidarphlp                                                       AS uuidairportheliport,
       arp.name                                                                         AS nameairportheliport,
       timeslice.validtimebegin                                                         AS beginposition,
       timeslice.validtimeend                                                           AS endposition,
       CASE
           WHEN st_intersects(runwaytimeslice.geom, st_setsrid(
                   st_makeline(st_makepoint(180::double precision, '-90'::integer::double precision),
                               st_makepoint('-180'::integer::double precision, 90::double precision)), 4326))
               THEN st_shiftlongitude(runwaytimeslice.geom)
           ELSE runwaytimeslice.geom
           END                                                                          AS geom
FROM runwaytimeslice
         LEFT JOIN runwaydirectiontimeslice rundir ON runwaytimeslice.uuid::uuid = rundir.uuidrunway::uuid
         LEFT JOIN airportheliporttimeslice arp ON arp.uuid::uuid = runwaytimeslice.uuidarphlp::uuid
         LEFT JOIN timeslice ON runwaytimeslice.idtimeslice = timeslice.idtimeslice
         LEFT JOIN cor ON cor.a::integer = runwaytimeslice.idtimeslice
         LEFT JOIN actual_arp ON actual_arp.a::integer = arp.idtimeslice
WHERE (runwaytimeslice.idtimeslice::text IN (SELECT cor_1.a
                                             FROM cor cor_1))
GROUP BY runwaytimeslice.uuidarphlp, arp.name, runwaytimeslice.uuid, runwaytimeslice.designator, runwaytimeslice.type,
         (concat((runwaytimeslice.length).value::text, ' ', (runwaytimeslice.length).unit)),
         (concat((runwaytimeslice.width).value::text, ' ', (runwaytimeslice.width).unit)),
         ((runwaytimeslice.composition).value), runwaytimeslice.pavementtypepcn, runwaytimeslice.pavementsubgradepcn,
         runwaytimeslice.maxtyrepressurepcn, runwaytimeslice.evaluationmethodpcn, runwaytimeslice.classpcn,
         runwaytimeslice.widthshoulder, timeslice.validtimebegin, timeslice.validtimeend,
         (
             CASE
                 WHEN st_intersects(runwaytimeslice.geom, st_setsrid(
                         st_makeline(st_makepoint(180::double precision, '-90'::integer::double precision),
                                     st_makepoint('-180'::integer::double precision, 90::double precision)), 4326))
                     THEN st_shiftlongitude(runwaytimeslice.geom)
                 ELSE runwaytimeslice.geom
                 END);











create materialized view verticalstructure_mat as

WITH cor AS (
    SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text, 1) AS a
    FROM verticalstructuretimeslice dp
             LEFT JOIN verticalstructure d ON d.uuid::uuid = dp.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d.uuid
)
SELECT vsp.id                     AS identifier,
       vsp.type                   AS type_obs,
       vs.name,
       (vsp.elevation).value || ' ' || (vsp.elevation).unit AS ab,
       (vsp.verticalextent).value|| ' '|| (vsp.verticalextent).unit AS ta,
       (vs.lighted).value         AS le,
       vsp.geom,
       vsp.longitude,
       vsp.latitude,
       vsp.srid,
       t.validtimebegin           AS beginposition,
       t.validtimeend             AS endposition
FROM verticalstructuretimeslice vs
         LEFT JOIN verticalstructurepart vsp ON vsp.uuidverticalstructure::uuid = vs.uuid::uuid
         LEFT JOIN timeslice t ON vs.idtimeslice = t.idtimeslice
         LEFT JOIN cor ON cor.a::integer = vs.idtimeslice
WHERE (vs.idtimeslice::text IN (SELECT cor_1.a
                                FROM cor cor_1));

create index verticalstructure_indx
    on verticalstructure_mat (identifier);

------------------
create materialized view safealtitudeareasector_mat as
WITH cor AS (
    SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text, 1) AS a
    FROM safealtitudeareasectortimeslice dp
             LEFT JOIN safealtitudeareasector d ON d.uuid::uuid = dp.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d.uuid
),
     msa_area_cor AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM safealtitudeareatimeslice dp
                  LEFT JOIN safealtitudearea d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     cor_proc AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM proceduretimeslice dp
                  LEFT JOIN procedure d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     )
SELECT DISTINCT msa.uuid                                                                         AS identifier,
                (safealtitudeareatimeslice.safeareatype).value                                   AS safeareatype,
                safealtitudeareatimeslice.location,
                safealtitudeareatimeslice.idnote,
                proceduretimeslice.uuid                                                          AS uuidprocedure,
                (msa.bufferwidth).value                                                          AS bufferwidth,
                (msa.bufferwidth).unit                                                           AS bufferwidth_uom,
                msa.horizontalaccuracy,
                msa.latitude,
                msa.longitude,
                msa.coord,
                msa.srid,
                msa.geom,
                (msa.arcdirection).value                                                         AS arcdirection,
                msa.fromangle,
                msa.toangle,
                (msa.angletype).value                                                            AS angletype,
                (msa.angledirectionreference).value                                              AS angledirectionreference,
                (msa.innerdistance).value                                                        AS innerdistance,
                (msa.innerdistance).unit                                                         AS innerdistance_uom,
                (msa.outerdistance).value                                                        AS outerdistance,
                (msa.outerdistance).unit                                                         AS outerdistance_uom,
                (msa.upperlimit).value                                                           AS upperlimit,
                (msa.upperlimit).unit                                                            AS upper_uom,
                msa.upperlimitreference,
                (msa.lowerlimit).value                                                           AS lowerlimit,
                (msa.lowerlimit).unit                                                            AS lower_uom,
                msa.lowerlimitreference,
                safealtitudeareatimeslice.uuidarphlp                                             AS uuidairportheliport,
                arp.name                                                                         AS nameairportheliport,
                t.validtimebegin                                                                 AS beginposition,
                t.validtimeend                                                                   AS endposition,
                procedure_mat.name                                                               AS nameprocedure,
                COALESCE(arp_2.designator::character varying, nav.designator::character varying) AS centerpoint_nm,
                procedure_mat.procedure,
                procedure_mat.transitionid,
                procedure_mat.rnav
FROM safealtitudeareasectortimeslice msa
         LEFT JOIN timeslice t ON msa.idtimeslice = t.idtimeslice
         LEFT JOIN safealtitudeareatimeslice
                   ON msa.uuidsafealtitudearea::uuid = safealtitudeareatimeslice.uuid::uuid AND
                      (safealtitudeareatimeslice.idtimeslice::text IN (SELECT cor.a
                                                                       FROM msa_area_cor cor))
         LEFT JOIN proceduretimeslice
                   ON safealtitudeareatimeslice.uuid::uuid = proceduretimeslice.uuidsafealtitudearea::uuid AND
                      (proceduretimeslice.idtimeslice::text IN (SELECT cor.a
                                                                FROM cor_proc cor))
         LEFT JOIN procedure_mat ON proceduretimeslice.uuid::uuid = procedure_mat.identifier::uuid
         LEFT JOIN airportheliport_mat arp ON arp.identifier::uuid = safealtitudeareatimeslice.uuidarphlp::uuid
         LEFT JOIN airportheliport_mat arp_2 ON arp_2.identifier::uuid = safealtitudeareatimeslice.centrepoint_arp::uuid
         LEFT JOIN navaid_mat nav ON nav.identifier::uuid = safealtitudeareatimeslice.centrepoint_nav::uuid
WHERE (msa.idtimeslice::text IN (SELECT cor_1.a
                                 FROM cor cor_1))
GROUP BY msa.uuid, ((safealtitudeareatimeslice.safeareatype).value), safealtitudeareatimeslice.location,
         safealtitudeareatimeslice.idnote, proceduretimeslice.uuid, ((msa.bufferwidth).value), ((msa.bufferwidth).unit),
         msa.horizontalaccuracy, msa.latitude, msa.longitude, msa.coord, msa.srid, msa.geom, ((msa.arcdirection).value),
         msa.fromangle, msa.toangle, ((msa.angletype).value), ((msa.angledirectionreference).value),
         ((msa.innerdistance).value), ((msa.innerdistance).unit), ((msa.outerdistance).value),
         ((msa.outerdistance).unit), ((msa.upperlimit).value), ((msa.upperlimit).unit), msa.upperlimitreference,
         ((msa.lowerlimit).value), ((msa.lowerlimit).unit), msa.lowerlimitreference,
         safealtitudeareatimeslice.uuidarphlp, arp.name, t.validtimebegin, t.validtimeend, procedure_mat.name,
         (COALESCE(arp_2.designator::character varying, nav.designator::character varying)), procedure_mat.procedure,
         procedure_mat.transitionid, procedure_mat.rnav;

create index safealt_indx
    on safealtitudeareasector_mat (identifier);


-----------------------------
create materialized view holdingpattern_mat as
WITH dsgn AS (
    SELECT designatedpoint.designator,
           designatedpoint.idsignificantpoint AS iddsgn,
           designatedpoint.uuid,
           designatedpoint.idtimeslice
    FROM designatedpointtimeslice designatedpoint

    where idtimeslice::text in

    (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM designatedpointtimeslice dp_1
             LEFT JOIN designatedpoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
)

),
    nav AS (
         SELECT navaid.designator,
                navaid.idsignificantpoint AS idnvd,
                navaid.uuid,
                navaid.idtimeslice
         FROM navaidtimeslice navaid
         where  navaid.idtimeslice::text
         in  (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM navaidtimeslice dp_1
             LEFT JOIN navaid d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
)
     ),

    cor as
(
SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM holdingpatterntimeslice dp
         LEFT JOIN holdingpattern d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid
    )
SELECT holdingpattern.uuid                                                                AS identifier,
       holdingpattern.idsegmentpoint,
       (holdingpattern.type).value                                                        AS type,
       holdingpattern.outboundcourse::integer                                             AS outboundcourse,
       (holdingpattern.outboundcoursetype).value                                          AS outboundcoursetype,
       holdingpattern.inboundcourse::integer                                              AS inboundcourse,
       (holdingpattern.inboundcoursetype).value                                           AS inboundcoursetype,
       holdingpattern.turndirection,
       concat(
               CASE
                   WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).value IS NULL THEN 'UNL'::text
                   ELSE round((holdingpattern.upperlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FT'::text
                       THEN ' '||(holdingpattern.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END)                                                                   AS upperlimit,
       concat(
               CASE
                   WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).value IS NULL THEN 'GND'::text
                   ELSE round((holdingpattern.lowerlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FT'::text
                       THEN ' '||(holdingpattern.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END)                                                                   AS lowerlimit,
       CASE
           WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN 'AGL'::text
           WHEN holdingpattern.lowerlimitreference::text = 'MSL'::text THEN 'AMSL'::text
           WHEN holdingpattern.lowerlimitreference::text = 'STD'::text THEN 'STD'::text
           ELSE NULL::text
           END                                                                            AS lowerlimitreference,
       CASE
           WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN 'AGL'::text
           WHEN holdingpattern.upperlimitreference::text = 'MSL'::text THEN 'AMSL'::text
           WHEN holdingpattern.upperlimitreference::text = 'STD'::text THEN 'STD'::text
           ELSE NULL::text
           END                                                                            AS upperlimitreference,
       CASE
           WHEN (holdingpattern.lowerlimit).unit::text = 'M'::text THEN
               CASE
                   WHEN (holdingpattern.lowerlimit).value::numeric < 1000::numeric THEN
                           round(floor((holdingpattern.lowerlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                   ELSE round(floor((holdingpattern.lowerlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                   END
           ELSE NULL::numeric
           END                                                                            AS lowerlimit_ft,
       CASE
           WHEN (holdingpattern.upperlimit).unit::text = 'M'::text THEN
               CASE
                   WHEN (holdingpattern.upperlimit).value::numeric < 1000::numeric THEN
                           round(floor((holdingpattern.upperlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
                   ELSE round(floor((holdingpattern.upperlimit).value::numeric) / 0.3048 / 500::numeric) * 500::numeric
                   END
           ELSE NULL::numeric
           END                                                                            AS upperlimit_ft,
       (holdingpattern.upperincludingvalue).value                                         AS upperincludingvalue,
       (holdingpattern.lowerincludingvalue).value                                         AS lowerincludingvalue,
       concat((holdingpattern.duration).value::text, ' ', (holdingpattern.duration).unit) AS duration,
       CASE
           WHEN (holdingpattern.speedlimit).nilreason IS NOT NULL THEN NULL::integer
           ELSE (holdingpattern.speedlimit).mininclusive::integer
           END                                                                            AS speedlimit,
       CASE
           WHEN (holdingpattern.speedlimit).nilreason IS NOT NULL THEN NULL::character varying
           ELSE (holdingpattern.speedlimit).uom::character varying
           END                                                                            AS speed_uom,
       COALESCE(nav.designator::character varying, dsgn.designator::character varying)    AS fix_name,
       (holdingpattern.length).value::text                                                AS length,
       (holdingpattern.length).unit::text                                                 AS length_uom,
       concat(
               CASE
                   WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).value IS NULL THEN 'GND'::text
                   ELSE round((holdingpattern.lowerlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FT'::text
                       THEN (holdingpattern.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN concat('/',
                                                                                           CASE
                                                                                               WHEN (holdingpattern.lowerlimit).value::numeric < 1000::numeric
                                                                                                   THEN round(
                                                                                                                    floor((holdingpattern.lowerlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric
                                                                                               ELSE round(
                                                                                                                floor((holdingpattern.lowerlimit).value::numeric) /
                                                                                                                0.3048 /
                                                                                                                500::numeric) *
                                                                                                    500::numeric
                                                                                               END, '`AGL')
                   WHEN holdingpattern.lowerlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                           CASE
                                                                                               WHEN (holdingpattern.lowerlimit).value::numeric < 1000::numeric
                                                                                                   THEN round(
                                                                                                                    floor((holdingpattern.lowerlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric
                                                                                               ELSE round(
                                                                                                                floor((holdingpattern.lowerlimit).value::numeric) /
                                                                                                                0.3048 /
                                                                                                                500::numeric) *
                                                                                                    500::numeric
                                                                                               END, '`AMSL')
                   ELSE NULL::text
                   END, '#',
               CASE
                   WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).value IS NULL THEN 'UNL'::text
                   ELSE round((holdingpattern.upperlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FT'::text
                       THEN (holdingpattern.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN concat('/',
                                                                                           CASE
                                                                                               WHEN (holdingpattern.upperlimit).value::numeric < 1000::numeric
                                                                                                   THEN round(
                                                                                                                    floor((holdingpattern.upperlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric
                                                                                               ELSE round(
                                                                                                                floor((holdingpattern.upperlimit).value::numeric) /
                                                                                                                0.3048 /
                                                                                                                500::numeric) *
                                                                                                    500::numeric
                                                                                               END, '`AGL')
                   WHEN holdingpattern.upperlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                           CASE
                                                                                               WHEN (holdingpattern.upperlimit).value::numeric < 1000::numeric
                                                                                                   THEN round(
                                                                                                                    floor((holdingpattern.upperlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric
                                                                                               ELSE round(
                                                                                                                floor((holdingpattern.upperlimit).value::numeric) /
                                                                                                                0.3048 /
                                                                                                                500::numeric) *
                                                                                                    500::numeric
                                                                                               END, '`AMSL')
                   ELSE NULL::text
                   END)                                                                   AS he,
       holdingpattern.geom,
       timeslice.validtimebegin                                                      AS beginposition,
       timeslice.validtimeend                                                        AS endposition
      --- timeslice.correctionnumber                                                        AS correctionnumber
FROM holdingpatterntimeslice holdingpattern
         LEFT JOIN segmentpoint sp ON sp.id = holdingpattern.idsegmentpoint
         LEFT JOIN nav ON sp.idsignificantpoint = nav.idnvd
         LEFT JOIN dsgn ON sp.idsignificantpoint = dsgn.iddsgn
         LEFT JOIN timeslice ON holdingpattern.idtimeslice = timeslice.idtimeslice
         LEFT JOIN cor ON holdingpattern.idtimeslice = cor.a::integer
where holdingpattern.idtimeslice::text in (select * from cor);

create index hold_indx
    on holdingpattern_mat (identifier);


/*select distinct holdingpattern._transasid,t.correctionnumber  from holdingpatterntimeslice hold
LEFT JOIN timeslice t on hold.idtimeslice = t.idtimeslice
LEFT JOIN holdingpattern ON holdingpattern.uuid = hold.uuid
where  correctionnumber is   null and type::text = '(,TER)'::text;*/


---------------------


-------------------holdingpattern_mat------segmentpoint sp ON sp.id = holdingpattern.idsegmentpoint--
-----трассовые зоны  под вопросом ----
create materialized view holdingpattern_mat_terminal as
WITH dsgn AS (
    SELECT designatedpoint.designator,
           designatedpoint.idsignificantpoint AS iddsgn,
           designatedpoint.uuid,
           designatedpoint.idtimeslice
    FROM designatedpointtimeslice designatedpoint

    where idtimeslice::text in

    (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM designatedpointtimeslice dp_1
             LEFT JOIN designatedpoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
)

),
     nav AS (
         SELECT navaid.designator,
                navaid.idsignificantpoint AS idnvd,
                navaid.uuid,
                navaid.idtimeslice
         FROM navaidtimeslice navaid
         where  navaid.idtimeslice::text
         in  (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM navaidtimeslice dp_1
             LEFT JOIN navaid d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
)
     ),
     cor AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t.correctionnumber DESC), ','::text,
                           1) AS a
         FROM holdingpatterntimeslice dp
                  LEFT JOIN holdingpattern d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         WHERE t.validtimeend IS NULL
         GROUP BY d.uuid
     )
SELECT holdingpattern.uuid                                                                AS identifier,
       holdingpattern.idsegmentpoint,
       (holdingpattern.type).value                                                        AS type,
       holdingpattern.outboundcourse::integer                                             AS outboundcourse,
       (holdingpattern.outboundcoursetype).value                                          AS outboundcoursetype,
       holdingpattern.inboundcourse::integer                                              AS inboundcourse,
       (holdingpattern.inboundcoursetype).value                                           AS inboundcoursetype,
       holdingpattern.turndirection,
       concat(
               CASE
                   WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).value IS NULL THEN 'UNL'::text
                   ELSE round((holdingpattern.upperlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FT'::text THEN (' '::text ||
                                                                                  (holdingpattern.upperlimit).unit::character varying::text)::character varying
                   ELSE ''::character varying
                   END)                                                                   AS upperlimit,
       concat(
               CASE
                   WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).value IS NULL THEN 'GND'::text
                   ELSE round((holdingpattern.lowerlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FT'::text THEN (' '::text ||
                                                                                  (holdingpattern.lowerlimit).unit::character varying::text)::character varying
                   ELSE ''::character varying
                   END)                                                                   AS lowerlimit,
       CASE
           WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN 'AGL'::text
           WHEN holdingpattern.lowerlimitreference::text = 'MSL'::text THEN 'AMSL'::text
           WHEN holdingpattern.lowerlimitreference::text = 'STD'::text THEN 'STD'::text
           ELSE NULL::text
           END                                                                            AS lowerlimitreference,
       CASE
           WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN 'AGL'::text
           WHEN holdingpattern.upperlimitreference::text = 'MSL'::text THEN 'AMSL'::text
           WHEN holdingpattern.upperlimitreference::text = 'STD'::text THEN 'STD'::text
           ELSE NULL::text
           END                                                                            AS upperlimitreference,
       CASE
           WHEN (holdingpattern.lowerlimit).unit::text = 'M'::text THEN

                           round(floor((holdingpattern.lowerlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric


           ELSE NULL::numeric
           END                                                                            AS lowerlimit_ft,
       CASE
           WHEN (holdingpattern.upperlimit).unit::text = 'M'::text THEN
                           round(floor((holdingpattern.upperlimit).value::numeric) / 0.3048 / 100::numeric) * 100::numeric
           ELSE NULL::numeric
           END                                                                            AS upperlimit_ft,
       (holdingpattern.upperincludingvalue).value                                         AS upperincludingvalue,
       (holdingpattern.lowerincludingvalue).value                                         AS lowerincludingvalue,
       concat((holdingpattern.duration).value::text, ' ', (holdingpattern.duration).unit) AS duration,
       CASE
           WHEN (holdingpattern.speedlimit).nilreason IS NOT NULL THEN NULL::integer
           ELSE (holdingpattern.speedlimit).mininclusive::integer
           END                                                                            AS speedlimit,
       CASE
           WHEN (holdingpattern.speedlimit).nilreason IS NOT NULL THEN NULL::character varying
           ELSE (holdingpattern.speedlimit).uom::character varying
           END                                                                            AS speed_uom,
       COALESCE(nav.designator::character varying, dsgn.designator::character varying)    AS fix_name,
       (holdingpattern.length).value::text                                                AS length,
       (holdingpattern.length).unit::text                                                 AS length_uom,
       concat(
               CASE
                   WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).value IS NULL THEN 'GND'::text
                   ELSE round((holdingpattern.lowerlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.lowerlimit).unit::text = 'FT'::text
                       THEN (holdingpattern.lowerlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN holdingpattern.lowerlimitreference::text = 'SFC'::text THEN concat('/',

                                                                                                  round(
                                                                                                                    floor((holdingpattern.lowerlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric
                                                                                     , '`AGL')
                   WHEN holdingpattern.lowerlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                            round(
                                                                                                                    floor((holdingpattern.lowerlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric
                                                                                              , '`AMSL')
                   ELSE NULL::text
                   END, '#',
               CASE
                   WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN ''::text
                   ELSE NULL::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FL'::text
                       THEN (holdingpattern.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).value IS NULL THEN 'UNL'::text
                   ELSE round((holdingpattern.upperlimit).value::numeric, 0)::text
                   END,
               CASE
                   WHEN (holdingpattern.upperlimit).unit::text = 'FT'::text
                       THEN (holdingpattern.upperlimit).unit::character varying
                   ELSE ''::character varying
                   END,
               CASE
                   WHEN holdingpattern.upperlimitreference::text = 'SFC'::text THEN concat('/',
                                                                                           round(
                                                                                                                    floor((holdingpattern.upperlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric
                                                                                              , '`AGL')
                   WHEN holdingpattern.upperlimitreference::text = 'MSL'::text THEN concat('/',
                                                                                           round(
                                                                                                                    floor((holdingpattern.upperlimit).value::numeric) /
                                                                                                                    0.3048 /
                                                                                                                    100::numeric) *
                                                                                                        100::numeric, '`AMSL')
                   ELSE NULL::text
                   END)                                                                   AS he,
       --sm.nameprocedure,
       holdingpattern.geom,
       timeslice.validtimebegin                                                           AS beginposition,
       timeslice.validtimeend                                                             AS endposition,
       sp.id as segpoint_id
FROM holdingpatterntimeslice holdingpattern
         LEFT JOIN segmentpoint sp ON sp.id = holdingpattern.idsegmentpoint
         LEFT JOIN nav ON sp.idsignificantpoint = nav.idnvd
         LEFT JOIN dsgn ON sp.idsignificantpoint = dsgn.iddsgn
         LEFT JOIN timeslice ON holdingpattern.idtimeslice = timeslice.idtimeslice
         LEFT JOIN cor ON holdingpattern.idtimeslice = cor.a::integer
         ---LEFT JOIN segmentleg_mat sm on holdingpattern.idsegmentpoint = sm.startend
WHERE (holdingpattern.idtimeslice::text IN (SELECT cor_1.a
                                            FROM cor cor_1));

create index holdmat_indx
    on holdingpattern_mat_terminal (identifier);

--------------------nav.idsignificantpoint в localizer_mat ► дубли

create materialized view localizer_mat as
    with cor as
(
SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM localizer dp
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY dp.uuid
    )
SELECT loc.uuid                                                                                           AS identifier,
       replace(replace(loc.frequency::character varying::text, '('::text, ''::text), ')'::text, ''::text) AS frequency,
       loc.magneticbearing,
       loc.magneticbearingaccuracy,
       loc.truebearing,
       loc.declination,
       loc.truebearingaccuracy,
       loc.widthcourse,
       loc.widthcourseaccuracy,
       loc.backcourseusable,
       naveq.designator,
       naveq.name,
       naveq.emissionclass,
       naveq.mobile,
       naveq.magneticvariation,
       naveq.magneticvariationaccuracy,
       naveq.datemagneticvariation,
       naveq.flightchecked,
       nav.idsignificantpoint,
       ats.uuid                                                                                     AS uuidairportheliport,
       ats.name                                                                                           AS nameairportheliport,
       t.validtimebegin                                                                               AS beginposition,
       t.validtimeend                                                                                 AS endposition,
       --t.correctionnumber AS correctionnumber,
       CASE
           WHEN st_isvalid(naveq.geom) THEN naveq.geom
           ELSE NULL::geometry
           END
        AS geom
FROM localizer loc
         LEFT JOIN navaidequipmenttimeslice naveq ON  loc.idtimeslice = naveq.idtimeslice
         LEFT JOIN navaid_navaidequipment ON naveq.uuid::uuid = navaid_navaidequipment.uuidnavaidequipment::uuid
         LEFT JOIN navaidtimeslice nav ON navaid_navaidequipment.uuidnavaid::uuid = nav.uuid::uuid
         LEFT JOIN airportheliporttimeslice ats ON ats.uuid::uuid = nav.uuidarphlp::uuid
         LEFT JOIN timeslice t on loc.idtimeslice = t.idtimeslice
         LEFT JOIN cor on loc.idtimeslice = cor.a::integer
where loc.idtimeslice::text in (select * from cor)  ;

create index loc_indx
    on localizer_mat (identifier);


------------------------

create materialized view glidepath_mat as
with cor as
(
SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM glidepath dp
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY dp.uuid
    )
SELECT glidepath.uuid     AS identifier,
       glidepath.frequency,
       glidepath.slope,
       glidepath.angleaccuracy,
       glidepath.rdh,
       glidepath.rdhaccuracy,
       nav.designator,
       nav.name,
       naveq.emissionclass,
       naveq.mobile,
       naveq.magneticvariation,
       naveq.magneticvariationaccuracy,
       naveq.datemagneticvariation,
       naveq.flightchecked,
       arp.uuid           AS uuidairportheliport,
       arp.name           AS nameairportheliport,
       t.validtimebegin AS beginposition,
       t.validtimeend   AS endposition,
       ---t.correctionnumber AS correctionnumber,
       nav.idsignificantpoint,
       CASE
           WHEN st_isvalid(naveq.geom) THEN naveq.geom
           ELSE NULL::geometry
           END            AS geom
FROM glidepath
         LEFT JOIN navaidequipmenttimeslice naveq ON glidepath.idtimeslice = naveq.idtimeslice
         LEFT JOIN navaid_navaidequipment ON naveq.uuid::uuid = navaid_navaidequipment.uuidnavaidequipment::uuid
         LEFT JOIN navaidtimeslice nav ON navaid_navaidequipment.uuidnavaid::uuid = nav.uuid::uuid
         LEFT JOIN airportheliporttimeslice arp ON arp.uuid::uuid = nav.uuidarphlp::uuid
         LEFT JOIN timeslice t on glidepath.idtimeslice = t.idtimeslice
         LEFT JOIN cor ON glidepath.idtimeslice = cor.a::integer
where glidepath.idtimeslice::text in (select * from cor);


create index glid_indx
    on glidepath_mat (identifier);



-- select distinct substr(navaid._transasid,1,3) from navaidequipmenttimeslice naveq
-- LEFT JOIN timeslice t on naveq.idtimeslice = t.idtimeslice
-- LEFT JOIN navaid_navaidequipment ON naveq.uuid::uuid = navaid_navaidequipment.uuidnavaidequipment::uuid
-- LEFT JOIN navaid ON navaid_navaidequipment.uuidnavaid = navaid.uuid
-- where correctionnumber is null;

/*select _transasid, correctionnumber, validtimebegin, validtimeend from proceduretimeslice proc
LEFT JOIN timeslice t on proc.idtimeslice = t.idtimeslice
LEFT JOIN procedure ON proc.uuid = procedure.uuid
where correctionnumber is   null;

select _transasid, correctionnumber, validtimebegin, validtimeend  from segmentlegtimeslice segm
LEFT JOIN timeslice t on segm.idtimeslice = t.idtimeslice
LEFT JOIN segmentleg ON segm.uuid = segmentleg.uuid
where correctionnumber is  null;

select distinct _transasid, correctionnumber, validtimebegin, validtimeend, sequencenumber  from designatedpointtimeslice des
LEFT JOIN timeslice t on des.idtimeslice = t.idtimeslice
LEFT JOIN designatedpoint ON des.uuid = designatedpoint.uuid
where sequencenumber is not null;

select distinct _transasid, correctionnumber, validtimebegin, validtimeend  from airspacetimeslice air
LEFT JOIN timeslice t on air.idtimeslice = t.idtimeslice
LEFT JOIN airspace ON air.uuid = airspace.uuid
;

select distinct _transasid, correctionnumber, validtimebegin, validtimeend  from runwaytimeslice run
LEFT JOIN timeslice t on run.idtimeslice = t.idtimeslice
LEFT JOIN runway ON run.uuid = runway.uuid
where correctionnumber = 1;

select distinct _transasid, correctionnumber, validtimebegin, validtimeend  from runwaydirectiontimeslice run
LEFT JOIN timeslice t on run.idtimeslice = t.idtimeslice
LEFT JOIN runwaydirection ON run.uuid = runwaydirection.uuid
where correctionnumber  is not null ;
*/

                          --------------------

create materialized view specialnavigationstation_mat as
WITH cor as
(
SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM specialnavigationstationtimeslice dp
         LEFT JOIN specialnavigationstation d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid
    ),
     lat_lon_sns AS (
    SELECT sns_1.uuid,
           CASE
               WHEN sns_1.latitude::numeric < 0::numeric THEN sns_1.latitude::numeric * '-1'::integer::numeric
               ELSE sns_1.latitude::numeric
               END AS latitude,
           CASE
               WHEN sns_1.latitude::numeric < 0::numeric THEN 'S'::text
               ELSE 'N'::text
               END AS lat_dir,
           CASE
               WHEN sns_1.longitude::numeric < 0::numeric THEN sns_1.longitude::numeric * '-1'::integer::numeric
               ELSE sns_1.longitude::numeric
               END AS longitude,
           CASE
               WHEN sns_1.longitude::numeric < 0::numeric THEN 'W'::text
               ELSE 'E'::text
               END AS lon_dir
    FROM specialnavigationstationtimeslice sns_1
         left join cor ON sns_1.idtimeslice = cor.a::integer
    where sns_1.idtimeslice::text in (select * from cor)
)

SELECT sns.uuid               AS identifier,
       (sys.type).value::text AS type,
       concat(dd2dms(lat_lon_sns.latitude::double precision, 'lat'::character varying), lat_lon_sns.lat_dir,
              CASE
                  WHEN sns.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)        AS latitude,
       concat(dd2dms(lat_lon_sns.longitude::double precision, 'lon'::character varying), lat_lon_sns.lon_dir,
              CASE
                  WHEN sns.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)        AS longitude,
       t.validtimebegin     AS beginposition,
       t.validtimeend       AS endposition,
      --- t.correctionnumber AS correctionnumber,
       sns.geom
FROM specialnavigationstationtimeslice sns
         LEFT JOIN specialnavigationsystem sys ON sns.uuidsystemchain::uuid = sys.uuid::uuid
         JOIN lat_lon_sns ON lat_lon_sns.uuid::uuid = sns.uuid::uuid
         LEFT JOIN timeslice t ON sns.idtimeslice = t.idtimeslice
         LEFT JOIN cor ON sns.idtimeslice = cor.a:: integer
         where sns.idtimeslice::text in (Select * from cor);

create index specnav_indx
    on specialnavigationstation_mat (identifier);


-----не хватает rundir.uuidrunway
create materialized view runwaydirection_mat as
With cor as
(
SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM runwaydirectiontimeslice dp
         LEFT JOIN runwaydirection d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid
    )
SELECT distinct rundir.uuid                         AS identifier,
       rundir.designator,
       rundir.truebearing,
       rundir.magneticbearing,
       rundir.precisionapproachguidance,
       rundir.elevationtdz,
       (rcpts.elevation).value             AS elevation,
       (rcpts.elevation).unit              AS elevation_uom,
       rundir.truebearingaccuracy::integer AS truebearingaccuracy,
       rundir.slopetdz,
       rcpts.role,
       rw.designator                       AS runway_designator,
       rundir.uuidrunway,
       rw.uuidarphlp                       AS uuidairportheliport,
       arp.name                            AS nameairportheliport,
       t.validtimebegin               AS beginposition,
       t.validtimeend                 AS endposition,
       ---t.correctionnumber AS correctionnumber,
       rcpts.geom
FROM runwaydirectiontimeslice rundir
         LEFT JOIN runwaycentrelinepointtimeslice rcpts ON rcpts.uuidrunwaydirection::uuid = rundir.uuid::uuid
         LEFT JOIN runwaytimeslice rw ON rw.uuid::uuid = rundir.uuidrunway::uuid
         LEFT JOIN airportheliporttimeslice arp ON arp.uuid::uuid = rw.uuidarphlp::uuid
         LEFT JOIN timeslice t on rundir.idtimeslice = t.idtimeslice
         left join cor on cor.a::integer = rundir.idtimeslice
where rundir.idtimeslice::text in (select * from cor) and
rundir.designator IS NOT NULL
AND rcpts.geom IS NOT NULL;





--------------segmentleg_mat---- (добавлен idarccentre), актульный seqnumber ( flighttransition)

create materialized view segmentleg_mat as
WITH cor AS (
    SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text, 1) AS a
    FROM segmentlegtimeslice dp
             LEFT JOIN segmentleg d ON d.uuid::uuid = dp.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d.uuid
),
     run_actual as
        ( SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text, 1) AS a
    FROM runwaycentrelinepointtimeslice dp
             LEFT JOIN runwaycentrelinepoint d ON d.uuid::uuid = dp.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d.uuid),

     navaid_actual AS (
         SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM navaidtimeslice dp
                  LEFT JOIN navaid d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     angleindication_actual as (SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM angleindicationtimeslice dp
                  LEFT JOIN angleindication d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid),
     distanceindication_actual as (
     SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM distanceindicationtimeslice dp
                  LEFT JOIN distanceindication d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     ),
     proc_types AS (
         SELECT segleg_1.uuid,
                dl.uuid AS departureleg,
                CASE
                    WHEN il.uuid IS NOT NULL THEN 'initialleg'::text
                    WHEN ml_1.uuid IS NOT NULL THEN 'missedapproachleg'::text
                    WHEN fl.uuid IS NOT NULL THEN 'finalleg'::text
                    WHEN dl.uuid IS NOT NULL THEN 'departureleg'::text
                    WHEN arrl.uuid IS NOT NULL THEN 'arrivalleg'::text
                    ELSE NULL::text
                    END AS legtype
         FROM segmentlegtimeslice segleg_1
                  LEFT JOIN departureleg dl ON dl.uuid::uuid = segleg_1.uuid::uuid
                  LEFT JOIN arrivalleg arrl ON arrl.uuid::uuid = segleg_1.uuid::uuid
                  LEFT JOIN approachleg al ON al.uuid::uuid = segleg_1.uuid::uuid
                  LEFT JOIN initialleg il ON il.uuid::uuid = segleg_1.uuid::uuid
                  LEFT JOIN missedapproachleg ml_1 ON ml_1.uuid::uuid = segleg_1.uuid::uuid
                  LEFT JOIN finalleg fl ON fl.uuid::uuid = segleg_1.uuid::uuid
                  LEFT JOIN cor cor_1 ON segleg_1.idtimeslice = cor_1.a::integer
         WHERE (segleg_1.idtimeslice::text IN (SELECT cor_2.a
                                               FROM cor cor_2))
     ),
     aircraftcharacteristic_select AS (
         SELECT segleg_1.uuid,
                string_agg((aircraft_1.aircraftlandingcategory).value::text, ','::text
                           ORDER BY aircraft_1.aircraftlandingcategory) AS aircraftlandingcategory
         FROM segmentleg segleg_1
                  JOIN aircraftcharacteristic aircraft_1 ON aircraft_1.uuidsegmentleg::uuid = segleg_1.uuid::uuid
         GROUP BY segleg_1.uuid
     )
SELECT DISTINCT segleg.uuid                                                                          AS identifier,
                (segleg.endconditiondesignator).value                                                AS endconditiondesignator,
                (segleg.legpath).value                                                               AS legpath,
                (segleg.legtypearinc).value                                                          AS legtypearinc,
                segleg.course,
                (segleg.coursetype).value                                                            AS coursetype,
                (segleg.coursedirection).value                                                       AS coursedirection,
                segleg.turndirection,
                CASE
                    WHEN (segleg.speedlimit).nilreason IS NOT NULL THEN NULL::character varying
                    ELSE (segleg.speedlimit).mininclusive::character varying
                    END                                                                              AS speedlimit,
                CASE
                    WHEN (segleg.speedlimit).nilreason IS NOT NULL THEN NULL::character varying
                    ELSE (segleg.speedlimit).uom::character varying
                    END                                                                              AS speed_uom,
                (segleg.speedreference).value                                                        AS speedreference,
                CASE
                    WHEN (segleg.duration).value IS NULL THEN NULL::text
                    ELSE concat((segleg.duration).value, ' ', (segleg.duration).unit)
                    END                                                                              AS duration,
                CASE
                    WHEN (dist.distance).value IS NOT NULL AND (dist.distance).unit IS NOT NULL THEN concat(
                            round((dist.distance).value::numeric, 1), ' ', (dist.distance).unit)
                    ELSE NULL::text
                    END                                                                              AS distance,
                (dist.type).value                                                                    AS distancetype,
                dist.idsignificantpoint                                                              AS distancepointchoice,
                st_astext(nav_dist.geom)                                                             AS geom_nav_distance,
                nav_dist.type                                                                        AS type_dist_nav,
                nav_dist.designator                                                                  AS distance_navaid,
                angle_ind.angle,
                (angle_ind.angletype).value                                                          AS angletype,
                angle_ind.idsignificantpoint                                                         AS anglepointchoice,
                st_astext(nav_angle.geom)                                                            AS geom_nav_angle,
                nav_angle.type                                                                       AS type_angle_nav,
                nav_angle.designator                                                                 AS angle_navaid,
                (segleg.procedureturnrequired).value                                                 AS procedureturnrequired,
                CASE
                    WHEN (segleg.lowerlimitaltitude).value IS NOT NULL AND (segleg.lowerlimitaltitude).unit::text = 'FT'::text
                        THEN concat(
                            CASE
                                WHEN (segleg.lowerlimitaltitude).value::numeric <>
                                     trunc((segleg.lowerlimitaltitude).value::numeric)
                                    THEN (segleg.lowerlimitaltitude).value::numeric
                                ELSE trunc((segleg.lowerlimitaltitude).value::numeric)
                                END, ' ', (segleg.lowerlimitaltitude).unit)::character varying
                    WHEN (segleg.lowerlimitaltitude).value IS NOT NULL AND (segleg.lowerlimitaltitude).unit::text = 'M'::text
                        THEN concat(
                            CASE
                                WHEN (segleg.lowerlimitaltitude).value::numeric <>
                                     trunc((segleg.lowerlimitaltitude).value::numeric)
                                    THEN (segleg.lowerlimitaltitude).value::numeric
                                ELSE trunc((segleg.lowerlimitaltitude).value::numeric)
                                END, ' ', (segleg.lowerlimitaltitude).unit)::character varying
                    WHEN (segleg.lowerlimitaltitude).value IS NOT NULL THEN concat((segleg.lowerlimitaltitude).unit,
                                                                                   CASE
                                                                                       WHEN (segleg.lowerlimitaltitude).value::numeric <>
                                                                                            trunc((segleg.lowerlimitaltitude).value::numeric)
                                                                                           THEN (segleg.lowerlimitaltitude).value::numeric
                                                                                       ELSE trunc((segleg.lowerlimitaltitude).value::numeric)
                                                                                       END)::character varying
                    ELSE (segleg.lowerlimitaltitude).nonnumeric::character varying
                    END                                                                              AS lowerlimit,
                segleg.lowerlimitreference,
                CASE
                    WHEN (segleg.upperlimitaltitude).value IS NOT NULL AND (segleg.upperlimitaltitude).unit::text = 'FT'::text
                        THEN concat(
                            CASE
                                WHEN (segleg.upperlimitaltitude).value::numeric <>
                                     trunc((segleg.upperlimitaltitude).value::numeric)
                                    THEN (segleg.upperlimitaltitude).value::numeric
                                ELSE trunc((segleg.upperlimitaltitude).value::numeric)
                                END, ' ', (segleg.upperlimitaltitude).unit)::character varying
                    WHEN (segleg.upperlimitaltitude).value IS NOT NULL AND (segleg.upperlimitaltitude).unit::text = 'M'::text
                        THEN concat(
                            CASE
                                WHEN (segleg.upperlimitaltitude).value::numeric <>
                                     trunc((segleg.upperlimitaltitude).value::numeric)
                                    THEN (segleg.upperlimitaltitude).value::numeric
                                ELSE trunc((segleg.upperlimitaltitude).value::numeric)
                                END, ' ', (segleg.upperlimitaltitude).unit)::character varying
                    WHEN (segleg.upperlimitaltitude).value IS NOT NULL THEN concat((segleg.upperlimitaltitude).unit,
                                                                                   CASE
                                                                                       WHEN (segleg.upperlimitaltitude).value::numeric <>
                                                                                            trunc((segleg.upperlimitaltitude).value::numeric)
                                                                                           THEN (segleg.upperlimitaltitude).value::numeric
                                                                                       ELSE trunc((segleg.upperlimitaltitude).value::numeric)
                                                                                       END)::character varying
                    ELSE (segleg.upperlimitaltitude).nonnumeric::character varying
                    END                                                                              AS upperlimit,
                segleg.upperlimitreference,
                segleg.altitudeinterpretation,
                round((segleg.length).value::numeric, 1)                                             AS length,
                (segleg.length).unit                                                                 AS uom_length,
                segleg.verticalangle,
                COALESCE((ml.type).value::character varying, (ml.type).nilreason::character varying) AS type,
                COALESCE((ml.thresholdaftermapt).value::character varying,
                         (ml.thresholdaftermapt).nilreason::character varying)                       AS thresholdaftermapt,
                CASE
                    WHEN (ml.heightmapt).value IS NOT NULL
                        THEN concat((ml.heightmapt).value, ' ', (ml.heightmapt).unit)::character varying
                    ELSE (ml.heightmapt).nilreason::character varying
                    END                                                                              AS heightmapt,
                segleg.geom,
                COALESCE(segleg.idstart, segleg.idend, segleg.idarccentre)                                               AS startend,
                segleg.idstart                                                                       AS startpoint,
                segleg.idend                                                                         AS endpoint,
                segleg.idarccentre                                                                   AS arccentre,
                aircraft.aircraftlandingcategory,
                proc.identifier                                                                      AS uuidprocedure,
                proc_types.legtype,
                proc_types.departureleg,
                proc.uuidairportheliport,
                proc.nameairportheliport,
                proc.name                                                                            AS nameprocedure,
                t.validtimebegin                                                                     AS beginposition,
                t.validtimeend                                                                       AS endposition,
                proc.procedure,
                proc.transitionid,
                proc.rnav,
                proc.geom                                                                            AS proc_geom,
                proceduretransitionleg.seqnumberarinc,
                coalesce(nav.type, replace(replace(run.role::text, '(,',''),')','') )                AS point_type,
                nav.designator                                                                       AS navaid,
                seg.role,
                seg.idsignificantpoint
FROM segmentlegtimeslice segleg
         JOIN proceduretransitionleg ON proceduretransitionleg.uuidsegmentleg::uuid = segleg.uuid::uuid
         JOIN proceduretransition ON proceduretransition.id = proceduretransitionleg.idproceduretransition
              and proceduretransition.flighttransition in (select flighttransition from procedure_mat)

         LEFT JOIN segmentpoint seg ON seg.id = COALESCE(segleg.idend, segleg.idstart, idarccentre)
         LEFT JOIN runwaycentrelinepointtimeslice run on run.idsignificantpoint = seg.idsignificantpoint
                     and  run.idtimeslice::text IN (SELECT run_actual_1.a
                                    FROM run_actual run_actual_1)

         LEFT JOIN missedapproachleg ml ON ml.idtimeslice = segleg.idtimeslice

         LEFT JOIN distanceindicationtimeslice dist ON dist.uuid::uuid = segleg.distance
                               and dist.idtimeslice::text IN (SELECT distanceindication_actual_1.a
                                    FROM distanceindication_actual distanceindication_actual_1)

         LEFT JOIN navaidtimeslice nav_dist ON dist.idsignificantpoint = nav_dist.idsignificantpoint
                                    and nav_dist.idtimeslice::text IN (SELECT navaid_actual_1.a
                                    FROM navaid_actual navaid_actual_1)

         LEFT JOIN navaidtimeslice nav ON nav.idsignificantpoint = seg.idsignificantpoint
                                              and
                                          (nav.idtimeslice::text IN (SELECT navaid_actual_1.a
                                    FROM navaid_actual navaid_actual_1))

         LEFT JOIN angleindicationtimeslice angle_ind ON segleg.angle = angle_ind.uuid::uuid
                   and angle_ind.idtimeslice::text IN (SELECT angleindication_actual_1.a
                                    FROM angleindication_actual angleindication_actual_1)
         LEFT JOIN navaidtimeslice nav_angle ON nav_angle.idsignificantpoint = angle_ind.idsignificantpoint
          and  (nav_angle.idtimeslice::text IN (SELECT navaid_actual_1.a
                                    FROM navaid_actual navaid_actual_1))
         LEFT JOIN aircraftcharacteristic_select aircraft ON aircraft.uuid::uuid = segleg.uuid::uuid
         LEFT JOIN procedure_mat proc ON proc.identifier::uuid = proceduretransition.uuidprocedure::uuid
         LEFT JOIN proc_types ON proc_types.uuid::uuid = segleg.uuid::uuid
         LEFT JOIN timeslice t ON segleg.idtimeslice = t.idtimeslice
         LEFT JOIN cor ON segleg.idtimeslice = cor.a::integer
         LEFT JOIN navaid_actual ON nav.idtimeslice = navaid_actual.a::integer
WHERE segleg.uuid IS NOT NULL
  AND (segleg.idtimeslice::text IN (SELECT cor_1.a
                                    FROM cor cor_1))
GROUP BY segleg.uuid, segleg.endconditiondesignator, segleg.legpath, segleg.legtypearinc, segleg.course,
         segleg.coursetype, segleg.coursedirection, segleg.turndirection, segleg.speedlimit, segleg.speedreference,
         segleg.duration, segleg.distance, ((dist.type).value), dist.idsignificantpoint, nav_dist.geom, nav_dist.type,
         nav_dist.designator, angle_ind.angle, angle_ind.angletype, angle_ind.idsignificantpoint, nav_angle.geom,
         nav_angle.type, nav_angle.designator, segleg.procedureturnrequired, segleg.lowerlimitaltitude,
         segleg.lowerlimitreference, segleg.upperlimitaltitude, segleg.upperlimitreference,
         segleg.altitudeinterpretation, segleg.length, segleg.verticalangle, ml.type, ml.thresholdaftermapt,
         ml.heightmapt, segleg.geom, (COALESCE(segleg.idstart, segleg.idend, segleg.idarccentre)), segleg.idstart, segleg.idend,
         segleg.idarccentre, aircraft.aircraftlandingcategory, proc.identifier, proc_types.legtype,
         proc_types.departureleg, proc.uuidairportheliport, proc.nameairportheliport, proc.name, t.validtimebegin,
         t.validtimeend, t.correctionnumber, t.idtimeslice, proc.procedure, proc.rnav, dist.distance, (nav.type, run.role) ,
         nav.designator, proc.geom, proceduretransitionleg.seqnumberarinc, proc.transitionid, nav.idsignificantpoint,
         seg.role, seg.idsignificantpoint;



create index segleg_indx
    on segmentleg_mat (identifier);




----ignore: необходимо добавить индексы, тк зависает и пишет, что не хватает памяти

create materialized view final_profiel_leg_mat as
WITH
    cor as
(
SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM segmentlegtimeslice dp
         LEFT JOIN segmentleg d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid
    ),

    navaid_actual as
     (SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
    FROM navaidtimeslice dp
         LEFT JOIN navaid d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid),

    angleindication_actual as (
        SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM angleindicationtimeslice dp
                  LEFT JOIN angleindication d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid),

    distanceindication_actual as (
     SELECT split_part(string_agg(dp.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM distanceindicationtimeslice dp
                  LEFT JOIN distanceindication d ON d.uuid::uuid = dp.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d.uuid
     ),

    des_cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM designatedpointtimeslice dp_1
             LEFT JOIN designatedpoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
    ),

    proc_types AS (
    SELECT distinct segleg_1.uuid,
           dl.uuid AS departureleg,
           CASE
               WHEN il.uuid IS NOT NULL THEN 'initialleg'::text
               WHEN ml_1.uuid IS NOT NULL THEN 'missedapproachleg'::text
               WHEN fl.uuid IS NOT NULL THEN 'finalleg'::text
               WHEN dl.uuid IS NOT NULL THEN 'departureleg'::text
               WHEN arrl.uuid IS NOT NULL THEN 'arrivalleg'::text
               ELSE NULL::text
               END AS legtype
    FROM segmentlegtimeslice segleg_1
             LEFT JOIN departureleg dl ON dl.uuid::uuid = segleg_1.uuid::uuid
             LEFT JOIN arrivalleg arrl ON arrl.uuid::uuid = segleg_1.uuid::uuid
             LEFT JOIN approachleg al ON al.uuid::uuid = segleg_1.uuid::uuid
             LEFT JOIN initialleg il ON il.uuid::uuid = segleg_1.uuid::uuid
             LEFT JOIN missedapproachleg ml_1 ON ml_1.uuid::uuid = segleg_1.uuid::uuid
             LEFT JOIN finalleg fl ON fl.uuid::uuid = segleg_1.uuid::uuid

         left join cor on segleg_1.idtimeslice = cor.a::integer
WHERE  segleg_1.idtimeslice::text in (select * from cor)
),
    aircraftcharacteristic_select AS (
         SELECT segleg_1.uuid,
                string_agg((aircraft_1.aircraftlandingcategory).value::text, ','::text
                           ORDER BY aircraft_1.aircraftlandingcategory) AS aircraftlandingcategory
         FROM segmentleg segleg_1
                  JOIN aircraftcharacteristic aircraft_1 ON aircraft_1.uuidsegmentleg::uuid = segleg_1.uuid::uuid
         GROUP BY segleg_1.uuid
     )
SELECT segleg.identifier
     ,
       segleg.endconditiondesignator,
       segleg.legpath,
       segleg.legtypearinc,
       segleg.course,
       segleg.coursetype,
       segleg.coursedirection,
       segleg.turndirection,
       segleg.speedlimit,
       segleg.speed_uom,
       segleg.speedreference,
       segleg.duration,

       dist.distance::text distance,
       (dist.type).value                                                                    AS distancetype,
       dist.idsignificantpoint                                                              AS distancepointchoice,
       nav_dist.geom                                                                        AS geom_nav_distance,
       angle_ind.angle,
       (angle_ind.angletype).value                                                          AS angletype,
       angle_ind.idsignificantpoint                                                         AS anglepointchoice,
       nav_angle.geom                                                                       AS geom_nav_angle,
       segleg.procedureturnrequired,
       segleg.lowerlimit,
       segleg.lowerlimitreference,
       segleg. upperlimit,
       segleg.upperlimitreference,
       segleg.altitudeinterpretation,
       segleg.length,
       segleg.uom_length,

       segleg.verticalangle,
       segleg.type,
       segleg.thresholdaftermapt,
       segleg.heightmapt,
       segleg.geom,
       segleg.startend,
       segleg.startpoint,
       segleg.endpoint,
       segleg.arccentre,
       segleg.aircraftlandingcategory,
       segleg.uuidprocedure,
       segleg.legtype,
       segleg.departureleg,
       segleg.uuidairportheliport,
       segleg.nameairportheliport,
       segleg.nameprocedure,
       segleg.beginposition,
       segleg.endposition,
      --- t.correctionnumber AS correctionnumber,
       segleg.procedure,
       segleg.transitionid,
       segleg.rnav,
       segleg.proc_geom,
       segleg.seqnumberarinc,




       COALESCE(nav_dist.type, nav_angle.type)                                              AS point_type,
       nav_dist.type                                                                        AS nav_dist_type,
       nav_angle.type                                                                       AS nav_angle_type,
       nav_dist.designator                                                                  AS navaid_dist,
       nav_angle.designator                                                                 AS navaid_angle,
       replace(replace(seg.role::text, '(,'::text, ''::text), ')'::text, ''::text)          AS role,
       COALESCE(nav.designator::character varying, despoint.designator::character varying)  AS name_control,
       COALESCE(nav.type::character varying, despoint.type::character varying)              AS type_control,
       COALESCE(nav.geom, despoint.geom)                                                    AS geom_control,
       --,

       proc.approachtype

FROM segmentleg_mat segleg
        JOIN proceduretransitionleg ON proceduretransitionleg.uuidsegmentleg::uuid = segleg.identifier::uuid
        JOIN proceduretransition ON proceduretransition.id = proceduretransitionleg.idproceduretransition
             ---  and proceduretransition.flighttransition in (select flighttransition from procedure_mat)
         ----LEFT JOIN missedapproachleg ml ON ml.idtimeslice = segleg.idtimeslice

         LEFT JOIN segmentpoint seg ON seg.id = segleg.startend

         LEFT JOIN designatedpointtimeslice despoint ON seg.idsignificantpoint = despoint.idsignificantpoint
                  left join designatedpoint d
                             ON despoint.uuid::uuid = d.uuid::uuid
                  left join des_cor  ON des_cor.a::integer = despoint.idtimeslice



         LEFT JOIN navaidtimeslice nav ON nav.idsignificantpoint = seg.idsignificantpoint
         and     (nav.idtimeslice::text IN (SELECT navaid_actual_1.a
                                    FROM navaid_actual navaid_actual_1))

         left join pointreference p on seg.id = p.idsegmentpoint

         LEFT JOIN angleindicationtimeslice angle_ind ON p.uuidanglind::uuid = angle_ind.uuid::uuid AND
                                                  (angle_ind.idtimeslice::text IN (SELECT angleindication_actual_1.a
                                                                        FROM angleindication_actual angleindication_actual_1))
         LEFT JOIN distanceindicationtimeslice dist ON p.uuiddistind::uuid = dist.uuid::uuid AND
                                                (dist.idtimeslice::text IN (SELECT distanceindication_actual_1.a
                                                                        FROM distanceindication_actual distanceindication_actual_1))
         LEFT JOIN navaidtimeslice nav_angle ON nav_angle.uuid::uuid = angle_ind.pointchoice_uuid::uuid  and
                                                      (nav_angle.idtimeslice::text IN (SELECT navaid_actual_1.a
                                    FROM navaid_actual navaid_actual_1))
         LEFT JOIN navaidtimeslice nav_dist ON dist.pointchoice_uuid::uuid = nav_dist.uuid::uuid
                                    and nav_dist.idtimeslice::text IN (SELECT navaid_actual_1.a
                                    FROM navaid_actual navaid_actual_1)
        ---- LEFT JOIN aircraftcharacteristic_select aircraft ON aircraft.uuid::uuid = segleg.uuid::uuid
        LEFT JOIN procedure_mat proc ON proc.identifier::uuid = proceduretransition.uuidprocedure::uuid
        --- LEFT JOIN proc_types ON proc_types.uuid::uuid = segleg.uuid::uuid
        --- LEFT JOIN timeslice t on segleg.idtimeslice = t.idtimeslice
         ---left join cor on segleg.idtimeslice = cor.a::integer
--WHERE
 ---     segleg.uuid IS NOT NULL and segleg.idtimeslice::text in (select * from cor) and procedure = 'IAP'
GROUP BY segleg.identifier
     ,
       segleg.endconditiondesignator,
       segleg.legpath,
       segleg.legtypearinc,
       segleg.course,
       segleg.coursetype,
       segleg.coursedirection,
       segleg.turndirection,
       segleg.speedlimit,
       segleg.speed_uom,
       segleg.speedreference,
       segleg.duration,

       dist.distance,
       (dist.type).value,
       dist.idsignificantpoint,
       nav_dist.geom,
       angle_ind.angle,
       (angle_ind.angletype).value,
       angle_ind.idsignificantpoint,
       nav_angle.geom,
       segleg.procedureturnrequired,
       segleg.lowerlimit,
       segleg.lowerlimitreference,
       segleg. upperlimit,
       segleg.upperlimitreference,
       segleg.altitudeinterpretation,
       segleg.length,
       segleg.uom_length,

       segleg.verticalangle,
       segleg.type,
       segleg.thresholdaftermapt,
       segleg.heightmapt,
       segleg.geom,
       segleg.startend,
       segleg.startpoint,
       segleg.endpoint,
       segleg.arccentre,
       segleg.aircraftlandingcategory,
       segleg.uuidprocedure,
       segleg.legtype,
       segleg.departureleg,
       segleg.uuidairportheliport,
       segleg.nameairportheliport,
       segleg.nameprocedure,
       segleg.beginposition,
       segleg.endposition,
      --- t.correctionnumber AS correctionnumber,
       segleg.procedure,
       segleg.transitionid,
       segleg.rnav,
       segleg.proc_geom,
       segleg.seqnumberarinc,


       COALESCE(nav_dist.type, nav_angle.type),
       nav_dist.type,
       nav_angle.type,
       nav_dist.designator,
       nav_angle.designator,
       replace(replace(seg.role::text, '(,'::text, ''::text), ')'::text, ''::text),
       COALESCE(nav.designator::character varying, despoint.designator::character varying),
       COALESCE(nav.type::character varying, despoint.type::character varying),
       COALESCE(nav.geom, despoint.geom)
         ,
       proc.approachtype
;



create index finprof_indx
    on final_profiel_leg_mat (identifier);







-----------segmentpoint_mat---(набор точек nav, des, rwycent связанных с процедурой)
---слабое место: Left join c des_cor \ rwycentpoi_cor \ nav_cor  ► дубли
create materialized view segmentpoint_mat as
WITH des_cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM designatedpointtimeslice dp_1
             LEFT JOIN designatedpoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
),
     rwycentpoi_cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM runwaycentrelinepointtimeslice dp_1
             LEFT JOIN runwaycentrelinepoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
    ),
     nav_cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM navaidtimeslice dp_1
             LEFT JOIN navaid d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
),
    naveq_cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM navaidequipmenttimeslice dp_1
             LEFT JOIN navaidequipment d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
),
     angleindication_actual AS (
         SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM angleindicationtimeslice dp_1
                  LEFT JOIN angleindication d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d_1.uuid
     ),
     distanceindication_actual AS (
         SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM distanceindicationtimeslice dp_1
                  LEFT JOIN distanceindication d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d_1.uuid
     )
         SELECT segleg.identifier as segleg_uuid,
                coalesce(dp.uuid, nav.uuid, rwycentpoi.uuid) as identifier,
                segleg.legtypearinc,
                segleg.speedlimit,
                segleg.speed_uom,
                segleg.speedreference,
                segleg.duration,
                segleg.procedureturnrequired,
                segleg.lowerlimit,
                segleg.lowerlimitreference,
                segleg.upperlimit,
                segleg.upperlimitreference,
                segleg.altitudeinterpretation,
                segleg.startend,
                segleg.startpoint,
                segleg.endpoint,
                segleg.uuidairportheliport,
                segleg.nameairportheliport,
                proc.rnav,
                proc.transitionid,
                proc.procedure,
                proc.name AS nameprocedure,
                seg_point.idsignificantpoint as idsignificantpoint,
       dp.idsignificantpoint as dp_idsign,
       nav.idsignificantpoint as nav_idsign,
       rwycentpoi.idsignificantpoint as rwy_idsign,

       coalesce(dp.designator, nav.designator, rwycentpoi.designator) as designator,
       coalesce(dp.type, nav.type) as type,


       CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text AND dp.type::text ~~ 'ICAO'::text THEN 'airway'::text
           ELSE NULL::text
           END                                                                                AS tp2,
       CASE
           WHEN seg_point.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
           WHEN seg_point.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
           ELSE NULL::text
           END                                                                                AS tp1,
       replace(replace(seg_point.role::text, '(,'::text, ''::text), ')'::text, ''::text)  as role,
                seg_point.flyover as flyover,
      coalesce(CASE
           WHEN dp.name IS NOT NULL THEN dp.name
           ELSE NULL::character varying::textnametype
           END ,
           CASE
           WHEN nav.name IS NOT NULL THEN nav.name
           ELSE NULL::character varying::textnametype
           END )                                                                              AS name,


       case when dp.latitude is not null or nav.latitude is not null then
       coalesce(case when dp.latitude is not null then
                        concat(
                            dd2dms(
                                       CASE
                                           WHEN dp.latitude::numeric < 0::numeric THEN dp.latitude::numeric * '-1'::integer::numeric
                                           WHEN dp.latitude::numeric > 0::numeric THEN dp.latitude::numeric
                                           END::double precision, 'lat'::character varying),
                               CASE
                                   WHEN dp.latitude::numeric < 0::numeric THEN 'S'::text
                                   WHEN dp.latitude::numeric > 0::numeric THEN 'N'::text
                                   else NULL
                                   END,
                               CASE
                                   WHEN dp.srid = 4284 THEN '*'::text
                                   ELSE NULL
                                   END) else  NULL end,
                 case when nav.latitude is not null then
                    concat(

                        dd2dms(
                      CASE
                          WHEN nav.latitude::numeric < 0::numeric THEN nav.latitude::numeric * '-1'::integer::numeric
                          WHEN nav.latitude::numeric > 0::numeric THEN nav.latitude::numeric
                          END::double precision, 'lat'::character varying),
              CASE
                  WHEN nav.latitude::numeric < 0::numeric THEN 'S'::text
                  WHEN nav.latitude::numeric > 0::numeric THEN 'N'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END)  else  NULL end
           ) else NULL end  AS latitude,

            case when dp.longitude is not null or nav.longitude is not null then
                coalesce(

        case when dp.longitude is not null then
       concat(
           dd2dms(
                      CASE
                          WHEN dp.longitude::numeric < 0::numeric THEN dp.longitude::numeric * '-1'::integer::numeric
                          WHEN dp.longitude::numeric > 0::numeric THEN dp.longitude::numeric
                          END::double precision, 'lon'::character varying),
              CASE
                  WHEN dp.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN dp.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end,
               case when nav.longitude is not null then
                        concat(
                            case when nav.longitude is not null then
                            dd2dms(
                      CASE
                          WHEN nav.longitude::numeric < 0::numeric THEN nav.longitude::numeric * '-1'::integer::numeric
                          WHEN nav.longitude::numeric > 0::numeric THEN nav.longitude::numeric
                          END::double precision, 'lon'::character varying) else NULL end,
              CASE
                  WHEN nav.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN nav.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end
                    ) else NULL end                                                                      AS longitude,
       coalesce(
                        (CASE
                             WHEN dp.srid = 4284 THEN 'PUK'::text
                             WHEN dp.srid = 4326 THEN 'WGE'::text
                             WHEN dp.srid = 7677 THEN 'RPE'::text
                             WHEN dp.srid = 7679 THEN 'RP1'::text
                             WHEN dp.srid = 4200 THEN 'S95'::text
                             WHEN dp.srid = 4269 THEN 'NAR'::text
                             WHEN dp.srid = 4230 THEN 'EUR'::text
                             WHEN dp.srid = 4618 THEN 'SAN'::text
                             WHEN dp.srid = 4740 THEN 'PZ9'::text
                             WHEN dp.srid = 4205 THEN 'AFG'::text
                             WHEN dp.srid = 4222 THEN 'CAP'::text
                             WHEN dp.srid = 6672 THEN 'CHI'::text
                             WHEN dp.srid = 4668 THEN 'EUS'::text
                             WHEN dp.srid = 4121 THEN 'GRS'::text
                             WHEN dp.srid = 6714 THEN 'IGN'::text
                             WHEN dp.srid = 4240 THEN 'INH'::text
                             WHEN dp.srid = 4245 THEN 'KEA'::text
                             WHEN dp.srid = 4263 THEN 'MIN'::text
                             WHEN dp.srid = 4267 THEN 'NAS'::text
                             WHEN dp.srid = 5498 THEN 'NAW'::text
                             WHEN dp.srid = 4277 THEN 'OGB'::text
                             WHEN dp.srid = 4248 THEN 'PRP'::text
                             WHEN dp.srid = 4139 THEN 'PUR'::text
                             WHEN dp.srid = 4287 THEN 'QUO'::text
                             WHEN dp.srid = 4806 THEN 'ROM'::text
                             WHEN dp.srid = 4618 THEN 'SAD'::text
                             WHEN dp.srid = 4730 THEN 'SAE'::text
                             WHEN dp.srid = 4700 THEN 'SHB'::text
                             WHEN dp.srid = 4284 THEN 'SPK'::text
                             WHEN dp.srid = 4814 THEN 'STO'::text
                             WHEN dp.srid = 4301 THEN 'TOK'::text
                             WHEN dp.srid = 4733 THEN 'WAK'::text
                             WHEN dp.srid = 4322 THEN 'WGC'::text
                            END),

                     (CASE
           WHEN nav.srid = 4284 THEN 'PUK'::text
           WHEN nav.srid = 4326 THEN 'WGE'::text
           WHEN nav.srid = 7677 THEN 'RPE'::text
           WHEN nav.srid = 7679 THEN 'RP1'::text
           WHEN nav.srid = 4200 THEN 'S95'::text
           WHEN nav.srid = 4269 THEN 'NAR'::text
           WHEN nav.srid = 4230 THEN 'EUR'::text
           WHEN nav.srid = 4618 THEN 'SAN'::text
           WHEN nav.srid = 4740 THEN 'PZ9'::text
           WHEN nav.srid = 4205 THEN 'AFG'::text
           WHEN nav.srid = 4222 THEN 'CAP'::text
           WHEN nav.srid = 6672 THEN 'CHI'::text
           WHEN nav.srid = 4668 THEN 'EUS'::text
           WHEN nav.srid = 4121 THEN 'GRS'::text
           WHEN nav.srid = 6714 THEN 'IGN'::text
           WHEN nav.srid = 4240 THEN 'INH'::text
           WHEN nav.srid = 4245 THEN 'KEA'::text
           WHEN nav.srid = 4263 THEN 'MIN'::text
           WHEN nav.srid = 4267 THEN 'NAS'::text
           WHEN nav.srid = 5498 THEN 'NAW'::text
           WHEN nav.srid = 4277 THEN 'OGB'::text
           WHEN nav.srid = 4248 THEN 'PRP'::text
           WHEN nav.srid = 4139 THEN 'PUR'::text
           WHEN nav.srid = 4287 THEN 'QUO'::text
           WHEN nav.srid = 4806 THEN 'ROM'::text
           WHEN nav.srid = 4618 THEN 'SAD'::text
           WHEN nav.srid = 4730 THEN 'SAE'::text
           WHEN nav.srid = 4700 THEN 'SHB'::text
           WHEN nav.srid = 4284 THEN 'SPK'::text
           WHEN nav.srid = 4814 THEN 'STO'::text
           WHEN nav.srid = 4301 THEN 'TOK'::text
           WHEN nav.srid = 4733 THEN 'WAK'::text
           WHEN nav.srid = 4322 THEN 'WGC'::text
          --- ELSE 'Unknown'::text
           END  )
                    ) AS srid,

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
           END                                                                                AS he,


                  CASE
           WHEN (d2.distance).value IS NOT NULL AND (d2.distance).unit IS NOT NULL THEN concat(
                   round((d2.distance).value::numeric, 1), ' ', (d2.distance).unit)
           ELSE NULL::text
           END                                                                                AS distance,
       (d2.type).value                                                                        AS distancetype,
       d2.idsignificantpoint                                                                  AS distancepointchoice,
       st_astext(nav_dist.geom)                                                               AS geom_nav_distance,
       nav_dist.type                                                                          AS type_dist_nav,
       nav_dist.designator                                                                    AS distance_navaid,
       a2.angle,
       (a2.angletype).value                                                                   AS angletype,
       a2.idsignificantpoint                                                                  AS anglepointchoice,
       st_astext(nav_angle.geom)                                                              AS geom_nav_angle,
       nav_angle.type                                                                         AS type_angle_nav,
       nav_angle.designator                                                                   AS angle_navaid,
       segleg.beginposition                                                                       AS beginposition,
       segleg.endposition                                                                       AS endposition,
       coalesce(dp.geom, nav.geom, rwycentpoi.geom) as geom
      /* nav.elevation,
       split_part( CASE
                            WHEN concat(COALESCE(rsnn.channel::text, tacan.channel::text, gbas.channel::text),
                                        COALESCE((ndb.frequency).value, (dme.ghostfrequency).value,
                                                 (vor.frequency).value)::text) = ''::text THEN NULL::text
                            ELSE concat(COALESCE(rsnn.channel::text, tacan.channel::text, gbas.channel::text),
                                        COALESCE((ndb.frequency).value, (dme.ghostfrequency).value,
                                                 (vor.frequency).value)::text)
                            END , ',',1) AS frequency,
       nav.magneticvariation,
       ndb.class                                                    AS classndb,
       vor.zerobearingdirection*/
       ---vor.declination::text           AS declination,
       ----dme.type                                                     AS typedme

       FROM segmentleg_mat segleg
                  LEFT JOIN procedure_mat proc
                            ON proc.identifier::uuid = segleg.uuidprocedure::uuid AND segleg.startend IS NOT NULL
                  Left JOIN segmentpoint  seg_point
                            ON segleg.startend = seg_point.id




                  left join runwaycentrelinepointtimeslice rwycentpoi
                              On seg_point.idsignificantpoint = rwycentpoi.idsignificantpoint
                  left join runwaycentrelinepoint r
                              ON rwycentpoi.uuid::uuid = r.uuid::uuid
                  left join rwycentpoi_cor  ON rwycentpoi_cor.a::integer = rwycentpoi.idtimeslice


                  left join designatedpointtimeslice dp
                             On seg_point.idsignificantpoint = dp.idsignificantpoint
                  left join designatedpoint d
                             ON dp.uuid::uuid = d.uuid::uuid
                  left join des_cor  ON des_cor.a::integer = dp.idtimeslice


                  left join navaidtimeslice nav
                             On seg_point.idsignificantpoint = nav.idsignificantpoint
                  left join navaid n
                             ON nav.uuid::uuid = n.uuid::uuid
                  left join nav_cor  ON nav_cor.a::integer = nav.idtimeslice




           /*       left JOIN navaid_navaidequipment ON nav.uuid::uuid = navaid_navaidequipment.uuidnavaid::uuid
                 left JOIN navaidequipmenttimeslice naveq ON navaid_navaidequipment.uuidnavaidequipment::uuid = naveq.uuid::uuid
                  LEFT JOIN ndb ndb ON naveq.idtimeslice = ndb.idtimeslice
                  LEFT JOIN dme dme ON naveq.idtimeslice = dme.idtimeslice
                  LEFT JOIN vor ON naveq.idtimeslice = vor.idtimeslice
                  LEFT JOIN tacan ON naveq.idtimeslice = tacan.idtimeslice
                  LEFT JOIN rsnn rsnn ON naveq.idtimeslice = rsnn.idtimeslice
                  LEFT JOIN groundbasedaugmentationsystem gbas ON naveq.idtimeslice = gbas.idtimeslice
                  left join naveq_cor  ON naveq_cor.a::integer = naveq.idtimeslice*/




                 --- left join segmentpointreference s on seg_point.id = s.idsegmentpoint
                 left join pointreference p on seg_point.id = p.idsegmentpoint
                 LEFT JOIN distanceindicationtimeslice d2 ON p.uuiddistind::uuid = d2.uuid::uuid AND
                                                     (d2.idtimeslice::text IN (SELECT distanceindication_actual_1.a
                                                                               FROM distanceindication_actual distanceindication_actual_1))
                 LEFT JOIN angleindicationtimeslice a2 ON p.uuidanglind::uuid = a2.uuid::uuid AND
                                                  (a2.idtimeslice::text IN (SELECT angleindication_actual_1.a
                                                                            FROM angleindication_actual angleindication_actual_1))
                 LEFT JOIN navaidtimeslice nav_dist ON d2.pointchoice_uuid::uuid = nav_dist.uuid::uuid  and
                                                     (nav_dist.idtimeslice::text IN (SELECT nav_cor.a
                                                                            FROM nav_cor ))

                 LEFT JOIN navaidtimeslice nav_angle ON nav_angle.uuid::uuid = a2.pointchoice_uuid::uuid  and
                                                     (nav_angle.idtimeslice::text IN (SELECT nav_cor.a
                                                                            FROM nav_cor ))



         GROUP BY segleg.identifier, coalesce(dp.uuid, nav.uuid, rwycentpoi.uuid), segleg.legtypearinc, segleg.speedlimit, segleg.speed_uom, segleg.speedreference, segleg.duration,
                  segleg.distance, segleg.distancetype, segleg.distancepointchoice, segleg.geom_nav_distance,
                  segleg.type_dist_nav, segleg.distance_navaid, segleg.angle, segleg.angletype, segleg.anglepointchoice,
                  segleg.geom_nav_angle, segleg.type_angle_nav, segleg.angle_navaid, segleg.procedureturnrequired,
                  segleg.lowerlimit, segleg.lowerlimitreference, segleg.upperlimit, segleg.upperlimitreference,
                  segleg.altitudeinterpretation, segleg.startend, segleg.startpoint, segleg.endpoint,
                  segleg.uuidairportheliport, segleg.nameairportheliport, proc.rnav, proc.transitionid, proc.procedure,
                  proc.name, seg_point.idsignificantpoint,
                  dp.idsignificantpoint,
                  nav.idsignificantpoint,
                  rwycentpoi.idsignificantpoint,

                  coalesce(dp.designator, nav.designator, rwycentpoi.designator),
       coalesce(dp.type, nav.type),

       CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text AND dp.type::text ~~ 'ICAO'::text THEN 'airway'::text
           ELSE NULL::text
           END,
       CASE
           WHEN seg_point.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
           WHEN seg_point.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
           ELSE NULL
           END,
                  replace(replace(seg_point.role::text, '(,'::text, ''::text), ')'::text, ''::text),
                  seg_point.flyover,
        coalesce(CASE
           WHEN dp.name IS NOT NULL THEN dp.name
           ELSE NULL::character varying::textnametype
           END ,
           CASE
           WHEN nav.name IS NOT NULL THEN nav.name
           ELSE NULL::character varying::textnametype
           END ) ,
       case when dp.latitude is not null or nav.latitude is not null then
       coalesce(case when dp.latitude is not null then
                        concat(
                            dd2dms(
                                       CASE
                                           WHEN dp.latitude::numeric < 0::numeric THEN dp.latitude::numeric * '-1'::integer::numeric
                                           WHEN dp.latitude::numeric > 0::numeric THEN dp.latitude::numeric
                                           END::double precision, 'lat'::character varying),
                               CASE
                                   WHEN dp.latitude::numeric < 0::numeric THEN 'S'::text
                                   WHEN dp.latitude::numeric > 0::numeric THEN 'N'::text
                                   else NULL
                                   END,
                               CASE
                                   WHEN dp.srid = 4284 THEN '*'::text
                                   ELSE NULL
                                   END) else  NULL end,
                 case when nav.latitude is not null then
                    concat(

                        dd2dms(
                      CASE
                          WHEN nav.latitude::numeric < 0::numeric THEN nav.latitude::numeric * '-1'::integer::numeric
                          WHEN nav.latitude::numeric > 0::numeric THEN nav.latitude::numeric
                          END::double precision, 'lat'::character varying),
              CASE
                  WHEN nav.latitude::numeric < 0::numeric THEN 'S'::text
                  WHEN nav.latitude::numeric > 0::numeric THEN 'N'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END)  else  NULL end
           ) else NULL end ,

            case when dp.longitude is not null or nav.longitude is not null then
                coalesce(

        case when dp.longitude is not null then
       concat(
           dd2dms(
                      CASE
                          WHEN dp.longitude::numeric < 0::numeric THEN dp.longitude::numeric * '-1'::integer::numeric
                          WHEN dp.longitude::numeric > 0::numeric THEN dp.longitude::numeric
                          END::double precision, 'lon'::character varying),
              CASE
                  WHEN dp.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN dp.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end,
               case when nav.longitude is not null then
                        concat(
                            case when nav.longitude is not null then
                            dd2dms(
                      CASE
                          WHEN nav.longitude::numeric < 0::numeric THEN nav.longitude::numeric * '-1'::integer::numeric
                          WHEN nav.longitude::numeric > 0::numeric THEN nav.longitude::numeric
                          END::double precision, 'lon'::character varying) else NULL end,
              CASE
                  WHEN nav.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN nav.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end
                    ) else NULL end
                  ,
       coalesce(
                        (CASE
                             WHEN dp.srid = 4284 THEN 'PUK'::text
                             WHEN dp.srid = 4326 THEN 'WGE'::text
                             WHEN dp.srid = 7677 THEN 'RPE'::text
                             WHEN dp.srid = 7679 THEN 'RP1'::text
                             WHEN dp.srid = 4200 THEN 'S95'::text
                             WHEN dp.srid = 4269 THEN 'NAR'::text
                             WHEN dp.srid = 4230 THEN 'EUR'::text
                             WHEN dp.srid = 4618 THEN 'SAN'::text
                             WHEN dp.srid = 4740 THEN 'PZ9'::text
                             WHEN dp.srid = 4205 THEN 'AFG'::text
                             WHEN dp.srid = 4222 THEN 'CAP'::text
                             WHEN dp.srid = 6672 THEN 'CHI'::text
                             WHEN dp.srid = 4668 THEN 'EUS'::text
                             WHEN dp.srid = 4121 THEN 'GRS'::text
                             WHEN dp.srid = 6714 THEN 'IGN'::text
                             WHEN dp.srid = 4240 THEN 'INH'::text
                             WHEN dp.srid = 4245 THEN 'KEA'::text
                             WHEN dp.srid = 4263 THEN 'MIN'::text
                             WHEN dp.srid = 4267 THEN 'NAS'::text
                             WHEN dp.srid = 5498 THEN 'NAW'::text
                             WHEN dp.srid = 4277 THEN 'OGB'::text
                             WHEN dp.srid = 4248 THEN 'PRP'::text
                             WHEN dp.srid = 4139 THEN 'PUR'::text
                             WHEN dp.srid = 4287 THEN 'QUO'::text
                             WHEN dp.srid = 4806 THEN 'ROM'::text
                             WHEN dp.srid = 4618 THEN 'SAD'::text
                             WHEN dp.srid = 4730 THEN 'SAE'::text
                             WHEN dp.srid = 4700 THEN 'SHB'::text
                             WHEN dp.srid = 4284 THEN 'SPK'::text
                             WHEN dp.srid = 4814 THEN 'STO'::text
                             WHEN dp.srid = 4301 THEN 'TOK'::text
                             WHEN dp.srid = 4733 THEN 'WAK'::text
                             WHEN dp.srid = 4322 THEN 'WGC'::text
                             --ELSE 'Unknown'::text
                            END),

                     (CASE
           WHEN nav.srid = 4284 THEN 'PUK'::text
           WHEN nav.srid = 4326 THEN 'WGE'::text
           WHEN nav.srid = 7677 THEN 'RPE'::text
           WHEN nav.srid = 7679 THEN 'RP1'::text
           WHEN nav.srid = 4200 THEN 'S95'::text
           WHEN nav.srid = 4269 THEN 'NAR'::text
           WHEN nav.srid = 4230 THEN 'EUR'::text
           WHEN nav.srid = 4618 THEN 'SAN'::text
           WHEN nav.srid = 4740 THEN 'PZ9'::text
           WHEN nav.srid = 4205 THEN 'AFG'::text
           WHEN nav.srid = 4222 THEN 'CAP'::text
           WHEN nav.srid = 6672 THEN 'CHI'::text
           WHEN nav.srid = 4668 THEN 'EUS'::text
           WHEN nav.srid = 4121 THEN 'GRS'::text
           WHEN nav.srid = 6714 THEN 'IGN'::text
           WHEN nav.srid = 4240 THEN 'INH'::text
           WHEN nav.srid = 4245 THEN 'KEA'::text
           WHEN nav.srid = 4263 THEN 'MIN'::text
           WHEN nav.srid = 4267 THEN 'NAS'::text
           WHEN nav.srid = 5498 THEN 'NAW'::text
           WHEN nav.srid = 4277 THEN 'OGB'::text
           WHEN nav.srid = 4248 THEN 'PRP'::text
           WHEN nav.srid = 4139 THEN 'PUR'::text
           WHEN nav.srid = 4287 THEN 'QUO'::text
           WHEN nav.srid = 4806 THEN 'ROM'::text
           WHEN nav.srid = 4618 THEN 'SAD'::text
           WHEN nav.srid = 4730 THEN 'SAE'::text
           WHEN nav.srid = 4700 THEN 'SHB'::text
           WHEN nav.srid = 4284 THEN 'SPK'::text
           WHEN nav.srid = 4814 THEN 'STO'::text
           WHEN nav.srid = 4301 THEN 'TOK'::text
           WHEN nav.srid = 4733 THEN 'WAK'::text
           WHEN nav.srid = 4322 THEN 'WGC'::text
         --- ELSE 'Unknown'::text
           END  )
                    ) ,        CASE
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
                   (CASE
                 WHEN (d2.distance).value IS NOT NULL AND (d2.distance).unit IS NOT NULL THEN concat(
                         round((d2.distance).value::numeric, 1), ' ', (d2.distance).unit)
                 ELSE NULL::text
                 END), ((d2.type).value), d2.idsignificantpoint, (st_astext(nav_dist.geom)), nav_dist.type,
         nav_dist.designator, a2.angle, ((a2.angletype).value), a2.idsignificantpoint, (st_astext(nav_angle.geom)),
         nav_angle.type, nav_angle.designator, segleg.beginposition,
       segleg.endposition, coalesce(dp.geom, nav.geom, rwycentpoi.geom);

create index segmentpoint_indx
    on segmentpoint_mat (identifier);

----------------------


--------------------rout_segmentpoint_mat--(nav \ des а трассах)-----segmentpoint  seg_point  ON coalesce(rout.start_point, rout.end_point)= seg_point.id -----
----------( ! mbase не хватает связи между routesegmenttimeslice - segmentpoint  )

create materialized view rout_segmentpoint_mat as
WITH des_cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM designatedpointtimeslice dp_1
             LEFT JOIN designatedpoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
),

     nav_cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM navaidtimeslice dp_1
             LEFT JOIN navaid d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
)

SELECT
    coalesce(dp.uuid, nav.uuid) as identifier,
    seg_point.idsignificantpoint as idsignificantpoint,
       dp.idsignificantpoint as dp_idsign,
       nav.idsignificantpoint as nav_idsign,
       --rwycentpoi.idsignificantpoint as rwy_idsign,

       coalesce(dp.designator, nav.designator) as designator,
       coalesce(dp.type, nav.type) as type,


       CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text AND dp.type::text ~~ 'ICAO'::text THEN 'airway'::text
           ELSE NULL::text
           END                                                                                AS tp2,
       CASE
           WHEN seg_point.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
           WHEN seg_point.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
           ELSE NULL::text
           END                                                                                AS tp1,
       replace(replace(seg_point.role::text, '(,'::text, ''::text), ')'::text, ''::text)  as role,
                seg_point.flyover as flyover,
      coalesce(CASE
           WHEN dp.name IS NOT NULL THEN dp.name
           ELSE NULL::character varying::textnametype
           END ,
           CASE
           WHEN nav.name IS NOT NULL THEN nav.name
           ELSE NULL::character varying::textnametype
           END )                                                                              AS name,


       case when dp.latitude is not null or nav.latitude is not null then
       coalesce(case when dp.latitude is not null then
                        concat(
                            dd2dms(
                                       CASE
                                           WHEN dp.latitude::numeric < 0::numeric THEN dp.latitude::numeric * '-1'::integer::numeric
                                           WHEN dp.latitude::numeric > 0::numeric THEN dp.latitude::numeric
                                           END::double precision, 'lat'::character varying),
                               CASE
                                   WHEN dp.latitude::numeric < 0::numeric THEN 'S'::text
                                   WHEN dp.latitude::numeric > 0::numeric THEN 'N'::text
                                   else NULL
                                   END,
                               CASE
                                   WHEN dp.srid = 4284 THEN '*'::text
                                   ELSE NULL
                                   END) else  NULL end,
                 case when nav.latitude is not null then
                    concat(

                        dd2dms(
                      CASE
                          WHEN nav.latitude::numeric < 0::numeric THEN nav.latitude::numeric * '-1'::integer::numeric
                          WHEN nav.latitude::numeric > 0::numeric THEN nav.latitude::numeric
                          END::double precision, 'lat'::character varying),
              CASE
                  WHEN nav.latitude::numeric < 0::numeric THEN 'S'::text
                  WHEN nav.latitude::numeric > 0::numeric THEN 'N'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END)  else  NULL end
           ) else NULL end  AS latitude,

            case when dp.longitude is not null or nav.longitude is not null then
                coalesce(

        case when dp.longitude is not null then
       concat(
           dd2dms(
                      CASE
                          WHEN dp.longitude::numeric < 0::numeric THEN dp.longitude::numeric * '-1'::integer::numeric
                          WHEN dp.longitude::numeric > 0::numeric THEN dp.longitude::numeric
                          END::double precision, 'lon'::character varying),
              CASE
                  WHEN dp.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN dp.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end,
               case when nav.longitude is not null then
                        concat(
                            case when nav.longitude is not null then
                            dd2dms(
                      CASE
                          WHEN nav.longitude::numeric < 0::numeric THEN nav.longitude::numeric * '-1'::integer::numeric
                          WHEN nav.longitude::numeric > 0::numeric THEN nav.longitude::numeric
                          END::double precision, 'lon'::character varying) else NULL end,
              CASE
                  WHEN nav.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN nav.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end
                    ) else NULL end                                                                      AS longitude,
       coalesce(
                        (CASE
                             WHEN dp.srid = 4284 THEN 'PUK'::text
                             WHEN dp.srid = 4326 THEN 'WGE'::text
                             WHEN dp.srid = 7677 THEN 'RPE'::text
                             WHEN dp.srid = 7679 THEN 'RP1'::text
                             WHEN dp.srid = 4200 THEN 'S95'::text
                             WHEN dp.srid = 4269 THEN 'NAR'::text
                             WHEN dp.srid = 4230 THEN 'EUR'::text
                             WHEN dp.srid = 4618 THEN 'SAN'::text
                             WHEN dp.srid = 4740 THEN 'PZ9'::text
                             WHEN dp.srid = 4205 THEN 'AFG'::text
                             WHEN dp.srid = 4222 THEN 'CAP'::text
                             WHEN dp.srid = 6672 THEN 'CHI'::text
                             WHEN dp.srid = 4668 THEN 'EUS'::text
                             WHEN dp.srid = 4121 THEN 'GRS'::text
                             WHEN dp.srid = 6714 THEN 'IGN'::text
                             WHEN dp.srid = 4240 THEN 'INH'::text
                             WHEN dp.srid = 4245 THEN 'KEA'::text
                             WHEN dp.srid = 4263 THEN 'MIN'::text
                             WHEN dp.srid = 4267 THEN 'NAS'::text
                             WHEN dp.srid = 5498 THEN 'NAW'::text
                             WHEN dp.srid = 4277 THEN 'OGB'::text
                             WHEN dp.srid = 4248 THEN 'PRP'::text
                             WHEN dp.srid = 4139 THEN 'PUR'::text
                             WHEN dp.srid = 4287 THEN 'QUO'::text
                             WHEN dp.srid = 4806 THEN 'ROM'::text
                             WHEN dp.srid = 4618 THEN 'SAD'::text
                             WHEN dp.srid = 4730 THEN 'SAE'::text
                             WHEN dp.srid = 4700 THEN 'SHB'::text
                             WHEN dp.srid = 4284 THEN 'SPK'::text
                             WHEN dp.srid = 4814 THEN 'STO'::text
                             WHEN dp.srid = 4301 THEN 'TOK'::text
                             WHEN dp.srid = 4733 THEN 'WAK'::text
                             WHEN dp.srid = 4322 THEN 'WGC'::text
                            END),

                     (CASE
           WHEN nav.srid = 4284 THEN 'PUK'::text
           WHEN nav.srid = 4326 THEN 'WGE'::text
           WHEN nav.srid = 7677 THEN 'RPE'::text
           WHEN nav.srid = 7679 THEN 'RP1'::text
           WHEN nav.srid = 4200 THEN 'S95'::text
           WHEN nav.srid = 4269 THEN 'NAR'::text
           WHEN nav.srid = 4230 THEN 'EUR'::text
           WHEN nav.srid = 4618 THEN 'SAN'::text
           WHEN nav.srid = 4740 THEN 'PZ9'::text
           WHEN nav.srid = 4205 THEN 'AFG'::text
           WHEN nav.srid = 4222 THEN 'CAP'::text
           WHEN nav.srid = 6672 THEN 'CHI'::text
           WHEN nav.srid = 4668 THEN 'EUS'::text
           WHEN nav.srid = 4121 THEN 'GRS'::text
           WHEN nav.srid = 6714 THEN 'IGN'::text
           WHEN nav.srid = 4240 THEN 'INH'::text
           WHEN nav.srid = 4245 THEN 'KEA'::text
           WHEN nav.srid = 4263 THEN 'MIN'::text
           WHEN nav.srid = 4267 THEN 'NAS'::text
           WHEN nav.srid = 5498 THEN 'NAW'::text
           WHEN nav.srid = 4277 THEN 'OGB'::text
           WHEN nav.srid = 4248 THEN 'PRP'::text
           WHEN nav.srid = 4139 THEN 'PUR'::text
           WHEN nav.srid = 4287 THEN 'QUO'::text
           WHEN nav.srid = 4806 THEN 'ROM'::text
           WHEN nav.srid = 4618 THEN 'SAD'::text
           WHEN nav.srid = 4730 THEN 'SAE'::text
           WHEN nav.srid = 4700 THEN 'SHB'::text
           WHEN nav.srid = 4284 THEN 'SPK'::text
           WHEN nav.srid = 4814 THEN 'STO'::text
           WHEN nav.srid = 4301 THEN 'TOK'::text
           WHEN nav.srid = 4733 THEN 'WAK'::text
           WHEN nav.srid = 4322 THEN 'WGC'::text
          --- ELSE 'Unknown'::text
           END  )
                    ) AS srid,




       rout.beginposition                                                                       AS beginposition,
       rout.endposition                                                                       AS endposition,
       coalesce(dp.geom, nav.geom) as geom,
       NULL as uuidairportheliport,
       NULL as nameairportheliport

         FROM routesegment_mat rout

                  Left JOIN segmentpoint  seg_point
                            ON coalesce(rout.start_point, rout.end_point)= seg_point.id

                  left join designatedpointtimeslice dp
                             On seg_point.idsignificantpoint = dp.idsignificantpoint
                  left join designatedpoint d
                             ON dp.uuid::uuid = d.uuid::uuid
                  left join des_cor  ON des_cor.a::integer = dp.idtimeslice

                  left join navaidtimeslice nav
                             On seg_point.idsignificantpoint = nav.idsignificantpoint
                  left join navaid n
                             ON nav.uuid::uuid = n.uuid::uuid
                  left join nav_cor  ON nav_cor.a::integer = nav.idtimeslice

                 --- left join segmentpointreference s on seg_point.id = s.idsegmentpoint
         where dp.name is null
         GROUP BY
                coalesce(dp.uuid, nav.uuid),
                seg_point.idsignificantpoint,
       dp.idsignificantpoint,
       nav.idsignificantpoint,

       coalesce(dp.designator, nav.designator ),
       coalesce(dp.type, nav.type),

       CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text AND dp.type::text ~~ 'ICAO'::text THEN 'airway'::text
           ELSE NULL::text
           END,
       CASE
           WHEN seg_point.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
           WHEN seg_point.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
           ELSE NULL
           END,
                  replace(replace(seg_point.role::text, '(,'::text, ''::text), ')'::text, ''::text),
                  seg_point.flyover,
        coalesce(CASE
           WHEN dp.name IS NOT NULL THEN dp.name
           ELSE NULL::character varying::textnametype
           END ,
           CASE
           WHEN nav.name IS NOT NULL THEN nav.name
           ELSE NULL::character varying::textnametype
           END ) ,
       case when dp.latitude is not null or nav.latitude is not null then
       coalesce(case when dp.latitude is not null then
                        concat(
                            dd2dms(
                                       CASE
                                           WHEN dp.latitude::numeric < 0::numeric THEN dp.latitude::numeric * '-1'::integer::numeric
                                           WHEN dp.latitude::numeric > 0::numeric THEN dp.latitude::numeric
                                           END::double precision, 'lat'::character varying),
                               CASE
                                   WHEN dp.latitude::numeric < 0::numeric THEN 'S'::text
                                   WHEN dp.latitude::numeric > 0::numeric THEN 'N'::text
                                   else NULL
                                   END,
                               CASE
                                   WHEN dp.srid = 4284 THEN '*'::text
                                   ELSE NULL
                                   END) else  NULL end,
                 case when nav.latitude is not null then
                    concat(

                        dd2dms(
                      CASE
                          WHEN nav.latitude::numeric < 0::numeric THEN nav.latitude::numeric * '-1'::integer::numeric
                          WHEN nav.latitude::numeric > 0::numeric THEN nav.latitude::numeric
                          END::double precision, 'lat'::character varying),
              CASE
                  WHEN nav.latitude::numeric < 0::numeric THEN 'S'::text
                  WHEN nav.latitude::numeric > 0::numeric THEN 'N'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END)  else  NULL end
           ) else NULL end ,

            case when dp.longitude is not null or nav.longitude is not null then
                coalesce(

        case when dp.longitude is not null then
       concat(
           dd2dms(
                      CASE
                          WHEN dp.longitude::numeric < 0::numeric THEN dp.longitude::numeric * '-1'::integer::numeric
                          WHEN dp.longitude::numeric > 0::numeric THEN dp.longitude::numeric
                          END::double precision, 'lon'::character varying),
              CASE
                  WHEN dp.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN dp.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end,
               case when nav.longitude is not null then
                        concat(
                            case when nav.longitude is not null then
                            dd2dms(
                      CASE
                          WHEN nav.longitude::numeric < 0::numeric THEN nav.longitude::numeric * '-1'::integer::numeric
                          WHEN nav.longitude::numeric > 0::numeric THEN nav.longitude::numeric
                          END::double precision, 'lon'::character varying) else NULL end,
              CASE
                  WHEN nav.longitude::numeric < 0::numeric THEN 'W'::text
                  WHEN nav.longitude::numeric > 0::numeric THEN 'E'::text
                  else NULL
                  END,
              CASE
                  WHEN nav.srid = 4284 THEN '*'::text
                  ELSE NULL
                  END) else NULL end
                    ) else NULL end
                  ,
       coalesce(
                        (CASE
                             WHEN dp.srid = 4284 THEN 'PUK'::text
                             WHEN dp.srid = 4326 THEN 'WGE'::text
                             WHEN dp.srid = 7677 THEN 'RPE'::text
                             WHEN dp.srid = 7679 THEN 'RP1'::text
                             WHEN dp.srid = 4200 THEN 'S95'::text
                             WHEN dp.srid = 4269 THEN 'NAR'::text
                             WHEN dp.srid = 4230 THEN 'EUR'::text
                             WHEN dp.srid = 4618 THEN 'SAN'::text
                             WHEN dp.srid = 4740 THEN 'PZ9'::text
                             WHEN dp.srid = 4205 THEN 'AFG'::text
                             WHEN dp.srid = 4222 THEN 'CAP'::text
                             WHEN dp.srid = 6672 THEN 'CHI'::text
                             WHEN dp.srid = 4668 THEN 'EUS'::text
                             WHEN dp.srid = 4121 THEN 'GRS'::text
                             WHEN dp.srid = 6714 THEN 'IGN'::text
                             WHEN dp.srid = 4240 THEN 'INH'::text
                             WHEN dp.srid = 4245 THEN 'KEA'::text
                             WHEN dp.srid = 4263 THEN 'MIN'::text
                             WHEN dp.srid = 4267 THEN 'NAS'::text
                             WHEN dp.srid = 5498 THEN 'NAW'::text
                             WHEN dp.srid = 4277 THEN 'OGB'::text
                             WHEN dp.srid = 4248 THEN 'PRP'::text
                             WHEN dp.srid = 4139 THEN 'PUR'::text
                             WHEN dp.srid = 4287 THEN 'QUO'::text
                             WHEN dp.srid = 4806 THEN 'ROM'::text
                             WHEN dp.srid = 4618 THEN 'SAD'::text
                             WHEN dp.srid = 4730 THEN 'SAE'::text
                             WHEN dp.srid = 4700 THEN 'SHB'::text
                             WHEN dp.srid = 4284 THEN 'SPK'::text
                             WHEN dp.srid = 4814 THEN 'STO'::text
                             WHEN dp.srid = 4301 THEN 'TOK'::text
                             WHEN dp.srid = 4733 THEN 'WAK'::text
                             WHEN dp.srid = 4322 THEN 'WGC'::text
                             --ELSE 'Unknown'::text
                            END),

                     (CASE
           WHEN nav.srid = 4284 THEN 'PUK'::text
           WHEN nav.srid = 4326 THEN 'WGE'::text
           WHEN nav.srid = 7677 THEN 'RPE'::text
           WHEN nav.srid = 7679 THEN 'RP1'::text
           WHEN nav.srid = 4200 THEN 'S95'::text
           WHEN nav.srid = 4269 THEN 'NAR'::text
           WHEN nav.srid = 4230 THEN 'EUR'::text
           WHEN nav.srid = 4618 THEN 'SAN'::text
           WHEN nav.srid = 4740 THEN 'PZ9'::text
           WHEN nav.srid = 4205 THEN 'AFG'::text
           WHEN nav.srid = 4222 THEN 'CAP'::text
           WHEN nav.srid = 6672 THEN 'CHI'::text
           WHEN nav.srid = 4668 THEN 'EUS'::text
           WHEN nav.srid = 4121 THEN 'GRS'::text
           WHEN nav.srid = 6714 THEN 'IGN'::text
           WHEN nav.srid = 4240 THEN 'INH'::text
           WHEN nav.srid = 4245 THEN 'KEA'::text
           WHEN nav.srid = 4263 THEN 'MIN'::text
           WHEN nav.srid = 4267 THEN 'NAS'::text
           WHEN nav.srid = 5498 THEN 'NAW'::text
           WHEN nav.srid = 4277 THEN 'OGB'::text
           WHEN nav.srid = 4248 THEN 'PRP'::text
           WHEN nav.srid = 4139 THEN 'PUR'::text
           WHEN nav.srid = 4287 THEN 'QUO'::text
           WHEN nav.srid = 4806 THEN 'ROM'::text
           WHEN nav.srid = 4618 THEN 'SAD'::text
           WHEN nav.srid = 4730 THEN 'SAE'::text
           WHEN nav.srid = 4700 THEN 'SHB'::text
           WHEN nav.srid = 4284 THEN 'SPK'::text
           WHEN nav.srid = 4814 THEN 'STO'::text
           WHEN nav.srid = 4301 THEN 'TOK'::text
           WHEN nav.srid = 4733 THEN 'WAK'::text
           WHEN nav.srid = 4322 THEN 'WGC'::text
         --- ELSE 'Unknown'::text
           END  )
                    ),  rout.beginposition,
       rout.endposition,
       coalesce(dp.geom, nav.geom);


create index rout_segmentpoint_indx
    on rout_segmentpoint_mat (identifier);








----------------------
-------------navaid_mat_procedure  (здесь только точки рнс, которые на процедурах, без трассовых )
create materialized view navaid_mat_procedure as
select
identifier,
designator,
name,
type,
---elevation,
---frequency,
---magneticvariation,
---classndb,
---zerobearingdirection,
----declination,
---typedme,
latitude,
longitude,
srid,
uuidairportheliport,
nameairportheliport,
beginposition,
endposition,
geom,
idsignificantpoint,
speedlimit,
speedreference,
duration,
distance,
distancetype,
distancepointchoice,
geom_nav_distance,
type_dist_nav,
distance_navaid,
angle,
angletype,
anglepointchoice,
geom_nav_angle,
type_angle_nav,
angle_navaid,
procedureturnrequired,
lowerlimit,
lowerlimitreference,
upperlimit,
upperlimitreference,
altitudeinterpretation,
rnav,
transitionid,
procedure,
nameprocedure,
segmentpoint_mat.segleg_uuid as related_segmentleg,
flyover,
role,
startend
from segmentpoint_mat
where nav_idsign is not null
GROUP BY
identifier,
designator,
name,
type,
---elevation,
---frequency,
---magneticvariation,
---classndb,
---zerobearingdirection,
----declination,
---typedme,
latitude,
longitude,
srid,
uuidairportheliport,
nameairportheliport,
beginposition,
endposition,
geom,
idsignificantpoint,
speedlimit,
speedreference,
duration,
distance,
distancetype,
distancepointchoice,
geom_nav_distance,
type_dist_nav,
distance_navaid,
angle,
angletype,
anglepointchoice,
geom_nav_angle,
type_angle_nav,
angle_navaid,
procedureturnrequired,
lowerlimit,
lowerlimitreference,
upperlimit,
upperlimitreference,
altitudeinterpretation,
rnav,
transitionid,
procedure,
nameprocedure,
segmentpoint_mat.segleg_uuid,
flyover,
role,
startend;



-----есть ссылка на segmentleg_mat----

create materialized view navaid_mat as
WITH   cor  as
     (SELECT split_part(string_agg(dp.idtimeslice::text, ',' order by t.correctionnumber desc ), ',' ,1) a
   FROM navaidtimeslice dp
         LEFT JOIN navaid d on d.uuid = dp.uuid
         LEFT JOIN timeslice t on t.idtimeslice = dp.idtimeslice
    where validtimeend is null
    GROUP BY d.uuid),
     main_sel AS (
                    SELECT nav.uuid                                           AS identifier,
                                           COALESCE(nav.designator, naveq.designator)         AS designator,
                                           COALESCE(nav.name, naveq.name)                     AS name,
                                           COALESCE(
                                                   CASE
                                                       WHEN nav.type::text ~~ '%OTHER%'::text
                                                           THEN replace(nav.type::text, 'OTHER: '::text, ''::text)::character varying
                                                       ELSE nav.type::character varying
                                                       END,
                                                   CASE
                                                       WHEN ndb.idtimeslice IS NOT NULL THEN 'NDB'::text
                                                       WHEN dme.idtimeslice IS NOT NULL THEN 'DME'::text
                                                       WHEN vor.idtimeslice IS NOT NULL THEN 'VOR'::text
                                                       WHEN tacan.idtimeslice IS NOT NULL THEN 'TACAN'::text
                                                       ELSE NULL::text
                                                       END::character varying)                AS type,
                                           CASE
                                               WHEN (nav.elevation).value IS NULL THEN NULL::text
                                               ELSE concat((nav.elevation).value::text, ' ', (nav.elevation).unit)
                                               END                                            AS elevation,
                                       split_part(  string_agg( case  when  concat(COALESCE(r.channel::text, tacan.channel::text, gbas.channel::text),

                                                  COALESCE((ndb.frequency).value, (dme.ghostfrequency).value,
                                                           (vor.frequency).value)::text) = '' then NULL else
                                                               concat(COALESCE(r.channel::text, tacan.channel::text, gbas.channel::text),

                                                  COALESCE((ndb.frequency).value, (dme.ghostfrequency).value,
                                                           (vor.frequency).value)::text)  end , ',' order by t.correctionnumber desc), ',', 1  )  AS frequency,
                                           round(nav.magneticvariation::numeric, 1)::text     AS magneticvariation,
                                           ndb.class                                          AS classndb,
                                           vor.zerobearingdirection,
                                           COALESCE(vor.declination, tacan.declination)::text AS declination,
                                           dme.type                                           AS typedme,
                                           concat(dd2dms(
                                                          CASE
                                                              WHEN nav.latitude::numeric < 0::numeric THEN nav.latitude::numeric * '-1'::integer::numeric
                                                              ELSE nav.latitude::numeric
                                                              END::double precision, 'lat'::character varying),
                                                  CASE
                                                      WHEN nav.latitude::numeric < 0::numeric THEN 'S'::text
                                                      ELSE 'N'::text
                                                      END,
                                                  CASE
                                                      WHEN nav.srid = 4284 THEN '*'::text
                                                      ELSE NULL::text
                                                      END)                                    AS latitude,
                                           concat(dd2dms(
                                                          CASE
                                                              WHEN nav.longitude::numeric < 0::numeric THEN nav.longitude::numeric * '-1'::integer::numeric
                                                              ELSE nav.longitude::numeric
                                                              END::double precision, 'lon'::character varying),
                                                  CASE
                                                      WHEN nav.longitude::numeric < 0::numeric THEN 'W'::text
                                                      ELSE 'E'::text
                                                      END,
                                                  CASE
                                                      WHEN nav.srid = 4284 THEN '*'::text
                                                      ELSE NULL::text
                                                      END)                                    AS longitude,
                                           CASE
                                               WHEN nav.srid = 4284 THEN 'PUK'::text
                                               WHEN nav.srid = 4326 THEN 'WGE'::text
                                               WHEN nav.srid = 7677 THEN 'RPE'::text
                                               WHEN nav.srid = 7679 THEN 'RP1'::text
                                               WHEN nav.srid = 4200 THEN 'S95'::text
                                               WHEN nav.srid = 4269 THEN 'NAR'::text
                                               WHEN nav.srid = 4230 THEN 'EUR'::text
                                               WHEN nav.srid = 4618 THEN 'SAN'::text
                                               WHEN nav.srid = 4740 THEN 'PZ9'::text
                                               WHEN nav.srid = 4205 THEN 'AFG'::text
                                               WHEN nav.srid = 4222 THEN 'CAP'::text
                                               WHEN nav.srid = 6672 THEN 'CHI'::text
                                               WHEN nav.srid = 4668 THEN 'EUS'::text
                                               WHEN nav.srid = 4121 THEN 'GRS'::text
                                               WHEN nav.srid = 6714 THEN 'IGN'::text
                                               WHEN nav.srid = 4240 THEN 'INH'::text
                                               WHEN nav.srid = 4245 THEN 'KEA'::text
                                               WHEN nav.srid = 4263 THEN 'MIN'::text
                                               WHEN nav.srid = 4267 THEN 'NAS'::text
                                               WHEN nav.srid = 5498 THEN 'NAW'::text
                                               WHEN nav.srid = 4277 THEN 'OGB'::text
                                               WHEN nav.srid = 4248 THEN 'PRP'::text
                                               WHEN nav.srid = 4139 THEN 'PUR'::text
                                               WHEN nav.srid = 4287 THEN 'QUO'::text
                                               WHEN nav.srid = 4806 THEN 'ROM'::text
                                               WHEN nav.srid = 4618 THEN 'SAD'::text
                                               WHEN nav.srid = 4730 THEN 'SAE'::text
                                               WHEN nav.srid = 4700 THEN 'SHB'::text
                                               WHEN nav.srid = 4284 THEN 'SPK'::text
                                               WHEN nav.srid = 4814 THEN 'STO'::text
                                               WHEN nav.srid = 4301 THEN 'TOK'::text
                                   WHEN nav.srid = 4733 THEN 'WAK'::text
                                   WHEN nav.srid = 4322 THEN 'WGC'::text
                                   ELSE 'Unknown'::text
                                   END                                            AS srid,
                               nav.uuidarphlp                                     AS uuidairportheliport,
                               a.name                                             AS nameairportheliport,
                               t.validtimebegin                                 AS beginposition,
                               t.validtimeend                                   AS endposition,
                              ---- t.correctionnumber                                   AS correctionnumber ,
                               nav.geom,
                               nav.idsignificantpoint
    FROM navaidtimeslice nav
             JOIN navaid_navaidequipment ON nav.uuid::uuid = navaid_navaidequipment.uuidnavaid::uuid
             JOIN navaidequipmenttimeslice naveq ON navaid_navaidequipment.uuidnavaidequipment::uuid = naveq.uuid::uuid
             LEFT JOIN ndb ndb ON naveq.idtimeslice = ndb.idtimeslice
             LEFT JOIN dme dme ON naveq.idtimeslice = dme.idtimeslice
             LEFT JOIN vor ON naveq.idtimeslice = vor.idtimeslice
             LEFT JOIN tacan ON naveq.idtimeslice = tacan.idtimeslice
             LEFT JOIN rsnn r ON naveq.idtimeslice = r.idtimeslice
             LEFT JOIN groundbasedaugmentationsystem gbas ON naveq.idtimeslice = gbas.idtimeslice
             LEFT JOIN airportheliporttimeslice a ON a.uuid = nav.uuidarphlp
             LEFT JOIN segmentpoint seg ON seg.idsignificantpoint = nav.idsignificantpoint
             LEFT JOIN segmentleg_mat ON COALESCE(segmentleg_mat.startpoint, segmentleg_mat.endpoint) = seg.id
             LEFT JOIN timeslice t on nav.idtimeslice = t.idtimeslice
             Left JOIN cor on nav.idtimeslice = cor.a::integer
         where nav.idtimeslice::text in (select * from cor)
--     WHERE COALESCE(nav.type::character varying, ndb.idtimeslice::text::character varying,
--                    dme.idtimeslice::text::character varying, vor.idtimeslice::text::character varying,
--                    tacan.idtimeslice::text::character varying) IS NOT NULL
group by nav.uuid, COALESCE(nav.designator, naveq.designator),
          COALESCE(nav.name, naveq.name),
                                           COALESCE(
                                                   CASE
                                                       WHEN nav.type::text ~~ '%OTHER%'::text
                                                           THEN replace(nav.type::text, 'OTHER: '::text, ''::text)::character varying
                                                       ELSE nav.type::character varying
                                                       END,
                                                   CASE
                                                       WHEN ndb.idtimeslice IS NOT NULL THEN 'NDB'::text
                                                       WHEN dme.idtimeslice IS NOT NULL THEN 'DME'::text
                                                       WHEN vor.idtimeslice IS NOT NULL THEN 'VOR'::text
                                                       WHEN tacan.idtimeslice IS NOT NULL THEN 'TACAN'::text
                                                       ELSE NULL::text
                                                       END::character varying),
                                           CASE
                                               WHEN (nav.elevation).value IS NULL THEN NULL::text
                                               ELSE concat((nav.elevation).value::text, ' ', (nav.elevation).unit)
                                               END ,

                                           round(nav.magneticvariation::numeric, 1)::text ,
                                           ndb.class,
                                           vor.zerobearingdirection,
                                           COALESCE(vor.declination, tacan.declination)::text,
                                           dme.type,
                                           concat(dd2dms(
                                                          CASE
                                                              WHEN nav.latitude::numeric < 0::numeric THEN nav.latitude::numeric * '-1'::integer::numeric
                                                              ELSE nav.latitude::numeric
                                                              END::double precision, 'lat'::character varying),
                                                  CASE
                                                      WHEN nav.latitude::numeric < 0::numeric THEN 'S'::text
                                                      ELSE 'N'::text
                                                      END,
                                                  CASE
                                                      WHEN nav.srid = 4284 THEN '*'::text
                                                      ELSE NULL::text
                                                      END) ,
                                           concat(dd2dms(
                                                          CASE
                                                              WHEN nav.longitude::numeric < 0::numeric THEN nav.longitude::numeric * '-1'::integer::numeric
                                                              ELSE nav.longitude::numeric
                                                              END::double precision, 'lon'::character varying),
                                                  CASE
                                                      WHEN nav.longitude::numeric < 0::numeric THEN 'W'::text
                                                      ELSE 'E'::text
                                                      END,
                                                  CASE
                                                      WHEN nav.srid = 4284 THEN '*'::text
                                                      ELSE NULL::text
                                                      END) ,
                                           CASE
                                               WHEN nav.srid = 4284 THEN 'PUK'::text
                                               WHEN nav.srid = 4326 THEN 'WGE'::text
                                               WHEN nav.srid = 7677 THEN 'RPE'::text
                                               WHEN nav.srid = 7679 THEN 'RP1'::text
                                               WHEN nav.srid = 4200 THEN 'S95'::text
                                               WHEN nav.srid = 4269 THEN 'NAR'::text
                                               WHEN nav.srid = 4230 THEN 'EUR'::text
                                               WHEN nav.srid = 4618 THEN 'SAN'::text
                                               WHEN nav.srid = 4740 THEN 'PZ9'::text
                                               WHEN nav.srid = 4205 THEN 'AFG'::text
                                               WHEN nav.srid = 4222 THEN 'CAP'::text
                                               WHEN nav.srid = 6672 THEN 'CHI'::text
                                               WHEN nav.srid = 4668 THEN 'EUS'::text
                                               WHEN nav.srid = 4121 THEN 'GRS'::text
                                               WHEN nav.srid = 6714 THEN 'IGN'::text
                                               WHEN nav.srid = 4240 THEN 'INH'::text
                                               WHEN nav.srid = 4245 THEN 'KEA'::text
                                               WHEN nav.srid = 4263 THEN 'MIN'::text
                                               WHEN nav.srid = 4267 THEN 'NAS'::text
                                               WHEN nav.srid = 5498 THEN 'NAW'::text
                                               WHEN nav.srid = 4277 THEN 'OGB'::text
                                               WHEN nav.srid = 4248 THEN 'PRP'::text
                                               WHEN nav.srid = 4139 THEN 'PUR'::text
                                               WHEN nav.srid = 4287 THEN 'QUO'::text
                                               WHEN nav.srid = 4806 THEN 'ROM'::text
                                               WHEN nav.srid = 4618 THEN 'SAD'::text
                                               WHEN nav.srid = 4730 THEN 'SAE'::text
                                               WHEN nav.srid = 4700 THEN 'SHB'::text
                                               WHEN nav.srid = 4284 THEN 'SPK'::text
                                               WHEN nav.srid = 4814 THEN 'STO'::text
                                               WHEN nav.srid = 4301 THEN 'TOK'::text
                                   WHEN nav.srid = 4733 THEN 'WAK'::text
                                   WHEN nav.srid = 4322 THEN 'WGC'::text
                                   ELSE 'Unknown'::text
                                   END,
                               nav.uuidarphlp,
                               a.name,
                               t.validtimebegin,
                               t.validtimeend,
                               t.correctionnumber,
                               nav.geom,
                               nav.idsignificantpoint
)
SELECT main_sel.identifier,
       main_sel.designator,
       main_sel.name,
       main_sel.type,
       main_sel.elevation,
       main_sel.frequency,
       main_sel.magneticvariation,
       main_sel.classndb,
       main_sel.zerobearingdirection,
       main_sel.declination,
       main_sel.typedme,
       main_sel.latitude,
       main_sel.longitude,
       main_sel.srid,
       main_sel.uuidairportheliport,
       main_sel.nameairportheliport,
       main_sel.beginposition,
       main_sel.endposition,
       --main_sel.correctionnumber,
       main_sel.geom,
       main_sel.idsignificantpoint
FROM main_sel
GROUP BY main_sel.identifier, main_sel.designator, main_sel.name, main_sel.type, main_sel.elevation, main_sel.frequency,
         main_sel.magneticvariation, main_sel.classndb, main_sel.zerobearingdirection, main_sel.declination,
         main_sel.typedme, main_sel.latitude, main_sel.longitude, main_sel.srid, main_sel.uuidairportheliport,
         main_sel.nameairportheliport,
         main_sel.beginposition, main_sel.endposition, main_sel.geom,
         main_sel.idsignificantpoint;

create index navaid_indx
    on navaid_mat (identifier);


---------
----------------designatedpoint_mat_procedure   (здесь только точки des, которые на процедурах, без трассовых )----from segmentpoint_mat--
-----startend для связи с segleg---
---name is not null - чтобы избежать дублей из  segmentpoint_mat (костыль)
create materialized view designatedpoint_mat_procedure as
select
identifier,
designator,
type,
idsignificantpoint,
tp2,
tp1,
name,
uuidairportheliport,
nameairportheliport,
latitude,
longitude,
srid,
he,
beginposition,
endposition,
geom,
concat(speedlimit, ' ',speed_uom) as speedlimit,
speedreference,
duration,
distance,
distancetype,
distancepointchoice,
geom_nav_distance,
type_dist_nav,
distance_navaid,
angle,
angletype,
anglepointchoice,
geom_nav_angle,
type_angle_nav,
angle_navaid,
procedureturnrequired,
lowerlimit,
lowerlimitreference,
upperlimit,
upperlimitreference,
altitudeinterpretation,
rnav,
transitionid,
procedure,
nameprocedure,
segmentpoint_mat.segleg_uuid as related_segmentleg,
flyover,
role,
startend
from segmentpoint_mat
where dp_idsign is not null and name is not null
GROUP BY
identifier,
designator,
type,
idsignificantpoint,
tp2,
tp1,
name,
uuidairportheliport,
nameairportheliport,
latitude,
longitude,
srid,
he,
beginposition,
endposition,
geom,
concat(speedlimit, ' ',speed_uom),
speedreference,
duration,
distance,
distancetype,
distancepointchoice,
geom_nav_distance,
type_dist_nav,
distance_navaid,
angle,
angletype,
anglepointchoice,
geom_nav_angle,
type_angle_nav,
angle_navaid,
procedureturnrequired,
lowerlimit,
lowerlimitreference,
upperlimit,
upperlimitreference,
altitudeinterpretation,
rnav,
transitionid,
procedure,
nameprocedure,
segmentpoint_mat.segleg_uuid,
flyover,
role,
startend;
-------

create materialized view designatedpoint_mat as
WITH cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM designatedpointtimeslice dp_1
             LEFT JOIN designatedpoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
),
     seg_proc AS (
         SELECT segleg.identifier,
                segleg.speedlimit,
                segleg.speed_uom,
                segleg.speedreference,
                segleg.duration,
                segleg.distance,
                segleg.distancetype,
                segleg.distancepointchoice,
                segleg.geom_nav_distance,
                segleg.type_dist_nav,
                segleg.distance_navaid,
                segleg.angle,
                segleg.angletype,
                segleg.anglepointchoice,
                segleg.geom_nav_angle,
                segleg.type_angle_nav,
                segleg.angle_navaid,
                segleg.procedureturnrequired,
                segleg.lowerlimit,
                segleg.lowerlimitreference,
                segleg.upperlimit,
                segleg.upperlimitreference,
                segleg.altitudeinterpretation,
                segleg.startend,
                segleg.startpoint,
                segleg.endpoint,
                segleg.uuidairportheliport,
                segleg.nameairportheliport,
                proc.rnav,
                proc.transitionid,
                proc.procedure,
                proc.name AS nameprocedure
         FROM segmentleg_mat segleg
                  LEFT JOIN procedure_mat proc
                            ON proc.identifier::uuid = segleg.uuidprocedure::uuid AND segleg.startend IS NOT NULL
         GROUP BY segleg.identifier, segleg.speedlimit, segleg.speed_uom, segleg.speedreference, segleg.duration,
                  segleg.distance, segleg.distancetype, segleg.distancepointchoice, segleg.geom_nav_distance,
                  segleg.type_dist_nav, segleg.distance_navaid, segleg.angle, segleg.angletype, segleg.anglepointchoice,
                  segleg.geom_nav_angle, segleg.type_angle_nav, segleg.angle_navaid, segleg.procedureturnrequired,
                  segleg.lowerlimit, segleg.lowerlimitreference, segleg.upperlimit, segleg.upperlimitreference,
                  segleg.altitudeinterpretation, segleg.startend, segleg.startpoint, segleg.endpoint,
                  segleg.uuidairportheliport, segleg.nameairportheliport, proc.rnav, proc.transitionid, proc.procedure,
                  proc.name
     )
SELECT dp.uuid                                                                                AS identifier,
       dp.designator,
       dp.type,
       dp.idsignificantpoint,
       CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text and dp.type ~~ 'ICAO'  THEN 'airway'::text
           ELSE NULL::text
           END                                                                                AS tp2,
       CASE
           WHEN seg.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
           WHEN seg.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
           ELSE NULL::text
           END                                                                                AS tp1,
       CASE
           WHEN dp.name IS NOT NULL THEN dp.name
           ELSE NULL::character varying::textnametype
           END                                                                                AS name,
       COALESCE(dp.uuidarphlp, seg_proc.uuidairportheliport)                                  AS uuidairportheliport,
       COALESCE(seg_proc.nameairportheliport::character varying, arp.name::character varying) AS nameairportheliport,
       concat(dd2dms(
                      CASE
                          WHEN dp.latitude::numeric < 0::numeric THEN dp.latitude::numeric * '-1'::integer::numeric
                          ELSE dp.latitude::numeric
                          END::double precision, 'lat'::character varying),
              CASE
                  WHEN dp.latitude::numeric < 0::numeric THEN 'S'::text
                  ELSE 'N'::text
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)                                                                        AS latitude,
       concat(dd2dms(
                      CASE
                          WHEN dp.longitude::numeric < 0::numeric THEN dp.longitude::numeric * '-1'::integer::numeric
                          ELSE dp.longitude::numeric
                          END::double precision, 'lon'::character varying),
              CASE
                  WHEN dp.longitude::numeric < 0::numeric THEN 'W'::text
                  ELSE 'E'::text
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)                                                                        AS longitude,
       CASE
           WHEN dp.srid = 4284 THEN 'PUK'::text
           WHEN dp.srid = 4326 THEN 'WGE'::text
           WHEN dp.srid = 7677 THEN 'RPE'::text
           WHEN dp.srid = 7679 THEN 'RP1'::text
           WHEN dp.srid = 4200 THEN 'S95'::text
           WHEN dp.srid = 4269 THEN 'NAR'::text
           WHEN dp.srid = 4230 THEN 'EUR'::text
           WHEN dp.srid = 4618 THEN 'SAN'::text
           WHEN dp.srid = 4740 THEN 'PZ9'::text
           WHEN dp.srid = 4205 THEN 'AFG'::text
           WHEN dp.srid = 4222 THEN 'CAP'::text
           WHEN dp.srid = 6672 THEN 'CHI'::text
           WHEN dp.srid = 4668 THEN 'EUS'::text
           WHEN dp.srid = 4121 THEN 'GRS'::text
           WHEN dp.srid = 6714 THEN 'IGN'::text
           WHEN dp.srid = 4240 THEN 'INH'::text
           WHEN dp.srid = 4245 THEN 'KEA'::text
           WHEN dp.srid = 4263 THEN 'MIN'::text
           WHEN dp.srid = 4267 THEN 'NAS'::text
           WHEN dp.srid = 5498 THEN 'NAW'::text
           WHEN dp.srid = 4277 THEN 'OGB'::text
           WHEN dp.srid = 4248 THEN 'PRP'::text
           WHEN dp.srid = 4139 THEN 'PUR'::text
           WHEN dp.srid = 4287 THEN 'QUO'::text
           WHEN dp.srid = 4806 THEN 'ROM'::text
           WHEN dp.srid = 4618 THEN 'SAD'::text
           WHEN dp.srid = 4730 THEN 'SAE'::text
           WHEN dp.srid = 4700 THEN 'SHB'::text
           WHEN dp.srid = 4284 THEN 'SPK'::text
           WHEN dp.srid = 4814 THEN 'STO'::text
           WHEN dp.srid = 4301 THEN 'TOK'::text
           WHEN dp.srid = 4733 THEN 'WAK'::text
           WHEN dp.srid = 4322 THEN 'WGC'::text
           ELSE 'Unknown'::text
           END                                                                                AS srid,
       CASE
           WHEN seg_proc.lowerlimit IS NOT NULL OR seg_proc.upperlimit IS NOT NULL OR
                seg_proc.altitudeinterpretation IS NOT NULL THEN concat(seg_proc.lowerlimit,
                                                                        CASE
                                                                            WHEN seg_proc.upperlimit IS NOT NULL AND seg_proc.lowerlimit IS NOT NULL
                                                                                THEN '-'::text
                                                                            ELSE NULL::text
                                                                            END, seg_proc.upperlimit,
                                                                        CASE
                                                                            WHEN seg_proc.upperlimit IS NOT NULL OR seg_proc.lowerlimit IS NOT NULL
                                                                                THEN ' '::text
                                                                            ELSE NULL::text
                                                                            END, seg_proc.altitudeinterpretation)
           ELSE NULL::text
           END                                                                                AS he,
       t.validtimebegin                                                                       AS beginposition,
       t.validtimeend                                                                         AS endposition,
       dp.geom,
       CASE
           WHEN seg_proc.speed_uom IS NOT NULL THEN concat(seg_proc.speedlimit, ' ', seg_proc.speed_uom)
           ELSE NULL::text
           END                                                                                AS speedlimit,
       seg_proc.speedreference,
       seg_proc.duration,
       seg_proc.distance,
       seg_proc.distancetype,
       seg_proc.distancepointchoice,
       seg_proc.geom_nav_distance,
       seg_proc.type_dist_nav,
       seg_proc.distance_navaid,
       seg_proc.angle,
       seg_proc.angletype,
       seg_proc.anglepointchoice,
       seg_proc.geom_nav_angle,
       seg_proc.type_angle_nav,
       seg_proc.angle_navaid,
       seg_proc.procedureturnrequired,
       seg_proc.lowerlimit,
       seg_proc.lowerlimitreference,
       seg_proc.upperlimit,
       seg_proc.upperlimitreference,
       seg_proc.altitudeinterpretation,
       seg_proc.rnav,
       seg_proc.transitionid,
       seg_proc.procedure,
       seg_proc.nameprocedure,
       seg_proc.identifier                                                                    AS related_segmentleg,
       seg.flyover,
       seg.role
FROM designatedpointtimeslice dp
         LEFT JOIN designatedpoint d ON d.uuid::uuid = dp.uuid::uuid
         LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         JOIN cor ON cor.a::integer = dp.idtimeslice
         LEFT JOIN airportheliport_mat arp ON arp.identifier::uuid = dp.uuidarphlp::uuid
         LEFT JOIN segmentpoint seg ON seg.idsignificantpoint = dp.idsignificantpoint
         LEFT JOIN seg_proc ON seg_proc.startend = seg.id

WHERE (dp.idtimeslice::text IN (SELECT cor_1.a
                                FROM cor cor_1))
    --- and nameairportheliport = 'MAKHACHKALA/UYTASH' and rnav = 'NO' and procedure = 'SID' and nameprocedure = 'DUBKI 1L'
   -- and dp.designator = 'DUBKI'
GROUP BY dp.uuid, dp.designator, dp.type, dp.idsignificantpoint, dp.name,
         (
             CASE
                 WHEN seg.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
                 WHEN seg.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
                 ELSE NULL::text
                 END),
         (
        CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text and dp.type ~~ 'ICAO'  THEN 'airway'::text
           ELSE NULL::text
           END  ),
         (
             CASE
                 WHEN dp.name IS NOT NULL THEN dp.name::text
                 ELSE NULL::text
                 END), seg_proc.uuidairportheliport, seg_proc.nameairportheliport, dp.longitude, dp.latitude, dp.srid,
         t.validtimebegin, t.validtimeend, t.correctionnumber, dp.geom, dp.uuidarphlp,
         (
             CASE
                 WHEN seg_proc.speed_uom IS NOT NULL THEN concat(seg_proc.speedlimit, ' ', seg_proc.speed_uom)
                 ELSE NULL::text
                 END), seg_proc.speedreference, seg_proc.duration, seg_proc.distance, seg_proc.distancetype,
         seg_proc.distancepointchoice, seg_proc.geom_nav_angle, seg_proc.type_angle_nav, seg_proc.angle_navaid,
         seg_proc.geom_nav_distance, seg_proc.type_dist_nav, seg_proc.distance_navaid, seg_proc.angle,
         seg_proc.angletype, seg_proc.anglepointchoice, seg_proc.procedureturnrequired, seg_proc.lowerlimitreference,
         seg_proc.lowerlimit, seg_proc.upperlimit, seg_proc.upperlimitreference, seg_proc.rnav, seg_proc.transitionid,
         seg_proc.procedure, seg_proc.nameprocedure, seg_proc.identifier, seg.flyover, seg.role, t.idtimeslice,
         seg_proc.altitudeinterpretation, arp.name,
         (
             CASE
                 WHEN seg_proc.lowerlimit IS NOT NULL OR seg_proc.upperlimit IS NOT NULL OR
                      seg_proc.altitudeinterpretation IS NOT NULL THEN concat(seg_proc.lowerlimit,
                                                                              CASE
                                                                                  WHEN seg_proc.upperlimit IS NOT NULL AND seg_proc.lowerlimit IS NOT NULL
                                                                                      THEN '-'::text
                                                                                  ELSE NULL::text
                                                                                  END, seg_proc.upperlimit,
                                                                              CASE
                                                                                  WHEN seg_proc.upperlimit IS NOT NULL OR seg_proc.lowerlimit IS NOT NULL
                                                                                      THEN ' '::text
                                                                                  ELSE NULL::text
                                                                                  END, seg_proc.altitudeinterpretation)
                 ELSE NULL::text
                 END);


create index dsgn_indx_test
    on designatedpoint_mat (identifier);

create index dsgn_designator_indx_test
    on designatedpoint_mat (designator);

create index dsgnarp_indx_test
    on designatedpoint_mat (uuidairportheliport);



----------вместо controlledangleind_mat используется segmentpoint_mat
/*create materialized view controlledangleind_mat as
WITH cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM designatedpointtimeslice dp_1
             LEFT JOIN designatedpoint d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
),
     seg_proc AS (
         SELECT segleg.identifier,
                segleg.speedlimit,
                segleg.speed_uom,
                segleg.speedreference,
                segleg.duration,

                segleg.procedureturnrequired,
                segleg.lowerlimit,
                segleg.lowerlimitreference,
                segleg.upperlimit,
                segleg.upperlimitreference,
                segleg.altitudeinterpretation,
                segleg.startend,
                segleg.startpoint,
                segleg.endpoint,
                segleg.uuidairportheliport,
                segleg.nameairportheliport,
                proc.rnav,
                proc.transitionid,
                proc.procedure,
                proc.name AS nameprocedure
         FROM segmentleg_mat segleg
                  LEFT JOIN procedure_mat proc
                            ON proc.identifier::uuid = segleg.uuidprocedure::uuid AND segleg.startend IS NOT NULL
         GROUP BY segleg.identifier, segleg.speedlimit, segleg.speed_uom, segleg.speedreference, segleg.duration,
                  segleg.distance, segleg.distancetype, segleg.distancepointchoice, segleg.geom_nav_distance,
                  segleg.type_dist_nav, segleg.distance_navaid, segleg.angle, segleg.angletype, segleg.anglepointchoice,
                  segleg.geom_nav_angle, segleg.type_angle_nav, segleg.angle_navaid, segleg.procedureturnrequired,
                  segleg.lowerlimit, segleg.lowerlimitreference, segleg.upperlimit, segleg.upperlimitreference,
                  segleg.altitudeinterpretation, segleg.startend, segleg.startpoint, segleg.endpoint,
                  segleg.uuidairportheliport, segleg.nameairportheliport, proc.rnav, proc.transitionid, proc.procedure,
                  proc.name
     )
SELECT dp.uuid                                                                                AS identifier,
       dp.designator,
       dp.type,
       dp.idsignificantpoint,
       CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text and dp.type ~~ 'ICAO'  THEN 'airway'::text
           ELSE NULL::text
           END                                                                                AS tp2,
       CASE
           WHEN seg.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
           WHEN seg.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
           ELSE NULL::text
           END                                                                                AS tp1,
       CASE
           WHEN dp.name IS NOT NULL THEN dp.name
           ELSE NULL::character varying::textnametype
           END                                                                                AS name,
       COALESCE(dp.uuidarphlp, seg_proc.uuidairportheliport)                                  AS uuidairportheliport,
       COALESCE(seg_proc.nameairportheliport::character varying, arp.name::character varying) AS nameairportheliport,
       concat(dd2dms(
                      CASE
                          WHEN dp.latitude::numeric < 0::numeric THEN dp.latitude::numeric * '-1'::integer::numeric
                          ELSE dp.latitude::numeric
                          END::double precision, 'lat'::character varying),
              CASE
                  WHEN dp.latitude::numeric < 0::numeric THEN 'S'::text
                  ELSE 'N'::text
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)                                                                        AS latitude,
       concat(dd2dms(
                      CASE
                          WHEN dp.longitude::numeric < 0::numeric THEN dp.longitude::numeric * '-1'::integer::numeric
                          ELSE dp.longitude::numeric
                          END::double precision, 'lon'::character varying),
              CASE
                  WHEN dp.longitude::numeric < 0::numeric THEN 'W'::text
                  ELSE 'E'::text
                  END,
              CASE
                  WHEN dp.srid = 4284 THEN '*'::text
                  ELSE NULL::text
                  END)                                                                        AS longitude,
       CASE
           WHEN dp.srid = 4284 THEN 'PUK'::text
           WHEN dp.srid = 4326 THEN 'WGE'::text
           WHEN dp.srid = 7677 THEN 'RPE'::text
           WHEN dp.srid = 7679 THEN 'RP1'::text
           WHEN dp.srid = 4200 THEN 'S95'::text
           WHEN dp.srid = 4269 THEN 'NAR'::text
           WHEN dp.srid = 4230 THEN 'EUR'::text
           WHEN dp.srid = 4618 THEN 'SAN'::text
           WHEN dp.srid = 4740 THEN 'PZ9'::text
           WHEN dp.srid = 4205 THEN 'AFG'::text
           WHEN dp.srid = 4222 THEN 'CAP'::text
           WHEN dp.srid = 6672 THEN 'CHI'::text
           WHEN dp.srid = 4668 THEN 'EUS'::text
           WHEN dp.srid = 4121 THEN 'GRS'::text
           WHEN dp.srid = 6714 THEN 'IGN'::text
           WHEN dp.srid = 4240 THEN 'INH'::text
           WHEN dp.srid = 4245 THEN 'KEA'::text
           WHEN dp.srid = 4263 THEN 'MIN'::text
           WHEN dp.srid = 4267 THEN 'NAS'::text
           WHEN dp.srid = 5498 THEN 'NAW'::text
           WHEN dp.srid = 4277 THEN 'OGB'::text
           WHEN dp.srid = 4248 THEN 'PRP'::text
           WHEN dp.srid = 4139 THEN 'PUR'::text
           WHEN dp.srid = 4287 THEN 'QUO'::text
           WHEN dp.srid = 4806 THEN 'ROM'::text
           WHEN dp.srid = 4618 THEN 'SAD'::text
           WHEN dp.srid = 4730 THEN 'SAE'::text
           WHEN dp.srid = 4700 THEN 'SHB'::text
           WHEN dp.srid = 4284 THEN 'SPK'::text
           WHEN dp.srid = 4814 THEN 'STO'::text
           WHEN dp.srid = 4301 THEN 'TOK'::text
           WHEN dp.srid = 4733 THEN 'WAK'::text
           WHEN dp.srid = 4322 THEN 'WGC'::text
           ELSE 'Unknown'::text
           END                                                                                AS srid,
       CASE
           WHEN seg_proc.lowerlimit IS NOT NULL OR seg_proc.upperlimit IS NOT NULL OR
                seg_proc.altitudeinterpretation IS NOT NULL THEN concat(seg_proc.lowerlimit,
                                                                        CASE
                                                                            WHEN seg_proc.upperlimit IS NOT NULL AND seg_proc.lowerlimit IS NOT NULL
                                                                                THEN '-'::text
                                                                            ELSE NULL::text
                                                                            END, seg_proc.upperlimit,
                                                                        CASE
                                                                            WHEN seg_proc.upperlimit IS NOT NULL OR seg_proc.lowerlimit IS NOT NULL
                                                                                THEN ' '::text
                                                                            ELSE NULL::text
                                                                            END, seg_proc.altitudeinterpretation)
           ELSE NULL::text
           END                                                                                AS he,
       t.validtimebegin                                                                       AS beginposition,
       t.validtimeend                                                                         AS endposition,
       dp.geom,
       CASE
           WHEN seg_proc.speed_uom IS NOT NULL THEN concat(seg_proc.speedlimit, ' ', seg_proc.speed_uom)
           ELSE NULL::text
           END                                                                                AS speedlimit,
       seg_proc.speedreference,
       seg_proc.duration,


           CASE
        WHEN (d2.distance).value IS NOT NULL AND (d2.distance).unit IS NOT NULL THEN concat(
                round((d2.distance).value::numeric, 1), ' ', (d2.distance).unit)
        ELSE NULL::text
        END                                                                                AS distance,
        (d2.type).value                                                                    AS distancetype,
        d2.idsignificantpoint                                                              AS distancepointchoice,
        st_astext(nav_dist.geom)                                                             AS geom_nav_distance,
        nav_dist.type                                                                        AS type_dist_nav,
        nav_dist.designator                                                                  AS distance_navaid,
        a2.angle,
        (a2.angletype).value                                                          AS angletype,
        a2.idsignificantpoint                                                         AS anglepointchoice,
       st_astext(nav_angle.geom)                                                            AS geom_nav_angle,
       nav_angle.type                                                                       AS type_angle_nav,
       nav_angle.designator                                                                 AS angle_navaid,

       seg_proc.procedureturnrequired,
       seg_proc.lowerlimit,
       seg_proc.lowerlimitreference,
       seg_proc.upperlimit,
       seg_proc.upperlimitreference,
       seg_proc.altitudeinterpretation,
       seg_proc.rnav,
       seg_proc.transitionid,
       seg_proc.procedure,
       seg_proc.nameprocedure,
       seg_proc.identifier                                                                    AS related_segmentleg,
       (seg.flyover).value as flyover,
     replace( replace(seg.role::text, '(,',''), ')','') as role

FROM designatedpointtimeslice dp
         LEFT JOIN designatedpoint d ON d.uuid::uuid = dp.uuid::uuid
         LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         LEFT JOIN cor ON cor.a::integer = dp.idtimeslice
         LEFT JOIN airportheliport_mat arp ON arp.identifier::uuid = dp.uuidarphlp::uuid
         LEFT JOIN segmentpoint seg ON seg.id = dp.idsignificantpoint
         LEFT JOIN seg_proc ON seg_proc.startend = seg.id
         left join pointreference p on seg.id = p.idsegmentpoint
         left join distanceindicationtimeslice d2 on p.uuiddistind = d2.uuid
         left join angleindicationtimeslice a2 on p.uuidanglind = a2.uuid
         LEFT JOIN navaidtimeslice nav_dist ON d2.pointchoice_uuid = nav_dist.uuid
         LEFT JOIN navaidtimeslice nav_angle ON nav_angle.uuid = a2.pointchoice_uuid
WHERE (dp.idtimeslice::text IN (SELECT cor_1.a
                                FROM cor cor_1))

GROUP BY dp.uuid, dp.designator, dp.type, dp.idsignificantpoint, dp.name,
         (
             CASE
                 WHEN seg.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
                 WHEN seg.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
                 ELSE NULL::text
                 END),
         (
        CASE
           WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
           WHEN d._transasid::text !~~* 'TPM%'::text and dp.type ~~ 'ICAO'  THEN 'airway'::text
           ELSE NULL::text
           END  ),
         (
             CASE
                 WHEN dp.name IS NOT NULL THEN dp.name::text
                 ELSE NULL::text
                 END), seg_proc.uuidairportheliport, seg_proc.nameairportheliport, dp.longitude, dp.latitude, dp.srid,
         t.validtimebegin, t.validtimeend, t.correctionnumber, dp.geom, dp.uuidarphlp,
         (
             CASE
                 WHEN seg_proc.speed_uom IS NOT NULL THEN concat(seg_proc.speedlimit, ' ', seg_proc.speed_uom)
                 ELSE NULL::text
                  END), seg_proc.speedreference, seg_proc.duration,


          CASE
        WHEN (d2.distance).value IS NOT NULL AND (d2.distance).unit IS NOT NULL THEN concat(
                round((d2.distance).value::numeric, 1), ' ', (d2.distance).unit)
        ELSE NULL::text
        END  ,

          (d2.type).value,
        d2.idsignificantpoint,
        st_astext(nav_dist.geom),
       nav_dist.type,
       nav_dist.designator,
        a2.angle,
        (a2.angletype).value,
        a2.idsignificantpoint,
       st_astext(nav_angle.geom),
       nav_angle.type,
       nav_angle.designator,
         seg_proc.procedureturnrequired, seg_proc.lowerlimitreference,
         seg_proc.lowerlimit, seg_proc.upperlimit, seg_proc.upperlimitreference, seg_proc.rnav, seg_proc.transitionid,
         seg_proc.procedure, seg_proc.nameprocedure, seg_proc.identifier, (seg.flyover).value, replace( replace(seg.role::text, '(,',''), ')',''), t.idtimeslice,
         seg_proc.altitudeinterpretation, arp.name,
         (
             CASE
                 WHEN seg_proc.lowerlimit IS NOT NULL OR seg_proc.upperlimit IS NOT NULL OR
                      seg_proc.altitudeinterpretation IS NOT NULL THEN concat(seg_proc.lowerlimit,
                                                                              CASE
                                                                                  WHEN seg_proc.upperlimit IS NOT NULL AND seg_proc.lowerlimit IS NOT NULL
                                                                                      THEN '-'::text
                                                                                  ELSE NULL::text
                                                                                  END, seg_proc.upperlimit,
                                                                              CASE
                                                                                  WHEN seg_proc.upperlimit IS NOT NULL OR seg_proc.lowerlimit IS NOT NULL
                                                                                      THEN ' '::text
                                                                                  ELSE NULL::text
                                                                                  END, seg_proc.altitudeinterpretation)
                 ELSE NULL::text
                 END);


create index dsgn_indx
    on controlledangleind_mat (identifier);


create index dsgn_designator_indx
    on controlledangleind_mat (designator);
*/

---------------------



/*create materialized view controlledangleind_navaid_mat as
WITH cor AS (
    SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                      1) AS a
    FROM navaidtimeslice dp_1
             LEFT JOIN navaid d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
             LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
    WHERE t_1.validtimeend IS NULL
    GROUP BY d_1.uuid
),
     angleindication_actual AS (
         SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM angleindicationtimeslice dp_1
                  LEFT JOIN angleindication d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d_1.uuid
     ),
     distanceindication_actual AS (
         SELECT split_part(string_agg(dp_1.idtimeslice::text, ','::text ORDER BY t_1.correctionnumber DESC), ','::text,
                           1) AS a
         FROM distanceindicationtimeslice dp_1
                  LEFT JOIN distanceindication d_1 ON d_1.uuid::uuid = dp_1.uuid::uuid
                  LEFT JOIN timeslice t_1 ON t_1.idtimeslice = dp_1.idtimeslice
         WHERE t_1.validtimeend IS NULL
         GROUP BY d_1.uuid
     ),
     seg_proc AS (
         SELECT segleg.identifier,
                segleg.speedlimit,
                segleg.speed_uom,
                segleg.speedreference,
                segleg.duration,
                segleg.procedureturnrequired,
                segleg.lowerlimit,
                segleg.lowerlimitreference,
                segleg.upperlimit,
                segleg.upperlimitreference,
                segleg.altitudeinterpretation,
                segleg.startend,
                segleg.startpoint,
                segleg.endpoint,
                segleg.uuidairportheliport,
                segleg.nameairportheliport,
                proc.rnav,
                proc.transitionid,
                proc.procedure,
                proc.name AS nameprocedure
         FROM segmentleg_mat segleg
                  LEFT JOIN procedure_mat proc
                            ON proc.identifier::uuid = segleg.uuidprocedure::uuid AND segleg.startend IS NOT NULL
         GROUP BY segleg.identifier, segleg.speedlimit, segleg.speed_uom, segleg.speedreference, segleg.duration,
                  segleg.distance, segleg.distancetype, segleg.distancepointchoice, segleg.geom_nav_distance,
                  segleg.type_dist_nav, segleg.distance_navaid, segleg.angle, segleg.angletype, segleg.anglepointchoice,
                  segleg.geom_nav_angle, segleg.type_angle_nav, segleg.angle_navaid, segleg.procedureturnrequired,
                  segleg.lowerlimit, segleg.lowerlimitreference, segleg.upperlimit, segleg.upperlimitreference,
                  segleg.altitudeinterpretation, segleg.startend, segleg.startpoint, segleg.endpoint,
                  segleg.uuidairportheliport, segleg.nameairportheliport, proc.rnav, proc.transitionid, proc.procedure,
                  proc.name
     )
SELECT DISTINCT dp.uuid                                                                                AS identifier,
                dp.designator,
                dp.type,
                dp.idsignificantpoint,
                CASE
                    WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
                    WHEN d._transasid::text !~~* 'TPM%'::text AND dp.type::text ~~ 'ICAO'::text THEN 'airway'::text
                    ELSE NULL::text
                    END                                                                                AS tp2,
                CASE
                    WHEN seg.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
                    WHEN seg.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
                    ELSE NULL::text
                    END                                                                                AS tp1,
                CASE
                    WHEN dp.name IS NOT NULL THEN dp.name
                    ELSE NULL::character varying::textnametype
                    END                                                                                AS name,
                COALESCE(dp.uuidarphlp, seg_proc.uuidairportheliport)                                  AS uuidairportheliport,
                COALESCE(seg_proc.nameairportheliport::character varying,
                         arp.name::character varying)                                                  AS nameairportheliport,
                concat(dd2dms(
                               CASE
                                   WHEN dp.latitude::numeric < 0::numeric THEN dp.latitude::numeric * '-1'::integer::numeric
                                   ELSE dp.latitude::numeric
                                   END::double precision, 'lat'::character varying),
                       CASE
                           WHEN dp.latitude::numeric < 0::numeric THEN 'S'::text
                           ELSE 'N'::text
                           END,
                       CASE
                           WHEN dp.srid = 4284 THEN '*'::text
                           ELSE NULL::text
                           END)                                                                        AS latitude,
                concat(dd2dms(
                               CASE
                                   WHEN dp.longitude::numeric < 0::numeric THEN dp.longitude::numeric * '-1'::integer::numeric
                                   ELSE dp.longitude::numeric
                                   END::double precision, 'lon'::character varying),
                       CASE
                           WHEN dp.longitude::numeric < 0::numeric THEN 'W'::text
                           ELSE 'E'::text
                           END,
                       CASE
                           WHEN dp.srid = 4284 THEN '*'::text
                           ELSE NULL::text
                           END)                                                                        AS longitude,
                CASE
                    WHEN dp.srid = 4284 THEN 'PUK'::text
                    WHEN dp.srid = 4326 THEN 'WGE'::text
                    WHEN dp.srid = 7677 THEN 'RPE'::text
                    WHEN dp.srid = 7679 THEN 'RP1'::text
                    WHEN dp.srid = 4200 THEN 'S95'::text
                    WHEN dp.srid = 4269 THEN 'NAR'::text
                    WHEN dp.srid = 4230 THEN 'EUR'::text
                    WHEN dp.srid = 4618 THEN 'SAN'::text
                    WHEN dp.srid = 4740 THEN 'PZ9'::text
                    WHEN dp.srid = 4205 THEN 'AFG'::text
                    WHEN dp.srid = 4222 THEN 'CAP'::text
                    WHEN dp.srid = 6672 THEN 'CHI'::text
                    WHEN dp.srid = 4668 THEN 'EUS'::text
                    WHEN dp.srid = 4121 THEN 'GRS'::text
                    WHEN dp.srid = 6714 THEN 'IGN'::text
                    WHEN dp.srid = 4240 THEN 'INH'::text
                    WHEN dp.srid = 4245 THEN 'KEA'::text
                    WHEN dp.srid = 4263 THEN 'MIN'::text
                    WHEN dp.srid = 4267 THEN 'NAS'::text
                    WHEN dp.srid = 5498 THEN 'NAW'::text
                    WHEN dp.srid = 4277 THEN 'OGB'::text
                    WHEN dp.srid = 4248 THEN 'PRP'::text
                    WHEN dp.srid = 4139 THEN 'PUR'::text
                    WHEN dp.srid = 4287 THEN 'QUO'::text
                    WHEN dp.srid = 4806 THEN 'ROM'::text
                    WHEN dp.srid = 4618 THEN 'SAD'::text
                    WHEN dp.srid = 4730 THEN 'SAE'::text
                    WHEN dp.srid = 4700 THEN 'SHB'::text
                    WHEN dp.srid = 4284 THEN 'SPK'::text
                    WHEN dp.srid = 4814 THEN 'STO'::text
                    WHEN dp.srid = 4301 THEN 'TOK'::text
                    WHEN dp.srid = 4733 THEN 'WAK'::text
                    WHEN dp.srid = 4322 THEN 'WGC'::text
                    ELSE 'Unknown'::text
                    END                                                                                AS srid,
                CASE
                    WHEN seg_proc.lowerlimit IS NOT NULL OR seg_proc.upperlimit IS NOT NULL OR
                         seg_proc.altitudeinterpretation IS NOT NULL THEN concat(seg_proc.lowerlimit,
                                                                                 CASE
                                                                                     WHEN seg_proc.upperlimit IS NOT NULL AND seg_proc.lowerlimit IS NOT NULL
                                                                                         THEN '-'::text
                                                                                     ELSE NULL::text
                                                                                     END, seg_proc.upperlimit,
                                                                                 CASE
                                                                                     WHEN seg_proc.upperlimit IS NOT NULL OR seg_proc.lowerlimit IS NOT NULL
                                                                                         THEN ' '::text
                                                                                     ELSE NULL::text
                                                                                     END,
                                                                                 seg_proc.altitudeinterpretation)
                    ELSE NULL::text
                    END                                                                                AS he,
                t.validtimebegin                                                                       AS beginposition,
                t.validtimeend                                                                         AS endposition,
                dp.geom,
                CASE
                    WHEN seg_proc.speed_uom IS NOT NULL THEN concat(seg_proc.speedlimit, ' ', seg_proc.speed_uom)
                    ELSE NULL::text
                    END                                                                                AS speedlimit,
                seg_proc.speedreference,
                seg_proc.duration,
                CASE
                    WHEN (d2.distance).value IS NOT NULL AND (d2.distance).unit IS NOT NULL THEN concat(
                            round((d2.distance).value::numeric, 1), ' ', (d2.distance).unit)
                    ELSE NULL::text
                    END                                                                                AS distance,
                (d2.type).value                                                                        AS distancetype,
                d2.idsignificantpoint                                                                  AS distancepointchoice,
                st_astext(nav_dist.geom)                                                               AS geom_nav_distance,
                nav_dist.type                                                                          AS type_dist_nav,
                nav_dist.designator                                                                    AS distance_navaid,
                a2.angle,
                (a2.angletype).value                                                                   AS angletype,
                a2.idsignificantpoint                                                                  AS anglepointchoice,
                st_astext(nav_angle.geom)                                                              AS geom_nav_angle,
                nav_angle.type                                                                         AS type_angle_nav,
                nav_angle.designator                                                                   AS angle_navaid,
                seg_proc.procedureturnrequired,
                seg_proc.lowerlimit,
                seg_proc.lowerlimitreference,
                seg_proc.upperlimit,
                seg_proc.upperlimitreference,
                seg_proc.altitudeinterpretation,
                seg_proc.rnav,
                seg_proc.transitionid,
                seg_proc.procedure,
                seg_proc.nameprocedure,
                seg_proc.identifier                                                                    AS related_segmentleg,
                (seg.flyover).value                                                                    AS flyover,
                replace(replace(seg.role::text, '(,'::text, ''::text), ')'::text, ''::text)            AS role
FROM navaidtimeslice dp
         LEFT JOIN navaid d ON d.uuid::uuid = dp.uuid::uuid
         LEFT JOIN timeslice t ON t.idtimeslice = dp.idtimeslice
         LEFT JOIN cor ON cor.a::integer = dp.idtimeslice
         LEFT JOIN airportheliport_mat arp ON arp.identifier::uuid = dp.uuidarphlp::uuid
         LEFT JOIN segmentpoint seg ON seg.idsignificantpoint = dp.idsignificantpoint
         LEFT JOIN seg_proc ON seg_proc.startend = seg.id
         LEFT JOIN pointreference p ON seg.id = p.idsegmentpoint
         LEFT JOIN distanceindicationtimeslice d2 ON p.uuiddistind::uuid = d2.uuid::uuid AND
                                                     (d2.idtimeslice::text IN (SELECT distanceindication_actual_1.a
                                                                               FROM distanceindication_actual distanceindication_actual_1))
         LEFT JOIN angleindicationtimeslice a2 ON p.uuidanglind::uuid = a2.uuid::uuid AND
                                                  (a2.idtimeslice::text IN (SELECT angleindication_actual_1.a
                                                                            FROM angleindication_actual angleindication_actual_1))
         LEFT JOIN navaidtimeslice nav_dist ON d2.pointchoice_uuid::uuid = nav_dist.uuid::uuid
         LEFT JOIN navaidtimeslice nav_angle ON nav_angle.uuid::uuid = a2.pointchoice_uuid::uuid
WHERE (dp.idtimeslice::text IN (SELECT cor_1.a
                                FROM cor cor_1))
  AND (a2.angle IS NOT NULL OR (d2.distance).value IS NOT NULL)
GROUP BY dp.uuid, dp.designator, dp.type, dp.idsignificantpoint, dp.name,
         (
             CASE
                 WHEN seg.reportingatc::text = 'COMPULSORY'::text THEN 'ПОД'::text
                 WHEN seg.reportingatc::text = 'ON_REQUEST'::text THEN 'ПДЗ'::text
                 ELSE NULL::text
                 END),
         (
             CASE
                 WHEN d._transasid::text ~~ 'TPM%'::text THEN 'local'::text
                 WHEN d._transasid::text !~~* 'TPM%'::text AND dp.type::text ~~ 'ICAO'::text THEN 'airway'::text
                 ELSE NULL::text
                 END),
         (
             CASE
                 WHEN dp.name IS NOT NULL THEN dp.name::text
                 ELSE NULL::text
                 END), seg_proc.uuidairportheliport, seg_proc.nameairportheliport, dp.longitude, dp.latitude, dp.srid,
         t.validtimebegin, t.validtimeend, t.correctionnumber, dp.geom, dp.uuidarphlp,
         (
             CASE
                 WHEN seg_proc.speed_uom IS NOT NULL THEN concat(seg_proc.speedlimit, ' ', seg_proc.speed_uom)
                 ELSE NULL::text
                 END), seg_proc.speedreference, seg_proc.duration,
         (
             CASE
                 WHEN (d2.distance).value IS NOT NULL AND (d2.distance).unit IS NOT NULL THEN concat(
                         round((d2.distance).value::numeric, 1), ' ', (d2.distance).unit)
                 ELSE NULL::text
                 END), ((d2.type).value), d2.idsignificantpoint, (st_astext(nav_dist.geom)), nav_dist.type,
         nav_dist.designator, a2.angle, ((a2.angletype).value), a2.idsignificantpoint, (st_astext(nav_angle.geom)),
         nav_angle.type, nav_angle.designator, seg_proc.procedureturnrequired, seg_proc.lowerlimitreference,
         seg_proc.lowerlimit, seg_proc.upperlimit, seg_proc.upperlimitreference, seg_proc.rnav, seg_proc.transitionid,
         seg_proc.procedure, seg_proc.nameprocedure, seg_proc.identifier, ((seg.flyover).value),
         (replace(replace(seg.role::text, '(,'::text, ''::text), ')'::text, ''::text)), t.idtimeslice,
         seg_proc.altitudeinterpretation, arp.name,
         (
             CASE
                 WHEN seg_proc.lowerlimit IS NOT NULL OR seg_proc.upperlimit IS NOT NULL OR
                      seg_proc.altitudeinterpretation IS NOT NULL THEN concat(seg_proc.lowerlimit,
                                                                              CASE
                                                                                  WHEN seg_proc.upperlimit IS NOT NULL AND seg_proc.lowerlimit IS NOT NULL
                                                                                      THEN '-'::text
                                                                                  ELSE NULL::text
                                                                                  END, seg_proc.upperlimit,
                                                                              CASE
                                                                                  WHEN seg_proc.upperlimit IS NOT NULL OR seg_proc.lowerlimit IS NOT NULL
                                                                                      THEN ' '::text
                                                                                  ELSE NULL::text
                                                                                  END, seg_proc.altitudeinterpretation)
                 ELSE NULL::text
                 END);

alter materialized view controlledangleind_navaid_mat owner to "nav-user";

create index control_indx
    on controlledangleind_navaid_mat (identifier);

create index control__designator_indx
    on controlledangleind_navaid_mat (designator);
*/





--------------------------------------------------------
-------exit_leg_mat-----
---изменене join по startend (idsegmentpoint)

create materialized view exit_leg_mat as
SELECT s.identifier,
       s.beginposition,
       d.designator,
       d.name,
       d.type,
       d.latitude,
       d.longitude,
       d.speedlimit,
       d.speedreference,
       d.distance,
       d.distancetype,
       d.geom_nav_distance,
       d.type_dist_nav,
       d.distance_navaid,
       d.angle,
       d.angletype,
       d.geom_nav_angle,
       d.type_angle_nav,
       d.angle_navaid,
       d.lowerlimit,
       d.lowerlimitreference,
       d.upperlimit,
       d.upperlimitreference,
       d.altitudeinterpretation,
       d.rnav,
       s.legtypearinc,
       s.nameairportheliport,
       s.startend,
       s.geom,
       d.geom            AS point_geom,
       s.endposition,
       s.transitionid,
       s.procedure,
       s.nameprocedure,
       s.proc_geom,
       d.tp1,
       d.flyover


FROM segmentleg_mat s
         JOIN designatedpoint_mat_procedure d ON d.startend = s.startend;

create index exit_leg_indx
    on exit_leg_mat (identifier);





create materialized view navaid_sid as
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
SELECT nav.identifier,
       nav.designator,
       nav.name,
       nav.type,
       nav.elevation,
       nav.frequency,
       nav.magneticvariation,
       nav.classndb,
       nav.zerobearingdirection,
       nav.typedme,
       nav.latitude,
       nav.longitude,
       nav.srid,
       COALESCE(nav.uuidairportheliport, seg_proc.uuidairportheliport) AS uuidairportheliport,
       COALESCE(nav.nameairportheliport, seg_proc.nameairportheliport) AS nameairportheliport,
       nav.beginposition,
       nav.geom,
       nav.idsignificantpoint,
       seg_proc.rnav,
       seg_proc.procedure,
       concat(nav.type, ' ', nav.designator, ' ', nav.name)            AS present
FROM navaid_mat nav
         LEFT JOIN segmentpoint seg ON seg.idsignificantpoint = nav.idsignificantpoint
         LEFT JOIN seg_proc ON COALESCE(seg_proc.startpoint, seg_proc.endpoint) = seg.id
GROUP BY nav.identifier, nav.designator, nav.name, nav.type, nav.elevation, nav.frequency, nav.magneticvariation,
         nav.classndb, nav.zerobearingdirection, nav.typedme, nav.latitude, nav.longitude, nav.srid, nav.beginposition,
         nav.geom, seg_proc.rnav, seg_proc.procedure, nav.uuidairportheliport, seg_proc.uuidairportheliport,
         nav.idsignificantpoint, nav.nameairportheliport, seg_proc.nameairportheliport;

create index navaid_sid_indx
    on navaid_sid (identifier);



create materialized view exit_leg_nav_mat as
SELECT s.identifier,
       s.beginposition,
       s.endposition,
       nav.identifier AS nav_id,
       nav.designator,
       nav.name,
       nav.type,
       nav.elevation,
       nav.frequency,
       nav.magneticvariation,
       nav.classndb,
       nav.zerobearingdirection,
       nav.typedme,
       nav.latitude,
       nav.longitude,
       nav.srid,
       nav.geom       AS point_geom,
       s.speedlimit,
       s.speedreference,
       s.duration,
       s.distance,
       s.distancetype,
       s.geom_nav_distance,
       s.angle,
       s.angletype,
       s.anglepointchoice,
       s.lowerlimit,
       s.lowerlimitreference,
       s.upperlimit,
       s.upperlimitreference,
       s.altitudeinterpretation,
       s.rnav,
       s.nameprocedure,
       nav.present,
       s.legtypearinc,
       s.nameairportheliport,
       s.startend,
       s.geom,
       s.transitionid,
       s.procedure,
       s.proc_geom
FROM segmentleg_mat s
         JOIN segmentpoint seg ON  s.startend = seg.id
         JOIN navaid_sid nav ON nav.idsignificantpoint = seg.idsignificantpoint
GROUP BY s.identifier, s.beginposition, s.endposition, nav.identifier, nav.designator, nav.name, nav.type,
         nav.elevation, nav.frequency, nav.magneticvariation, nav.classndb, nav.zerobearingdirection, nav.typedme,
         nav.latitude, nav.longitude, nav.srid, nav.geom, s.speedlimit, s.speedreference, s.duration, s.distance,
         s.distancetype, s.geom_nav_distance, s.angle, s.angletype, s.anglepointchoice, s.lowerlimit,
         s.lowerlimitreference, s.upperlimit, s.upperlimitreference, s.altitudeinterpretation, s.rnav, s.nameprocedure,
         nav.present, s.legtypearinc, s.nameairportheliport, s.startend, s.geom, s.transitionid, s.procedure,
         s.proc_geom;


create index exit_leg_nav_indx
    on exit_leg_nav_mat (identifier);


