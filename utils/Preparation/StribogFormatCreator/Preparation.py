import os
from pathlib import Path
from .Tool import CreateStribog


class StribogPreparation:
    def __init__(self, geojson_prepare_dir, stribog, stribog_region, geojson_stribog_dir):
        self.geojson_prepared_folder = geojson_prepare_dir
        self.stribog = stribog
        self.region = stribog_region if stribog_region else "Москва"
        self.geojson_stribog_folder = geojson_stribog_dir
        self.geojson_files = os.listdir(self.geojson_prepared_folder)
        self.geojson_files = [file for file in self.geojson_files if Path(file).suffix == ".geojson"]

    def run(self):

        if not self.stribog or not self.geojson_stribog_folder:
            return

        creator = CreateStribog()

        for file in self.geojson_files:

            print(f"    -- Clip {file} by {self.region} RDC box")

            creator.read_data_from_file(file, self.geojson_prepared_folder)
            creator.create_stribog(self.region)
            creator.write_data_to_file(file, self.geojson_stribog_folder)
