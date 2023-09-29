import json


class CreateGridmora:

    def __init__(self):
        self.data = None

    def read_data_from_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.data = json.load(f)

    def write_data_to_file(self, file, geojson_prepared_folder, size):

        with open(f"{geojson_prepared_folder}/{size}_{file}", "w") as f:
            json.dump(self.data, f, separators=(",", ":"), ensure_ascii=False)

    def create_gridmora_by_size(self, size):

        features = self.data["features"]
        features.sort(key=lambda k: (-k["geometry"]["coordinates"][0][0][1], k["geometry"]["coordinates"][0][0][0]))

        gridmora_features = self.get_features_gridmora(features, size)

        self.data["features"] = gridmora_features

    @staticmethod
    def recalculate_index(i, counter, length, size, line_number, skip_two=True):

        if counter < length[line_number] - (size - 1):

            if skip_two:
                counter += size
                i += size
            else:
                i += (size - 1)
                counter += (size - 1)

        else:

            i = sum(length[:line_number + size])
            counter = 1

        return i, counter

    @staticmethod
    def grid_length(features):

        length = []
        current = 1

        for i in range(len(features) - 1):

            x, y = features[i], features[i + 1]
            if x["geometry"]["coordinates"][0][0][1] == y["geometry"]["coordinates"][0][0][1]:
                features[i]["properties"]["grid_line_number"] = len(length)
                features[i + 1]["properties"]["grid_line_number"] = len(length)
                current += 1
            else:
                length.append(current)
                current = 1

        length.append(current)

        return length

    def get_features_gridmora(self, features, size):

        gridmora_features = []
        length = self.grid_length(features)
        indent = size - 1
        i, counter = 0, 1

        while i < len(features):

            i, counter, gridmora_feature = self.get_feature_gridmora(features, i, counter, length, indent, size)
            if gridmora_feature:
                gridmora_features.append(gridmora_feature)

        return gridmora_features

    @staticmethod
    def get_cells(feature, features, indent):

        next_line_number = feature["properties"]["grid_line_number"] + indent
        left_bottom_coords = feature["geometry"]["coordinates"][0][0][0]
        right_bottom_coords = feature["geometry"]["coordinates"][0][0][0] + indent

        next_line = [f for f in features if f["properties"]["grid_line_number"] == next_line_number]
        left_bottom_cell = next((f for f in next_line if f["geometry"]["coordinates"][0][0][0] == left_bottom_coords),None)
        right_bottom_cell = next((f for f in next_line if f["geometry"]["coordinates"][0][0][0] == right_bottom_coords), None)

        return left_bottom_cell, right_bottom_cell

    def get_feature_gridmora(self, features, i, counter, length, indent, size):
        feature = features[i]
        next_feature = features[i + indent]

        left_bottom_cell, right_bottom_cell = self.get_cells(feature, features, indent)


        if feature["geometry"]["coordinates"][0][0][0] % size != 0:
            i, counter = self.recalculate_index(i, counter, length, size, feature["properties"]["grid_line_number"], skip_two=False)
            return i, counter, None

        if feature["geometry"]["coordinates"][0][1][1] % size >= indent:
            i, counter = sum(length[:feature["properties"]["grid_line_number"] + 1]), 1
            return i, counter, None

        if not left_bottom_cell or i + indent > len(features):
            i, counter = self.recalculate_index(i, counter, length, size, feature["properties"]["grid_line_number"])
            return i, counter, None

        if not right_bottom_cell:
            i, counter = self.recalculate_index(i, counter, length, size, feature["properties"]["grid_line_number"])
            return i, counter, None

        if feature["geometry"]["coordinates"][0][3][0] + indent - 1 != \
                features[i + indent]["geometry"]["coordinates"][0][0][0]:
            i, counter = self.recalculate_index(i, counter, length, size, feature["properties"]["grid_line_number"])
            return i, counter, None

        gridmora_feature = self.combine_gridmora(feature, next_feature, left_bottom_cell, right_bottom_cell)
        i, counter = self.recalculate_index(i, counter, length, size, feature["properties"]["grid_line_number"])
        return i, counter, gridmora_feature

    @staticmethod
    def combine_gridmora(feature, next_feature, left_bottom_cell, right_bottom_cell):

        types = [
            feature["properties"]["type"],
            next_feature["properties"]["type"],
            left_bottom_cell["properties"]["type"],
            right_bottom_cell["properties"]["type"]
        ]

        height = [
            feature["properties"]["height"],
            next_feature["properties"]["height"],
            left_bottom_cell["properties"]["height"],
            right_bottom_cell["properties"]["height"]
        ]

        max_height = max(height, key=lambda x: int(x["value"]))
        type_prop = "горный" if "горный" in types else "равнинный"

        gridmora_properties = {
            "type": type_prop,
            "_transasID": feature["properties"]["id"],
            "height": max_height
        }

        gridmora_coordinates = [[
            left_bottom_cell["geometry"]["coordinates"][0][0],
            feature["geometry"]["coordinates"][0][1],
            next_feature["geometry"]["coordinates"][0][2],
            right_bottom_cell["geometry"]["coordinates"][0][3],
            left_bottom_cell["geometry"]["coordinates"][0][0],
        ]]

        gridmora_feature = {
            "type": "Feature",
            "properties": gridmora_properties,
            "geometry": {
                "type": "Polygon", "coordinates": gridmora_coordinates
            }
        }

        return gridmora_feature
