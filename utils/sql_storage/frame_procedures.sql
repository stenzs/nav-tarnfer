create or replace function frame_x_index(chart_type character varying, sheet_formats character varying) returns text
    immutable
    language sql
as
$$
Select
     (case
      when chart_type = 'AIRFIELD' then
      (case when SHEET_FORMATS = 'A4h' then  '13597.1, 13597.1, 13597.1, 13597.1, 13597.1'
            when SHEET_FORMATS = 'A4h_mini' then  '12850.1, 12850.1, 12850.1, 12850.1, 12850.1'
            when SHEET_FORMATS = 'A4v'  then  '9950, 9700, 9700, 9950, 9950'
            when SHEET_FORMATS = 'A5'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'
            when SHEET_FORMATS = 'A5h'  then  '8370.9, 8348.2, 8270.9, 8270.9, 8370.9'  end
      )
     when chart_type = 'AREA_IFR' then
      (case when SHEET_FORMATS = 'A4h' then  '13597.1, 13597.1, 13597.1, 13597.1, 13597.1'
            when SHEET_FORMATS = 'A4h_mini' then  '12850.1, 12850.1, 12850.1, 12850.1, 12850.1'
            when SHEET_FORMATS = 'A4v'  then  '9950, 9700, 9700, 9950, 9950'
            when SHEET_FORMATS = 'A5'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'
            when SHEET_FORMATS = 'A5h'  then  '8370.9, 8348.2, 8270.9, 8270.9, 8370.9'  end
      )
      when chart_type = 'AREA_VFR' then
      (case when SHEET_FORMATS = 'A4h' then  '13597.1, 13597.1, 13597.1, 13597.1, 13597.1'
            when SHEET_FORMATS = 'A4h_mini' then  '12850.1, 12850.1, 12850.1, 12850.1, 12850.1'
            when SHEET_FORMATS = 'A4v'  then  '9950, 9700, 9700, 9950, 9950'
            when SHEET_FORMATS = 'A5'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'
            when SHEET_FORMATS = 'A5h'  then  '8370.9, 8348.2, 8270.9, 8270.9, 8370.9'  end
      )
      when chart_type = 'SID' then
      (case when SHEET_FORMATS = 'A4h' then  '13597.1, 13597.1, 13597.1, 13597.1, 13597.1'
            when SHEET_FORMATS = 'A4h_mini' then  '12850.1, 12850.1, 12850.1, 12850.1, 12850.1'
            when SHEET_FORMATS = 'A4v'  then  '9950, 9700, 9700, 9950, 9950'
            when SHEET_FORMATS = 'A5'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'
            when SHEET_FORMATS = 'A5h'  then  '8370.9, 8370.9, 8370.9, 8370.9, 8370.9'  end
      )
      when chart_type = 'STAR' then
      (case when SHEET_FORMATS = 'A4h' then  '13597.1, 13597.1, 13597.1, 13597.1, 13597.1'
            when SHEET_FORMATS = 'A4h_mini' then  '12850.1, 12850.1, 12850.1, 12850.1, 12850.1'
            when SHEET_FORMATS = 'A4v'  then  '9950, 9700, 9700, 9950, 9950'
            when SHEET_FORMATS = 'A5'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'
            when SHEET_FORMATS = 'A5h'  then  '8370.9, 8370.9, 8370.9, 8370.9, 8370.9'  end
      )
      when chart_type = 'IAP' then
      (case when SHEET_FORMATS = 'A4h' then  '6165.1, 6165.1, 6165.1, 6165.1, 6165.1'
            when SHEET_FORMATS = 'A4v'  then  '6165.1, 6165.1, 6165.1, 6165.1, 6165.1'
            when SHEET_FORMATS = 'A5'  then  '6165.1, 6165.1, 6165.1, 6165.1, 6165.1'
            when SHEET_FORMATS = 'A5h'  then  '6165.1, 6165.1, 6165.1, 6165.1, 6165.1'  end
      )
end);
$$;

create or replace function frame_y_index(chart_type character varying, sheet_formats character varying) returns text
    immutable
    language sql
as
$$
Select
     (case
     when chart_type = 'AIRFIELD' then
      (case when SHEET_FORMATS = 'A4h' then  '8653.15, 8653.15, 7953.15, 7953.15, 8653.15'
            when SHEET_FORMATS = 'A4h_mini' then  '8653.15, 8653.15, 7953.15, 7953.15, 8653.15'
            when SHEET_FORMATS = 'A4v'  then  '12100, 12100, 12200, 12200, 12100'
            when SHEET_FORMATS = 'A4v_mini'  then  '11380, 11380, 11480, 11480, 11380'
            when SHEET_FORMATS = 'A5'  then  '8370.9, 8348.2, 8270.9, 8270.9, 8370.9'
            when SHEET_FORMATS = 'A5h'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'  end
      )
     when chart_type = 'AREA_IFR' then
      (case when SHEET_FORMATS = 'A4h' then  '8653.15, 8653.15, 7953.15, 7953.15, 8653.15'
            when SHEET_FORMATS = 'A4h_mini' then  '8653.15, 8653.15, 7953.15, 7953.15, 8653.15'
            when SHEET_FORMATS = 'A4v'  then  '12100, 12100, 12200, 12200, 12100'
            when SHEET_FORMATS = 'A4v_mini'  then  '11380, 11380, 11480, 11480, 11380'
            when SHEET_FORMATS = 'A5'  then  '8370.9, 8348.2, 8270.9, 8270.9, 8370.9'
            when SHEET_FORMATS = 'A5h'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'  end
      )
      when chart_type = 'AREA_VFR' then
      (case when SHEET_FORMATS = 'A4h' then  '8653.15, 8653.15, 7953.15, 7953.15, 8653.15'
            when SHEET_FORMATS = 'A4h_mini' then  '8653.15, 8653.15, 7953.15, 7953.15, 8653.15'
            when SHEET_FORMATS = 'A4v'  then  '12100, 12100, 12200, 12200, 12100'
            when SHEET_FORMATS = 'A4v_mini'  then  '11380, 11380, 11480, 11480, 11380'
            when SHEET_FORMATS = 'A5'  then  '8370.9, 8348.2, 8270.9, 8270.9, 8370.9'
            when SHEET_FORMATS = 'A5h'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'  end
      )
      when chart_type = 'SID' then
      (case when SHEET_FORMATS = 'A4h' then  '7953.15, 7953.15, 7953.15, 7953.15, 7953.15'
            when SHEET_FORMATS = 'A4h_mini' then  '7953.15, 7953.15, 7953.15, 7953.15, 7953.15'
            when SHEET_FORMATS = 'A4v'  then  '11750, 11750, 11900, 11900, 11750'
            when SHEET_FORMATS = 'A4v_mini'  then  '11030, 11030, 11180, 11180, 11030'
            when SHEET_FORMATS = 'A5'  then  '8370.9, 8348.2, 7570.9, 7570.9, 8370.9'
            when SHEET_FORMATS = 'A5h'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'  end
      )
      when chart_type = 'STAR' then
      (case when SHEET_FORMATS = 'A4h' then  '7953.15, 7953.15, 7953.15, 7953.15, 7953.15'
            when SHEET_FORMATS = 'A4h_mini' then  '7953.15, 7953.15, 7953.15, 7953.15, 7953.15'
            when SHEET_FORMATS = 'A4v'  then  '11750, 11750, 11900, 11900, 11750'
            when SHEET_FORMATS = 'A4v_mini'  then  '11030, 11030, 11180, 11180, 11030'
            when SHEET_FORMATS = 'A5'  then  '8370.9, 8348.2, 7570.9, 7570.9, 8370.9'
            when SHEET_FORMATS = 'A5h'  then  '6238.5, 6124.4, 6124.4, 6238.5, 6238.5'  end
      )
      when chart_type = 'IAP' then
      (case when SHEET_FORMATS = 'A4h' then  '4950, 4950, 4830, 4830, 4950'
            when SHEET_FORMATS = 'A4v'  then  '4950, 4950, 4830, 4830, 4950'
            when SHEET_FORMATS = 'A4v_mini'  then  '4230, 4230, 4110, 4110, 4230'
            when SHEET_FORMATS = 'A5'  then  '4950, 4950, 4830, 4830, 4950'
            when SHEET_FORMATS = 'A5h'  then  '4950, 4950, 4830, 4830, 4950'  end
      )
end);
$$;


create or replace function frame(arpname_filter character varying, chart_type character varying, sheet_formats character varying,
                      scale_filter integer, date_filter datetype DEFAULT NULL::date)
    returns TABLE
            (
                geom geometry
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
     geom_arp as (
         select distinct geom
         from airportheliport_mat
         where beginposition <= ((select * from set_date_filter(date_filter)))
           ---and (endPosition is NULL OR endPosition > (select * from set_date_filter(date_filter)))
           and name = arpname_filter)


select st_geomfromtext(
                                                                                               'POLYGON((' ||
                                                                                               st_x(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) -
                                                                                               ((cast(
                                                                                                       split_part(FRAME_X_INDEX(chart_type, sheet_formats), ',', 1) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ' ' ||
                                                                                               st_y(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) +
                                                                                               ((cast(
                                                                                                       split_part(FRAME_y_INDEX(chart_type, sheet_formats), ',', 1) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ',' ||
                                                                                               st_x(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) +
                                                                                               ((cast(
                                                                                                       split_part(FRAME_X_INDEX(chart_type, sheet_formats), ',', 2) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ' ' ||
                                                                                               st_y(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) +
                                                                                               ((cast(
                                                                                                       split_part(FRAME_y_INDEX(chart_type, sheet_formats), ',', 2) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ',' ||
                                                                                               st_x(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) +
                                                                                               ((cast(
                                                                                                       split_part(FRAME_X_INDEX(chart_type, sheet_formats), ',', 3) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ' ' ||
                                                                                               st_y(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) -
                                                                                               ((cast(
                                                                                                       split_part(FRAME_y_INDEX(chart_type, sheet_formats), ',', 3) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ',' ||
                                                                                               st_x(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) -
                                                                                               ((cast(
                                                                                                       split_part(FRAME_X_INDEX(chart_type, sheet_formats), ',', 4) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ' ' ||
                                                                                               st_y(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) -
                                                                                               ((cast(
                                                                                                       split_part(FRAME_y_INDEX(chart_type, sheet_formats), ',', 4) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ',' ||
                                                                                               st_x(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) -
                                                                                               ((cast(
                                                                                                       split_part(FRAME_X_INDEX(chart_type, sheet_formats), ',', 5) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || ' ' ||
                                                                                               st_y(ST_centroid(
                                                                                                       ST_Transform(
                                                                                                                   (Select geom from geom_arp),
                                                                                                                   '+proj=longlat +datum=WGS84 +no_defs',
                                                                                                                   (Select proj from pre_arp)))) +
                                                                                               ((cast(
                                                                                                       split_part(FRAME_y_INDEX(chart_type, sheet_formats), ',', 5) as numeric)) *
                                                                                                scale_filter::int /
                                                                                                100000) || '))'
           ) as geom

from airportheliport_mat
where name = arpname_filter

$$;

