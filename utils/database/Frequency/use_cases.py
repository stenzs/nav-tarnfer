from sqlalchemy.ext.asyncio import async_sessionmaker
from database.Engine import connection
from database.models.Timeslice import Timeslice
from database.models.RadioCommunicationChannel import RadioCommunicationChannel
from database.models.RadioCommunicationChannelTimeSlice import RadioCommunicationChannelTimeSlice


def insert_frequency(session, frequency, airac, correction_number=1):
    for fr_row in frequency:

        fr_row["sequencenumber"] = airac
        fr_row["correctionnumber"] = correction_number

        fr_row["uuid_radio"] = insert_RadioCommunicationChannel(fr_row)

        return
        # fr_row["uuid_unit"], fr_row["id_timeslice_unit"] = insert_Unit_Service(fr_row, with_arp=arp)
        # fr_row["uuid_service"], fr_row["id_timeslice_service"] = fr_row["uuid_unit"], fr_row["id_timeslice_unit"]
        # insert_Service_RadioCommunicationChannel(fr_row)
        # fr_row.setdefault("cs_en", None)
        #
        # if fr_row["cs_en"] is not None:
        #     fr_row["id_call"] = insert_CallsignDetail(fr_row)
        #
        # if not arp:
        #     AirTraffic_insert(fr)
        #
        # if fr_row["mask_ACP_RMP"] == True:
        #     insert_SpecService(fr_row, 'TrafficSeparation')
        #
        # if fr_row["mask_ACP"]:
        #     specific_service_insert(fr_row, mask="mask_ACP", table="AirTrafficControl", service_type="ATCServiceType")
        #
        # if fr_row["mask_GND"]:
        #     specific_service_insert(fr_row, mask="mask_GND", table="GroundTrafficControl", service_type="GroundControlServiceType", alt_table="Information")
        #
        # if fr_row["mask_EMR"]:
        #     specific_service_insert(fr_row, mask="mask_EMR", table="SearchRescue", service_type="ALRS")
        #
        # if fr_row["mask_OTHER"]:
        #     other_service_insert(fr_row)

    # async def async_main() -> None:
    #     async_session = async_sessionmaker(connection.async_engine, expire_on_commit=False)
    #     await insert_RadioCommunicationChannel(async_session)
    # asyncio.run(async_main())


# async def insert_RadioCommunicationChannel(async_session):
#     async with async_session() as session:

def insert_RadioCommunicationChannel(row):

    timeslice = Timeslice(
        validtimebegin=row["validTimeBegin"],
        correctionnumber=row["correctionnumber"],
        sequencenumber=row["sequencenumber"]
    )
    radio_communication_channel = RadioCommunicationChannel()
    radio_communication_channel_timeslice = RadioCommunicationChannelTimeSlice(
        RadioCommunicationChannel=radio_communication_channel,
        timeslice=timeslice,
        frequencytransmission=(row["tf_1"], row["tf_2"]),
        frequencyreception=(row["tr_1"], row["tr_2"])
    )
    print(timeslice)
    print(radio_communication_channel)
    print(radio_communication_channel_timeslice)
    print(radio_communication_channel_timeslice.frequencyreception)
    print(radio_communication_channel_timeslice.uuid)
