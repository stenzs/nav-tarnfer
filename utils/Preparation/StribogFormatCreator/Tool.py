import json
from shapely.geometry import Point, LineString, Polygon


REGION_POLY = {
    "Москва": [(30, 60), (48, 60), (48, 49), (30, 49)],
    "Волгоград": [
        (39.48256135, 45.71856181),
        (50.18155627, 45.71856181),
        (50.27877969, 52.55071636),
        (39.55768853, 52.55955485),
        (39.48256135, 45.71856181)],
    "Алтай": [(70, 48), (89, 48), (89, 61), (70, 61)]
}


class CreateStribog:

    def __init__(self):
        self.data = None

    def read_data_from_file(self, file, geojson_prepared_folder):

        with open(f"{geojson_prepared_folder}/{file}", encoding="utf-8") as f:
            self.data = json.load(f)

    def write_data_to_file(self, file, geojson_stribog_folder):

        with open(f"{geojson_stribog_folder}/{file}", "w") as f:
            json.dump(self.data, f, separators=(",", ":"), ensure_ascii=False)

    def create_stribog(self, region):

        stribog_features = []
        features = self.data["features"]

        box = Polygon(REGION_POLY.get(region))

        for feature in features:

            if self.check_feature_in_region_box(feature, box):
                stribog_features.append(feature)

        self.data["features"] = stribog_features


    def check_feature_in_region_box(self, feature, box):

        geom = self.get_geom(feature)

        if box.contains(geom):
            return True

        return False

    def get_geom(self, feature):
        geom_type = feature["geometry"]["type"]
        coords = self.validate_geometry(geom_type, feature)
        if geom_type == "Point":
            geom = Point(coords)
        elif geom_type == "LineString":
            geom = LineString(coords)
        else:
            geom = Polygon(coords)
        return geom

    @staticmethod
    def validate_geometry(expected_type, feature) -> list:

        geometry = feature["geometry"]
        geometry_type = geometry["type"]

        if geometry_type != expected_type:
            raise TypeError("Invalid geometry type")

        geometry_coordinates = None
        if expected_type == "Point":
            geometry_coordinates = feature["geometry"].get("coordinates")

        elif expected_type == "LineString":
            geometry_coordinates = feature["geometry"].get("coordinates")

        elif expected_type == "Polygon":
            geometry_coordinates = feature["geometry"].get("coordinates")[0]

        if not geometry_coordinates or len(geometry_coordinates) == 0:
            raise ValueError("Empty geometry in feature {}".format(feature["properties"]["id"]))

        return geometry_coordinates
