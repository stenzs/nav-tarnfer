import os
from pathlib import Path
from .Tool import CreateGridmora


DEGREE_FILES = ["2degree"]
GRIDMORA_SIZED = [2, 5]


class GridmoraPreparation:
    def __init__(self, geojson_prepare_dir, stribog, stribog_region, geojson_stribog_dir):
        self.geojson_prepared_folder = geojson_prepare_dir
        self.stribog = stribog
        self.stribog_region = stribog_region
        self.geojson_stribog_dir = geojson_stribog_dir
        self.geojson_files = os.listdir(self.geojson_prepared_folder)
        self.geojson_files = [file for file in self.geojson_files if Path(file).suffix == ".geojson"]

    def run(self):

        creator = CreateGridmora()
        degree_files = [file for file in self.geojson_files if Path(file).stem in DEGREE_FILES]

        for file in degree_files:
            for size in GRIDMORA_SIZED:

                print(f"    -- Create Gridmora (size={size}) from {file}")

                creator.read_data_from_file(file, self.geojson_prepared_folder)
                creator.create_gridmora_by_size(size)
                creator.write_data_to_file(file, self.geojson_prepared_folder, size)
