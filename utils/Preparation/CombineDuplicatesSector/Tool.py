import copy
import json


class CombineDuplicatesSector:

    def __init__(self):
        self.data = None

    def read_data_from_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.data = json.load(f)

    def write_data_to_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", "w") as f:
            json.dump(self.data, f, separators=(",", ":"), ensure_ascii=False)

    def combine_duplicates_sector(self):

        combined_features = []
        features = self.data["features"]

        features_grouped_by_custom_index = self.group_features_by_custom_index(features)

        for feature_group in features_grouped_by_custom_index.values():
            combined_feature = self.combine_feature(feature_group)
            combined_features.append(combined_feature)

        self.data["features"] = combined_features

    @staticmethod
    def group_features_by_custom_index(features):

        features_grouped = {}

        for feature in features:

            nl_en = feature["properties"].get("nl_en")
            vertical_distance = feature["properties"].get("verticalDistance")
            coordinates = feature["geometry"]["coordinates"]

            index = str((nl_en, vertical_distance, coordinates))
            features_grouped.setdefault(index, [])
            features_grouped[index].append(feature)

        return features_grouped

    @staticmethod
    def combine_feature(feature_group):

        feature_group = copy.deepcopy(feature_group)
        combined_feature = feature_group[0]
        feature_id = combined_feature["properties"]["id"]

        combined_rw = [feature["properties"].get("rw", [float("nan")]) for feature in feature_group]
        combined_fr = [feature["properties"].get("fr", [float("nan")]) for feature in feature_group]
        new_fr = [[rw + fr] for rw, fr in zip(combined_rw, combined_fr)]
        new_fr = [item for sublist in new_fr for item in sublist]

        nl = combined_feature["properties"].get("nl", float("nan"))
        nl_en = combined_feature["properties"].get("nl_en", float("nan"))
        vertical_distance = combined_feature["properties"].get("verticalDistance", float("nan"))

        combined_feature["properties"] = {
            "id": feature_id,
            "nl_en": nl_en,
            "verticalDistance": vertical_distance,
            "nl": nl,
            "fr": new_fr
        }
        return combined_feature
