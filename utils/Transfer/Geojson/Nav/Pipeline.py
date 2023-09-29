import copy
import json
import re
from Transfer.Geojson.Nav.Prepare import prepare_feature, adapt_feature
# from QueryCreators.Navaid.NavaidQueryCreator import NavaidQueryCreator
# from QueryCreators.Navaid.NavaidTimeSliceQueryCreator import NavaidTimeSliceQueryCreator
# from QueryCreators.Navaid.NavaidEquipmentTimeSliceQueryCreator import NavaidEquipmentTimeSliceQueryCreator
# from QueryCreators.SegmentPointQueryCreator import SegmentPointQueryCreator
# from QueryCreators.Navaid.AirportHeliportNavaidQueryCreator import AirportHeliportNavaidQueryCreator
# from selecting_functions import select_channels, select_AirportsHeliports
# from inserting_functions import insert_Navaid_NavaidEquipment, insert_tp, insert_channel_nav
from Transfer.Geojson.Query import uq


class NavPipeline:

    def __init__(self, geojson_prepare_dir, valid_time_begin, airac, avia_type, connector):

        self.geojson_prepared_folder = geojson_prepare_dir
        self.valid_time_begin = valid_time_begin
        self.airac = airac
        self.connector = connector
        self.query_creator = NavaidQueryCreator()
        self.arp = True
        self.avia_type = avia_type
        self.possible_missing_fields = ["le"]
        self.id_field_name = "id"
        self.features_for_insert = []
        self.features_for_update = []
        self.features_for_close = []
        self.ids_from_db = {}
        self.prepared_features = None
        self.numbers = None
        self.data = None

    def read_data_from_file(self, file):

        with open(f"{self.geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.data = json.load(f)

    def prepare_data(self, features):

        prepared_properties = []
        tfs = set()
        designators = set()
        channels_dict = {}
        airports_heliports_dict = {}

        for feature in features:

            designator = feature["properties"].get("ah_icao")
            if designator:
                designators.add(designator)

            tp = feature["properties"].get("tp")
            if tp is not None and tp in ["VORTAC", "TACAN", "MILTACAN"]:
                tf = float(feature["properties"]["tf"][:-4].replace(",", "."))
                tfs.add(tf)

        channels = select_channels(list(tfs))
        airports_heliports = select_AirportsHeliports(list(designators))

        for row in channels:
            channel, tf = row
            tf = float(tf)
            channels_dict.setdefault(tf, channel)

        for row in airports_heliports:
            uuid, designator = row
            airports_heliports_dict.setdefault(designator, uuid)

        for feature in features:
            prepared_feature = prepare_feature(
                feature,
                self.valid_time_begin,
                self.id_field_name,
                self.airac,
                channels_dict,
                airports_heliports_dict
            )
            adapt_feature(prepared_feature)
            prepared_properties.append(prepared_feature)

        import csv
        if prepared_properties:
            keys = prepared_properties[0].keys()
            with open("REFACTOR.csv", "w", newline="") as output_file:
                dict_writer = csv.DictWriter(output_file, keys)
                dict_writer.writeheader()
                dict_writer.writerows(prepared_properties)

        return prepared_properties

    def insert_data(self):
        pass

    def insert_data(self):
        if not self.features_for_insert:
            return

        uuids = {}
        ids = []

        for feature in self.features_for_insert:
            feature["correctionnumber"] = 1

        #     navaid_timeslice_query_creator = NavaidTimeSliceQueryCreator()
        #     navaideq_timeslice_query_creator = NavaidEquipmentTimeSliceQueryCreator(blank_fields=('uuid',))
        #     segmentPoint_query_creator = SegmentPointQueryCreator()
        #     navaid_airport_query_creator = AirportHeliportNavaidQueryCreator()
        #
        #     uuidNavaid, id_timeslice_nvd, idPoint, idSignificantPoint = self.connector.insert_avia_object_with_timeslice(copy.deepcopy(feature), navaid_timeslice_query_creator, single_return=False)
        #
        #     feature["uuidNavaid"] = uuidNavaid
        #     feature["id_timeslice_nvd"] = id_timeslice_nvd
        #     feature["idPoint"] = idPoint
        #     feature["idSignificantPoint"] = idSignificantPoint
        #
        #     uuids[feature["_transasID"]] = uuidNavaid
        #     ids.append(feature["_transasID"])
        #
        #     uuidNavaidEquipment, id_timeslice_nvd_eqpmnt = self.connector.insert_avia_object_with_timeslice(copy.deepcopy(feature),
        #                                                                                                     navaideq_timeslice_query_creator,
        #                                                                                                     uuid=uuidNavaid,
        #                                                                                                     set_transas_in_main=False,
        #                                                                                                     single_return=False)
        #
        #     feature["uuidNavaidEquipment"] = uuidNavaidEquipment
        #     feature["id_timeslice_nvd_eqpmnt"] = id_timeslice_nvd_eqpmnt
        #     feature["sp_exs"] = self.connector.select_aviaobject(feature, segmentPoint_query_creator)
        #     feature["idSegmentPoint"] = self.connector.insert_aviaobject(feature, segmentPoint_query_creator) if not feature.get("sp_exs") \
        #         else self.connector.perform_monoreturn_query(f'SELECT id FROM SegmentPoint WHERE idSignificantPoint = {feature["idSignificantPoint"]}')
        #
        #     insert_Navaid_NavaidEquipment(feature)
        #     self.connector.insert_aviaobject(feature, navaid_airport_query_creator)
        #
        #     tp = feature.get("tp")
        #     if tp:
        #         if tp == "NDB":
        #             insert_tp(feature, "NDB", "frequency")
        #         if tp in ["DME", "VORDME", "ILSDME"]:
        #             insert_tp(feature, "DME", "ghostFrequency")
        #         if tp == "ILSDME":
        #             insert_tp(feature, "Localizer", "frequency")
        #         if tp == ["VORTAC", "VOR", "VORDME"]:
        #             insert_tp(feature, "VOR", "frequency")
        #         if tp == ["VORTAC", "TACAN", "MILTACAN"]:
        #             insert_channel_nav(feature, "TACAN", feature["tacan_channel"])
        #         if tp == "РСБН":
        #             insert_channel_nav(feature, "RSNN", feature["tf"])
        #         if tp == "GBAS":
        #             insert_channel_nav(feature, "GroundBasedAugmentationSystem", re.search("[\b\d]*", feature["tf"]).group())
        #
        #
        # self.connector.track_data(self.data, self.avia_type, self.id_field_name, ids, uuids)

    def update_data(self):
        ids = []

        if not self.features_for_update:
            return

        for feature in self.features_for_update:
            feature["uuid"] = self.ids_from_db[feature["_transasID"].replace("'", "")]
            ids.append(feature["_transasID"].replace("'", ""))

            ch = re.search("[\b\d]*", feature["tf"]).group()
            navaideq_query_creator = NavaidEquipmentTimeSliceQueryCreator(blank_fields=("uuid"))
            update_query_nav_eq = navaideq_query_creator.create_update_query_with_timeslice(feature,
                                                                                            self.valid_time_begin,
                                                                                            self.airac) + ";"

            navaid_query_creator = NavaidTimeSliceQueryCreator()
            update_query_nav = navaid_query_creator.create_update_query_with_timeslice(feature,
                                                                                       self.valid_time_begin,
                                                                                       self.airac) + ';'

            sql_for_update = f"""
            with NDB_update as (
                UPDATE NDB SET frequency = {feature["frequency"]}
                WHERE uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {feature["uuid"]})),
            DME_update as (
                UPDATE DME SET ghostFrequency = {feature["frequency"]}
                WHERE uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {feature["uuid"]})),
            Localizer_update as (
                UPDATE Localizer SET frequency = {feature["frequency"]}
                WHERE uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {feature["uuid"]})),
            VOR_update as (
                UPDATE VOR SET frequency = {feature["frequency"]}
                WHERE uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {feature["uuid"]})),
            TACAN_update as (
                UPDATE TACAN SET channel = {feature["tacan_channel"]}
                WHERE uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {feature["uuid"]})),
            RSNN_update as (
                UPDATE RSNN SET channel = {ch} 
                WHERE uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {feature["uuid"]}))

                UPDATE GroundBasedAugmentationSystem SET channel = {ch}
                WHERE uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {feature["uuid"]})
            """

            self.connector.perform_query(update_query_nav_eq)
            self.connector.perform_query(sql_for_update)
            self.connector.perform_query(update_query_nav)

        self.connector.update_tracking_data(self.data, self.avia_type, self.id_field_name, ids, self.ids_from_db)

    def close_data(self):
        ids = []

        if not self.features_for_close:
            return

        for feature in self.features_for_close:
            pass
            ids.append(feature[self.id_field_name])
            uuid = feature["uuid"].replace("'", "")

            navaid_query_creator = NavaidTimeSliceQueryCreator()
            navaid_close_query = navaid_query_creator.create_close_query(uq(uuid), uq(str(self.valid_time_begin)))
            navaideq_query_creator = NavaidEquipmentTimeSliceQueryCreator(
                blank_fields=("uuid"),
                update_condition=f"""uuid in (select uuidNavaidEquipment from Navaid_NavaidEquipment where uuidnavaid = {uuid!r})
                        and validtimeend is NULL""")
            navaideq_close_query = navaideq_query_creator.create_close_query(uq(uuid), uq(str(self.valid_time_begin)))

            self.connector.perform_query(navaid_close_query + ";" + navaideq_close_query)

        self.connector.delete_tracking_data(self.avia_type, self.id_field_name, ids)
