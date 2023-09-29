import asyncio
from sqlalchemy.ext.asyncio import async_sessionmaker
from database.Engine import connection
from database.models.Timeslice import Timeslice
from database.Arp.models.AirportHeliportTimeSlice import AirportHeliportTimeSlice
from database.Arp.models.AirportHeliport import AirportHeliport
from database.models.Procedure import Procedure
from database.models.ProcedureTimeSlice import ProcedureTimeSlice
from database.models.SafeAltitudeArea import SafeAltitudeArea
from database.models.RadioCommunicationChannel import RadioCommunicationChannel
from database.models.RadioCommunicationChannelTimeSlice import RadioCommunicationChannelTimeSlice

from Transfer.Geojson.Frequency.Prepare import prepare_frequency
from database.Frequency.use_cases import insert_frequency


def insert_data(features_for_insert, valid_time_begin, airac, arp):

    uuids = {}
    ids = []

    procedures = [feature for feature in features_for_insert if feature["mask_flr"]]
    frequencies = [feature for feature in features_for_insert if feature["mask_fr"]]
    airport_heliport_timeslice_table_columns = list(AirportHeliportTimeSlice.__dict__.keys())
    procedure_timeslice_table_columns = list(ProcedureTimeSlice.__dict__.keys())

    async def insert_airports_heliports(async_session):
        async with async_session() as session:

            timeslices = []
            airports_heliports = []
            airport_heliport_timeslices = []

            for feature in features_for_insert:
                timeslice = Timeslice(validtimebegin=valid_time_begin, correctionnumber=1, sequencenumber=int(airac))
                airport_heliport = AirportHeliport(_transasid=feature["_transasID"])
                airport_heliport_timeslice = AirportHeliportTimeSlice(
                    **{k: v for k, v in feature.items() if k in airport_heliport_timeslice_table_columns},
                    AirportHeliport=airport_heliport,
                    timeslice=timeslice
                )
                ids.append(feature["_transasID"])
                timeslices.append(timeslice)
                airports_heliports.append(airport_heliport)
                airport_heliport_timeslices.append(airport_heliport_timeslice)

            session.add_all(timeslices + airports_heliports + airport_heliport_timeslices)
            await session.commit()

            for airport_heliport in airports_heliports:
                transas_id = airport_heliport._transasid
                uuid = airport_heliport.uuid
                uuids[transas_id] = uuid
                ids.append(transas_id)

    async def insert_procedures(async_session):
        async with async_session() as session:

            objects = []

            for feature in procedures:
                timeslice = Timeslice(validtimebegin=valid_time_begin, correctionnumber=1, sequencenumber=int(airac))
                procedure = Procedure(_transasid=feature["_transasID"])
                procedure_timeslice = ProcedureTimeSlice(
                    **{k: v for k, v in feature.items() if k in procedure_timeslice_table_columns},
                    Procedure=procedure,
                    timeslice=timeslice
                )
                objects.extend([timeslice, procedure, procedure_timeslice])

            session.add_all(objects)
            await session.commit()


    async def insert_frequencies(async_session):
        async with async_session() as session:
            for feature in frequencies:
                frequency = prepare_frequency(feature["fr"], uuids[feature["_transasID"]], arp, valid_time_begin, fir=False)
                insert_frequency(frequency, airac)

    async def async_main() -> None:
        async_session = async_sessionmaker(connection.async_engine, expire_on_commit=False)
        await insert_airports_heliports(async_session)
        await insert_procedures(async_session)
        await insert_frequencies(async_session)
        await connection.async_engine.dispose()

    asyncio.run(async_main())


    raise "STOP"
    return ids, uuids


def update_data(features_for_update, ids_from_db):

    ids = []

    if not features_for_update:
        return

    for feature in features_for_update:
        feature["uuid"] = ids_from_db[feature["_transasID"].replace("'", "")]
        ids.append(feature["_transasID"].replace("'", ""))

    for feature in features_for_update:
        pass
        # update_query = query_creator.create_update_query_with_timeslice(feature, self.valid_time_begin, self.airac)
        # self.connector.perform_query(update_query)
    return ids


def close_data(features_for_close, id_field_name):

    ids = []

    if not features_for_close:
        return

    for feature in features_for_close:
        ids.append(feature[id_field_name])
        uuid = feature["uuid"].replace("'", "")

        # close_query = self.query_creator.create_close_query(uq(uuid), uq(str(self.valid_time_begin)))
        # self.connector.perform_query(close_query)
        pass
    return ids
