import json
import re
from Transfer.Geojson.Arp.Prepare import prepare_feature, adapt_feature
from selecting_functions import select_arp_number
from database.Arp import use_cases


class ArpPipeline:

    def __init__(self, geojson_prepare_dir, valid_time_begin, airac, avia_type, connector):

        self.geojson_prepared_folder = geojson_prepare_dir
        self.valid_time_begin = valid_time_begin
        self.airac = airac
        self.connector = connector
        self.arp = True
        self.avia_type = avia_type
        self.possible_missing_fields = ["le"]
        self.id_field_name = "id"
        self.features_for_insert = []
        self.features_for_update = []
        self.features_for_close = []
        self.ids_from_db = {}
        self.prepared_features = None
        self.data = None

    def read_data_from_file(self, file):

        with open(f"{self.geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.data = json.load(f)

    def prepare_data(self, features):

        prepared_properties = []

        number = select_arp_number()
        numbers = self.calculate_numbers(self.data, number)

        for i, feature in enumerate(features):
            prepared_feature = prepare_feature(feature, i, self.valid_time_begin, self.id_field_name, self.airac, numbers)
            adapt_feature(prepared_feature)
            prepared_properties.append(prepared_feature)

        return prepared_properties

    def calculate_numbers(self, data, number):

        features = data["features"]
        numbers = []

        for i in range(len(features)):
            if i == 0:
                item = number
            else:
                item = numbers[i - 1]
            if not features[i]["properties"].get("nm") or \
                    not (features[i]["properties"].get("nm") is not None and
                         re.match(u"([A-Z]|\d){3,6}", features[i]["properties"].get("nm"))):
                item += 1
            numbers.append(item)

        return numbers

    def insert_data(self):
        if not self.features_for_insert:
            return
        ids, uuids = use_cases.insert_data(self.features_for_insert, self.valid_time_begin, self.airac, self.arp)
        self.connector.track_data(self.data, self.avia_type, self.id_field_name, ids, uuids)

    def update_data(self):
        if not self.features_for_update:
            return
        ids = use_cases.update_data()
        self.connector.update_tracking_data(self.data, self.avia_type, self.id_field_name, ids, self.ids_from_db)

    def close_data(self):
        if not self.features_for_close:
            return
        ids = use_cases.close_data()
        self.connector.delete_tracking_data(self.avia_type, self.id_field_name, ids)
