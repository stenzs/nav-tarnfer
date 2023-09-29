import os
from pathlib import Path
from .Tool import CombineDuplicatesSector


SECTOR_FILES = ["SECTOR"]


class SectorPreparation:
    def __init__(self, geojson_prepare_dir, stribog, stribog_region, geojson_stribog_dir):
        self.geojson_prepared_folder = geojson_prepare_dir
        self.stribog = stribog
        self.stribog_region = stribog_region
        self.geojson_stribog_dir = geojson_stribog_dir
        self.geojson_files = os.listdir(self.geojson_prepared_folder)
        self.geojson_files = [file for file in self.geojson_files if Path(file).suffix == ".geojson"]

    def run(self):

        combiner = CombineDuplicatesSector()

        files_for_combined = [file for file in self.geojson_files if Path(file).stem in SECTOR_FILES]

        for file in files_for_combined:

            print(f"    -- Combine duplicates in {file}, transferring rw to fr")

            combiner.read_data_from_file(file, self.geojson_prepared_folder)
            combiner.combine_duplicates_sector()
            combiner.write_data_to_file(file, self.geojson_prepared_folder)
