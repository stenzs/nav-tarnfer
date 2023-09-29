import copy
from database.Engine import connection

db, cursor, engine = connection.db, connection.cursor, connection.engine

def uq(attr):
    if attr:
        if attr == 'NULL':
            return attr
        if isinstance(attr, str) and attr.isdigit():
            return '{attr!s}'.format(attr=attr)
        if isinstance(attr, str) and "'" in attr:
            splitted = attr.split("'")
            attr = '##'.join(splitted)
            return '{attr!r}'.format(attr=attr).replace('#', "'")
        # if '"' in attr:
        #     attr = attr.replace('"', '#')
        return '{attr!r}'.format(attr=attr)
    else:
        return '{attr!s}'.format(attr='NULL')


def insert_ContactInformationOnlineContact(idContactInformation, idOnlineContact):
    cursor.execute(
        f"""INSERT INTO ContactInformationOnlineContact (idContactInformation, idOnlineContact)
        VALUES ({idContactInformation}, unnest(ARRAY{idOnlineContact}))""")


def insert_AirportHeliport_Service(row, table="AirTraffic"):
    cursor.execute(f"""INSERT INTO AirportHeliport_Service 
                        (uuidarphlp, uuid{table}Service) VALUES ({row["uuid"]}, {row["uuid_unit"]})""")


def insert_Airspace_Service(row, table="AirTrafficControl"):
    cursor.execute(f"""
    with info_insert as (INSERT INTO {table}Service (uuid, idTimeSlice) 
        VALUES ({row["uuid_unit"]}, {row["id_timeslice_unit"]}) ON CONFLICT DO NOTHING)
    INSERT INTO Airspace_Service  (uuidairspc, uuid{table}Service) 
    VALUES ({row["uuid"]}, {row["uuid_unit"]})""")


def insert_AirTrafficManagementService(row):
    cursor.execute(f"""
    INSERT INTO AirTrafficManagementService (uuid, idTimeSlice)
    VALUES({row["uuid_unit"]}, {row["id_timeslice_unit"]});""")
    return row["uuid_unit"]


# @utilq_decorator
# def insert_procedure(row):
#     cursor.execute(f"""
#         INSERT INTO \"procedure\"
#             (validTimeBegin, uuidarphlp)
#         VALUES (
#             {row.validTimeBegin}, {row.uuid!r})
#         RETURNING uuid""")
#     return cursor.fetchone()[0]


def insert_tp(row, table, frequency):
    # NDB, DME, Localizer, VOR
    cursor.execute(f"""
        INSERT INTO {table} (idTimeSlice, uuid, {frequency})
        VALUES ({row["id_timeslice_nvd_eqpmnt"]}, {row["uuidNavaidEquipment"]},
            {row["frequency"]})""")


def insert_channel_nav(row, table, channel):
    cursor.execute(f"""INSERT INTO {table} (idTimeSlice, uuid, channel)
                   VALUES ({row["id_timeslice_nvd_eqpmnt"]}, {row["uuidNavaidEquipment"]}, {channel})""")


# @utilq_decorator
# def insert_RadioCommunicationChannel(row):
#     cursor.execute(f"""
#         with first as (
#             INSERT INTO RadioCommunicationChannel DEFAULT VALUES
#             RETURNING uuid
#         ),
#         second as (
#             INSERT INTO timeslice (validTimeBegin, sequencenumber, correctionnumber) VALUES ({row["validTimeBegin"]},
#                                                                                              {row["sequencenumber"]},
#                                                                                              {row["correctionnumber"]})
#             RETURNING idTimeSlice
#         )
#         INSERT INTO RadioCommunicationChannelTimeSlice
#             (idTimeSlice, uuid, frequencyTransmission, frequencyReception)
#         VALUES((SELECT idTimeSlice FROM second), (SELECT uuid FROM first), (ROW({row["tf_1"]}, {row["tf_2"]})),
#                    (ROW({row["tr_1"]}, {row["tr_2"]})))
#         RETURNING uuid""")
#     return cursor.fetchone()[0]


def insert_CallsignDetail(row):
    cursor.execute(f"""
        INSERT INTO CallsignDetail (callSign, uuidService, translation)
        VALUES({uq(row["cs_en"])}, {row["uuid_unit"]}, {uq(row["cs"]) if "cs" in row.keys() else uq("NULL")}) RETURNING id""")
    return cursor.fetchone()[0]


# @utilq_decorator
# def insert_Unit_Service(row=None, with_arp=False):
#     sql = f"""
#             with first as (
#                 INSERT INTO Unit_Service DEFAULT VALUES
#                 RETURNING uuid
#             ),
#             second as (
#                 INSERT INTO timeslice (validTimeBegin, sequencenumber, correctionnumber) VALUES ({row["validTimeBegin"]},
#                                                                                                  {row["sequencenumber"]},
#                                                                                                  {row["correctionnumber"]})
#                 RETURNING idTimeSlice
#             )
#             INSERT INTO Unit_ServiceTimeSlice
#                 (idTimeSlice, uuid, type, uuidarphlp)
#             VALUES(
#             (SELECT idTimeSlice FROM second),
#             (SELECT uuid FROM first),
#             '{row["tp"]}',
# --             {row["tp"]},
#             {row["uuid"] if with_arp else uq("NULL")}
#             )
#             RETURNING uuid, idTimeSlice"""


    cursor.execute(sql)
    return cursor.fetchone()


def insert_SpecService(row=None, table="Service", service_type=uq("NULL")):
    if "MET_mask" in row.keys() and not row["MET_mask"]:
        return None, None
    if "NULL" not in service_type:
        if service_type in ("ATCServiceType", "GroundControlServiceType"):
            service_type = eval(service_type)[row["tp"].replace("'", "")]
    service_type = uq(service_type)
    cursor.execute(f"""
    INSERT INTO {table}Service (idTimeSlice, uuid, type)
    VALUES({row["id_timeslice_unit"]}, {row["uuid_unit"]}, {service_type})""")


def insert_Service_RadioCommunicationChannel(row):
    cursor.execute(f"""INSERT INTO Service_RadioCommunicationChannel (uuidService,uuidRadioCommunicationChannel)
                        VALUES({row["uuid_unit"]}, {row["uuid_radio"]})""")


def insert_Availability(table, name, idPropertiesWithSchedule, status, uuid_airspace):
    operation_status = 'operationalStatus' if name == 'SECTOR' else 'status'
    if table == "AirspaceActivation":
        operation_status = 'status'

    cursor.execute(f"""INSERT INTO {table} (id, {operation_status}, uuidairspc)
                       VALUES({idPropertiesWithSchedule}, {uq(status)}, {uuid_airspace})""")


def insert_Navaid_NavaidEquipment(row):
    cursor.execute(f"""
    INSERT INTO Navaid_NavaidEquipment (uuidNavaid, uuidNavaidEquipment) 
    VALUES ({row["uuidNavaid"]}, {row["uuidNavaidEquipment"]})""")



def insert_Timesheet(row):
    cursor.execute(f"""INSERT INTO Timesheet (day, startDate, endDate, startTime, endTime, idPropertiesWithSchedule)
                   VALUES(unnest({row.days}), unnest({row.st_dates}), unnest({row.end_dates}), unnest({row.st_times}),
                   unnest({row.end_times}), {row.idPropertiesWithSchedule})""")


def insert_Timesheet_hol(row):
    cursor.execute(f"""INSERT INTO Timesheet (day, startDate, endDate, startTime, endTime, excluded, idPropertiesWithSchedule)
                   VALUES('HOL', '01-01-2000', '01-01-2100', '00:00', '24:00', ROW(NULL, 'YES'), {row.idPropertiesWithSchedule})""")


# @utilq_decorator
# def insert_Note_sogl(row):
#     cursor.execute(f"with n as (INSERT INTO Note (propertyName, purpose) "
#                    f"VALUES ({row.sogl}, ROW(NULL, 'REMARK')) RETURNING id)"
#                    f"INSERT INTO RouteSegment_Note (idTimeSliceRtSeg, idNote) "
#                    f"VALUES ({row.idTimeSliceRtSeg}, (SELECT id from n)) RETURNING idNote")
#     return cursor.fetchone()[0]


# @utilq_decorator
# def insert_Note_use(row):
#     cursor.execute(f"with n as (INSERT INTO Note (propertyName, purpose) "
#                    f"VALUES ({row.featuresOfUse}, ROW(NULL, 'REMARK')) RETURNING id) "
#                    f"INSERT INTO RouteSegment_Note (idTimeSliceRtSeg, idNote) "
#                    f"VALUES ({row.idTimeSliceRtSeg}, (SELECT id from n)) RETURNING idNote")
#     return cursor.fetchone()[0]


def get_property(layer_property, table, condition):
    cursor.execute(f"""Select {layer_property} From {table} WHERE {condition}""")
    try:
        cursor.fetchone()[0]
    except TypeError:
        return


def update_request_generator(table, fields: dict, condition):
    if not fields:
        return 'select 1'
    updates = []
    for name, value in fields.items():
        updates.append(f' {name} = {value} ')
    sql = f""" UPDATE {table} set {','.join(updates)} where {condition}"""
    return sql


# @utilq_decorator
# def insert_Surface(row):
#     cursor.execute(
#         f"INSERT INTO Surface (coord, srid, geom) "
#         f"VALUES ({str(row.valid_geom)},4326,st_setsrid(ST_GeomFromGeoJSON({str(row.valid_geom)}),4326)) RETURNING id")
#     return cursor.fetchone()[0]


def insert_Note(row):
    cursor.execute(f"""with n as (
        INSERT INTO Note (propertyName, purpose) 
        VALUES ({uq(row.propertyName)}, ROW(NULL, 'DESCRIPTION')) RETURNING id)
    INSERT INTO Airspace_Note (idTimeSliceAirspc, idNote) 
    VALUES ({row.id_timeslice_airspace}, (SELECT id from n))""")


def insert_AirspaceLayerClass(row):
    cursor.execute(f"""INSERT INTO AirspaceLayerClass (classification, uuidairspc) 
                    VALUES ({row.classification}, {row.uuid})""")


#@utilq_decorator
def insert_OrganisationAuthority(row):
    # qwery = f"""
    # INSERT INTO OrganisationAuthority
    #     (validTimeBegin,
    #      name,
    #      type,
    #       authority_type,
    #        uuidairspc)
    # VALUES (unnest(array_fill({row.validTimeBegin}::datetype, ARRAY[{row.org_num}])),
    #  unnest(ARRAY[{row.administration}]::TEXT[]),
    #         'OTHER: RUSSIA',
    #          'OWN',
    #          {row.uuid})
    # RETURNING uuid;"""
    valid_time_begin = row.validTimeBegin
    sql = f"""
            with first as (
            INSERT INTO timeslice (validTimeBegin, correctionnumber, sequencenumber)
            VALUES ({valid_time_begin}, {row.correctionnumber}, {row.sequencenumber})
            RETURNING idTimeSlice
            ),
             second as (
                    INSERT INTO OrganisationAuthority DEFAULT VALUES 
                    RETURNING uuid
            ) INSERT INTO OrganisationAuthorityTimeslice (name, type, authority_type, uuidairspc, idTimeSlice, uuid) 
                            VALUES ( unnest(ARRAY[{row.administration}]::TEXT[]),
                                    'OTHER: RUSSIA',
                                     'OWN', 
                                     {row.uuid}, 
                                    (SELECT idTimeSlice from first), 
                                    (SELECT uuid from second))
            RETURNING uuid;
                """
    cursor.execute(sql)
    if row.org_num not in (1, '1'):
        a=1
    return [i[0] for i in cursor.fetchall()]


#@utilq_decorator
def insert_ContactInformation(row):
    cursor.execute(f"INSERT INTO ContactInformation (uuidOrganisationAuthority) "
                   f"VALUES (unnest(ARRAY[{row.uuid_org}]::uuid[])) RETURNING id")
    return [i[0] for i in cursor.fetchall()]


def insert_PropertiesWithSchedule(row=None, basic=True):
    if basic:
        cursor.execute(
            "INSERT INTO PropertiesWithSchedule (id) VALUES (nextval('auto_id_properties_with_schedule')) RETURNING id")
        return cursor.fetchone()[0]
    else:
        cursor.execute(f"INSERT INTO PropertiesWithSchedule (id) (SELECT nextval('auto_id_properties_with_schedule')"
                       f" FROM generate_series(1, {row})) RETURNING id")
        return [i[0] for i in cursor.fetchall()]


# @utilq_decorator
# def insert_OrganisationAuthority_PropertiesWithSchedule(row, organisation=False):
#     values = f"({row['organisation']}, unnest(ARRAY[{row['id_schedule']!r}]))" if organisation else \
#         f"(unnest(ARRAY{row.uuid_org}::uuid[]), unnest(ARRAY{row.id_schedule!r}))"
#     try:
#         cursor.execute(f"""INSERT INTO OrganisationAuthority_PropertiesWithSchedule
#                     (uuidOrganisationAuthority, idPropertiesWithSchedule) VALUES {values}""")
#     except Exception as e:
#         a=1


def insert_PostalAddress(row):
    id_schedule = row.id_schedule
    for i, id in enumerate(id_schedule):
        try:
            qwery = f"""INSERT INTO PostalAddress (id, deliveryPoint, city, administrativeArea, postalCode, country) 
                VALUES ({id}, {row.contacts['delivery'][i]}, {row.contacts['cities'][i]},
                {row.contacts['areas'][i]}, {row.contacts['codes'][i]}, 'RUSSIA')"""
        except TypeError as e:
            qwery = f"""INSERT INTO PostalAddress (id, country)
                    VALUES ({id}, 'RUSSIA')"""
        cursor.execute(qwery)


def insert_ContactInformationPostalAddress(row):
    cursor.execute(f"INSERT INTO ContactInformationPostalAddress (idContactInformation, idPostalAddress) "
                   f"VALUES (unnest(ARRAY{row.id_contact}), unnest(ARRAY{row.id_schedule!r}))")


def insert_TelephoneContact(row, with_fax=True):
    phone = 'unnest(ARRAY[NULL])' if not row['phone_clear'] else f"unnest(ARRAY{row['phone_clear']})"
    fax = 'unnest(ARRAY[NULL])' if not row['fax_clear'] else f"unnest(ARRAY{row['fax_clear']})"
    if with_fax:
        cursor.execute(f"INSERT INTO TelephoneContact (id, voice, facsimile) "
                       f"VALUES (unnest(ARRAY{row['id_schedule']!r}), {phone}, {fax})")
    else:
        cursor.execute(f"""INSERT INTO TelephoneContact (id, voice) 
                       VALUES (unnest(ARRAY{row['id_schedule']!r}), {phone})""")


def insert_ContactInformationTelephoneContact(row):
    cursor.execute(
        f"INSERT INTO ContactInformationTelephoneContact (idContactInformation, idTelephoneContact) "
        f"VALUES ({row['id_contact']}, unnest(ARRAY{row['id_schedule']!r}))")


def insert_OnlineContact(row, values='net_link_mail'):
    mail = 'unnest(ARRAY[NULL])' if row['email_clear'] == ['NULL'] or not row[
        'email_clear'] else f"unnest(ARRAY{row['email_clear']})"
    linkage = 'unnest(ARRAY[NULL])' if 'aftn_clear' not in row.keys() or row['aftn_clear'] == [
        'NULL'] else f"unnest(ARRAY{row['aftn_clear']})"
    if values == 'net_link_mail':
        cursor.execute(f"""INSERT INTO OnlineContact (id, network, linkage, eMail)
                       VALUES (unnest(ARRAY{row['id_schedule']}), unnest(ARRAY{row['network']}), {linkage}, {mail})""")
    elif values == 'net_link':
        cursor.execute(f"""INSERT INTO OnlineContact (id, network, linkage)
                       VALUES (unnest(ARRAY{row['id_schedule']}), unnest(ARRAY{row['network']}), {linkage})""")
    else:
        try:
            a = f"""INSERT INTO OnlineContact (id, eMail)
                       VALUES (unnest(ARRAY{row['id_schedule']}), {mail})"""
            cursor.execute(f"""INSERT INTO OnlineContact (id, eMail)
                       VALUES (unnest(ARRAY{row['id_schedule']}), {mail})""")
        except:
            print(mail)
            a=1


def insert_city_for_arp_query(citys, arp_uuid):
    city_names, city_notes = [], []
    for city in citys:
        city_names.append((city.get('name', 'NULL')).replace('"', "`").replace('#', '`').replace("'", '`'))
        city_notes.append((city.get('note', 'NULL')).replace('"', "`").replace('#', '`').replace("'", '`'))
    return f"""
    WITH ins_city as (
        INSERT INTO City (uuid, name, note) 
        VALUES (uuid_generate_v4(), unnest(array[{city_names}]), unnest(array[{city_notes}])) RETURNING uuid)
    INSERT INTO AirportHeliportCity (uuidarphlp, uuidCity) 
    VALUES ({arp_uuid!r}, unnest((SELECT array_agg(uuid) from ins_city)));"""


def insert_SegmentLeg_xml(item,
                          valid_time=None,
                          sequence_number=None,
                          ):
    """
    удачи разнести
    """

    dupe = item.duplicated
    point_ref_insert, segmentpoint_update, approachLeg_query, point_insert = [], [], 'select 1', ''
    segment_insert = ''
    item.set_geom()
    
    uuid_sign = get_uuid_sign(item)

    if uuid_sign and (item.endPoint.get('uuid_sign') or item.endPoint != {}):
        item.endPoint['uuid_sign'] = uuid_sign
    if uuid_sign and (item.startPoint.get('uuid_sign') or item.startPoint != {}):
        item.startPoint['uuid_sign'] = uuid_sign
    if uuid_sign and (item.arcCentre.get('uuid_sign') or item.arcCentre != {}):
        item.arcCentre['uuid_sign'] = uuid_sign

    item.idStart, item.idEnd, item.idArcCentre = get_linked_segmentpoint(item)

    segleg_spec = item
    segleg_spec_query_creator = SegmentLegSpecializationQueryCreator()
    segleg_spec_query_creator.set_target_table(item.procedure)

    segmentleg_query_creator = SegmentLegTimeSliceQueryCreator()

    
    if not dupe:
        segleg_spec_query_creator.add_to_constant({'idTimeSlice': '(SELECT idTimeSlice from main_ins)'})
        segleg_spec = segleg_spec_query_creator.map_uq_form(segleg_spec)
        segleg_spec_insert = segleg_spec_query_creator.create_insert_query(segleg_spec)
        if item.procedure in ('InitialLeg', 'MissedApproachLeg', 'FinalLeg'):
            segleg_spec_query_creator.set_target_table('ApproachLeg')
            approachLeg_query = segleg_spec_query_creator.create_insert_query(segleg_spec)
        for point, point_id in zip((item.startPoint, item.endPoint, item.arcCentre),
                             (item.idStart, item.idEnd, item.idArcCentre)):
            if not point:
                continue
            extend_segmentpoint_update(point, point_id, segmentpoint_update)

            segment_insert, new_segment_id = prepare_segmentpoint_insert(point, item)

            extend_point_ref_insert(new_segment_id, item, point_ref_insert)

        segmentleg = segmentleg_query_creator.map_uq_form(copy.copy(item))
        segmentleg['correctionnumber'] = 1

        segmentleg_insert, sql_2 = segmentleg_query_creator.create_insert_query_with_timeslice(segmentleg,
                                                                                               valid_time=valid_time,
                                                                                               sequence_number=sequence_number,
                                                                                               is_implementer=True,
                                                                                               uuid=segmentleg['uuid'],
                                                                                               with_construction=''
                                                                                               )

        point_insert = prepare_point_insert(point_ref_insert, segmentpoint_update)

        result = prepare_insert_sql_segmentleg(segmentpoint_update,
                                               point_insert,
                                               item,
                                               segment_insert,
                                               segmentleg_insert,
                                               sql_2,
                                               approachLeg_query,
                                               segleg_spec_insert)
    else:
        segleg_spec = segleg_spec_query_creator.map_uq_form(segleg_spec)
        segleg_spec_query_creator.add_to_constant({'idTimeSlice': '(SELECT timeslice_uuid from main_ins)'})
        segleg_spec_update = segleg_spec_query_creator.create_insert_query(segleg_spec)
        if item.procedure in ('InitialLeg', 'MissedApproachLeg', 'FinalLeg'):
            segleg_spec_query_creator.set_target_table('ApproachLeg')
            approachLeg_query = segleg_spec_query_creator.create_update_query(segleg_spec)
        for point, point_id in zip((item.startPoint, item.endPoint, item.arcCentre),
                             (item.idStart, item.idEnd, item.idArcCentre)):
            if point_id:
                # для некоторых точек приходит facilityDistance
                extend_segmentpoint_update(point, point_id, segmentpoint_update)

                segment_insert, new_segment_id = prepare_segmentpoint_insert(point, item)

                extend_point_ref_insert(new_segment_id, item, point_ref_insert)

        prepare_fields_for_segmentleg_updation(item)

        sql_1, sql_2 = segmentleg_query_creator.create_update_query_with_timeslice(
                        item,
                        is_implementer=True,
                        valid_time=valid_time,
                        sequence_number=sequence_number,
                    )
        point_insert = prepare_point_insert(point_ref_insert, segmentpoint_update)

        result = prepare_update_sql_segmentleg(segmentpoint_update,
                                               point_insert,
                                               item,
                                               segment_insert,
                                               sql_1,
                                               sql_2,
                                               approachLeg_query,
                                               segleg_spec_update)

        # result = ';'.join(segmentpoint_update) + ";" + f"""
        #     {sql_1},
        #     time_slice as ({sql_2})
        #     {segleg_spec_update};
        #     {approachLeg_query}
        #     """
    return result


def prepare_constrat(item):
    constrat = ''
    if item.idStart:
        constrat = 'idStart'
    if item.idEnd:
        constrat = 'idEnd'
    if item.idArcCentre:
        constrat = 'idArcCentre'
    return constrat


def get_uuid_sign(item):
    uuid_sign = None
    if hasattr(item, 'point_choice_desg_uuid'):
        uuid_sign = item.point_choice_desg_uuid
    elif hasattr(item, 'point_choice_nav_uuid'):
        uuid_sign = item.point_choice_nav_uuid
    elif hasattr(item, 'point_choice_run_uuid'):
        uuid_sign = item.point_choice_run_uuid
    elif hasattr(item, 'point_choice_arp_uuid'):
        uuid_sign = item.point_choice_arp_uuid
    return uuid_sign


def set_point_attr_to_segmentleg(item, result):
    if item.idStart:
        item.idStart = result
    if item.idEnd:
        item.idEnd = result
    if item.idArcCentre:
        item.idArcCentre = result


def prepare_segmentpoint_insert(point, item):
    point['idSignificantPoint'] = select_significantpoint_by_point_uuid(point['uuid_sign'])
    if 'reportingATC' in point:
        point['reportingATC'] = f"'{point['reportingATC']}'"
    segment_query_creator = SegmentPointQueryCreator()
    new_segment_id = db_connector.perform_monoreturn_query(segment_query_creator.create_insert_query(point))
    set_point_attr_to_segmentleg(item, new_segment_id)
    return '', new_segment_id


def extend_point_ref_insert(point_id, item, point_ref_insert):
    for point_ref in item.point_references:
        point_ref['idSegmentPoint'] = point_id
        point_ref_insert.append(insert_PointReference_xml(point_ref))


def extend_segmentpoint_update(point, point_id, segmentpoint_update):
    segment_role = None if point.get('role') is None else point.get('role')

    point.update({'nonstr_columns': ['alongCourseGuidance', 'flyOver', 'indicatorFACF', 'role'],
                  'idSegmentPoint': point_id,
                  'role': segment_role,
                  'uuidanglind': point.get('theAngleIndication'),
                  'uuiddistind': point.get('facilityDistance')})

    segmentpoint_update.append(get_segment_point_query(point, point_id))


def prepare_insert_sql_segmentleg(segmentpoint_update,
                                  point_insert,
                                  item,
                                  segment_insert,
                                  segmentleg_insert,
                                  sql_2,
                                  approachLeg_query,
                                  segleg_spec_insert):
    return ';'.join(segmentpoint_update) + ";" + point_insert + ";" + f"""
                WITH 
                ins_air as (INSERT INTO AircraftCharacteristic (aircraftLandingCategory, uuidSegmentLeg)
                    select ROW(t.cat_nil, t.cat_val)::CodeAircraftCategoryType, uuidSegmentLeg
                    FROM unnest(array_fill(NULL::TEXT, ARRAY[{len(item.aircraftLandingCategory)}]), ARRAY[{uq(item.aircraftLandingCategory)}]::TEXT[],
                                array_fill({item.uuid!r}::uuid, ARRAY[{len(item.aircraftLandingCategory)}]))
                    as t (cat_nil, cat_val, uuidSegmentLeg) WHERE ARRAY[{len(item.aircraftLandingCategory)}]::TEXT[] <> ARRAY[0]::TEXT[]),
                {segment_insert}
                {segmentleg_insert},
                main_ins as ({sql_2}),
                apr_leg_ins as ({approachLeg_query})
                {segleg_spec_insert}"""


def prepare_update_sql_segmentleg(segmentpoint_update,
                                  point_insert,
                                  item,
                                  segment_insert,
                                  segmentleg_insert,
                                  sql_2,
                                  approachLeg_query,
                                  segleg_spec_insert):
    return ';'.join(segmentpoint_update) + ";" + point_insert + ";" + f"""
                {segment_insert}
                {segmentleg_insert},
                main_ins as ({sql_2}),
                apr_leg_ins as ({approachLeg_query})
                {segleg_spec_insert}"""


def prepare_fields_for_segmentleg_updation(item):
    turnDirection = item.turnDirection
    angle = item.angle
    distance = item.distance
    lowerLimitReference = item.lowerLimitReference
    altitudeInterpretation = item.altitudeInterpretation
    upperLimitReference = item.upperLimitReference
    item.angle = f"'{angle}'" if angle else angle
    item.distance = f"'{distance}'" if distance else distance
    item.lowerLimitReference = f"'{lowerLimitReference}'" if lowerLimitReference else lowerLimitReference
    item.altitudeInterpretation = f"'{altitudeInterpretation}'" if altitudeInterpretation else altitudeInterpretation
    item.upperLimitReference = f"'{upperLimitReference}'" if upperLimitReference else upperLimitReference
    item.turnDirection = f"'{turnDirection}'" if turnDirection else turnDirection


def prepare_point_insert(point_ref_insert, segmentpoint_update):
    point_insert = ''
    if point_ref_insert:
        point_ref_insert.extend(segmentpoint_update)
        point_insert = ';'.join(point_ref_insert)
    if 'PointReference ()' in point_insert:
        point_insert = ''
    return point_insert

def get_linked_segmentpoint(item):
    id_start = select_segmentpoint_by_point_uuid(item.startPoint.get('uuid_sign')) if item.startPoint.get(
        'uuid_sign') else None
    id_end = select_segmentpoint_by_point_uuid(item.endPoint.get('uuid_sign')) if item.endPoint.get(
        'uuid_sign') else None
    id_arc_centre = select_segmentpoint_by_point_uuid(item.arcCentre.get('uuid_sign')) if item.arcCentre.get(
        'uuid_sign') else None
    return id_start, id_end, id_arc_centre


def update_segmentleg_creator_with_constat(segmentleg_query_creator, constrat):
    segmentleg_query_creator.add_to_constant({f'{constrat}': '(select id from segmentpoint_insert)'})
    ids_point = {'idStart', 'idEnd', 'idArcCentre'}
    segmentleg_query_creator.all_fields_names = segmentleg_query_creator.all_fields_names - ids_point


def get_segment_point_query(point, point_id):
    # для некоторых точек приходит facilityDistance
    segment = copy.copy(point)
    segment_point_query_creator = SegmentPointQueryCreator(update_condition=f'id = {point_id}')
    segment = segment_point_query_creator.map_uq_form(segment)
    sql = segment_point_query_creator.create_update_query(segment)
    return segment_point_query_creator.create_update_query(segment)


def insert_PointReference_xml(item):
    if 'facilityDistance' in item:
        item['uuiddistind'] = item['facilityDistance']
    if 'facilityAngle' in item:
        item['uuidanglind'] = item['facilityAngle']
    item['nonstr_columns'] = []

    point_ref_query_creator = PointReferenceQueryCreator()
    point_ref_query_creator.required_return = 'RETURNING id, idSegmentPoint'
    item = point_ref_query_creator.map_uq_form(item)
    point_insert = point_ref_query_creator.create_insert_query(item)
    segmentpointreference_insert = """INSERT INTO segmentpointreference  VALUES (
                                            (SELECT idSegmentPoint from pointref), 
                                            (SELECT id from pointref)
                                    )"""
    sql = f"""
        with pointref as (
        {point_insert}
        )
        {segmentpointreference_insert}
    """
    return sql
