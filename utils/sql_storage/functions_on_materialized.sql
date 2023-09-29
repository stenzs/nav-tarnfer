--------------
CREATE OR REPLACE FUNCTION get_transitionid_segleg (
    arpname_filter VARCHAR, proceduretype_filter VARCHAR, date_filter datetype default NULL)
RETURNS VARCHAR[]
AS
$func$
select CASE WHEN proceduretype_filter='IAP' THEN array_agg(distinct nameProcedure)
           ELSE array_agg(distinct transitionId) END
FROM segmentleg_transitionid
WHERE nameairportheliport = arpname_filter
    AND procedure = proceduretype_filter
    AND beginposition <= ((select * FROM set_date_filter(date_filter)))
    and (endPosition is NULL OR endPosition > (select * FROM set_date_filter(date_filter)))
GROUP BY nameairportheliport
$func$  LANGUAGE SQL IMMUTABLE;