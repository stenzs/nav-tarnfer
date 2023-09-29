import json
import math
import copy


class PrepareTra:

    def __init__(self):
        self.data = None

    def read_data_from_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.data = json.load(f)

    def write_data_to_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", "w") as f:
            json.dump(self.data, f, separators=(",", ":"), ensure_ascii=False)

    def prepare_tra(self):

        features = self.data["features"]

        for feature in features:
            self.add_flight_rules_to_tra_feature(feature)

    def add_flight_rules_to_tra_feature(self, feature):

        properties = feature["properties"]

        self.remove_empty_keys(properties)

        vertical_distance = properties.get("verticalDistance", [{}])[0]
        lower_limit = vertical_distance.get("lowerLimit")
        upper_limit = vertical_distance.get("upperLimit")

        if lower_limit:
            vertical_distance["lowerLimit"] = self.convert_limit_to_fl(lower_limit)

        if upper_limit:
            vertical_distance["upperLimit"] = self.convert_limit_to_fl(upper_limit)

        properties["fR"] = self.get_flight_rules(properties.get("verticalDistance", [{}])[0])

        if vertical_distance.get("minimumEnrouteAltitude"):
            properties["minimumEnrouteAltitude"] = vertical_distance.get("minimumEnrouteAltitude")

        if vertical_distance.get("minimumObstacleClearanceAltitude"):
            properties["minimumObstacleClearanceAltitude"] = vertical_distance.get("minimumObstacleClearanceAltitude")

    @staticmethod
    def convert_limit_to_fl(limit):

        limit = copy.deepcopy(limit)
        value, unit = limit.get("value"), limit.get("unit")

        if unit == "M":
            value = int(value) * 3.28084 / 100
            value = 5 * math.floor(value / 5)
            limit.update({"value": str(value), "unit": "FL"})

        elif unit == "FT":
            value = int(value) / 100
            value = 5 * math.floor(value / 5)
            limit.update({"value": str(value), "unit": "FL"})

        elif value.upper() in ("GND", "SFC"):
            limit.update({"value": str(-99999), "unit": "FL"})

        elif value.upper() == "UNL":
            limit.update({"value": str(99999), "unit": "FL"})

        return limit

    @staticmethod
    def remove_empty_keys(dictionary):

        for key, value in list(dictionary.items()):
            if value is None or value == "":
                dictionary.pop(key)

    @staticmethod
    def get_flight_rules(vertical_distance):

        if not vertical_distance:
            vertical_distance = {"lowerLimit": {"value": "0", "unit": "FL", "reference": "STD"}}

        flight_rules_value = 0

        lower_limit = vertical_distance.get("lowerLimit", {})
        upper_limit = vertical_distance.get("upperLimit", {})
        lower_value = lower_limit.get("value", "-99999")
        upper_value = upper_limit.get("value", "99999")

        if lower_value and int(lower_value) > 290:
            flight_rules_value += 1
        if upper_value and int(upper_value) >= 290:
            flight_rules_value += 1

        if flight_rules_value == 2:
            return "high"
        elif flight_rules_value == 1:
            return "both"
        else:
            return "low"


class PrepareBasedOnTra:

    def __init__(self):
        self.data = None
        self.tra_data = None

    def read_data_from_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.data = json.load(f)

    def read_data_from_tra_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.tra_data = json.load(f)

    def write_data_to_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", "w") as f:
            json.dump(self.data, f, separators=(",", ":"), ensure_ascii=False)

    def prepare_based_on_tra(self, tra_file):

        if not tra_file:
            return

        features = self.data["features"]
        tra_grouped = self.group_ps_pe_to_fr(self.tra_data)

        for feature in features:
            self.add_flight_rules_to_based_tra_feature(feature, tra_grouped)


    @staticmethod
    def group_ps_pe_to_fr(data):

        grouped = {}
        features = data["features"]

        for feature in features:
            tra_properties = feature["properties"]

            if tra_properties.get("ps"):
                grouped.setdefault(tra_properties.get("ps"), set())
                grouped[tra_properties.get("ps")].add(tra_properties["fR"])

            if tra_properties.get("pe"):
                grouped.setdefault(tra_properties.get("pe"), set())
                grouped[tra_properties.get("pe")].add(tra_properties["fR"])

        return grouped

    @staticmethod
    def add_flight_rules_to_based_tra_feature(feature, tra_grouped):

        properties = feature["properties"]

        flight_rules_stack = tra_grouped.get(properties["nm"], set())

        if len(flight_rules_stack) == 1:
            flight_rules_value = list(flight_rules_stack)[0]
        else:
            flight_rules_value = "both"

        if properties.get("ist") and properties.get("ist").lower() == "нет":
            flight_rules_value = "low"

        properties["fR"] = flight_rules_value
