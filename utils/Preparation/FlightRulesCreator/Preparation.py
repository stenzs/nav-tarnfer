import os
from pathlib import Path
from .Tool import PrepareTra, PrepareBasedOnTra


TRA_FILES = ["TRA"]
BASED_ON_TRA_FILES = ["TPT", "NAV"]


class FlightRulesPreparation:
    def __init__(self, geojson_prepare_dir, stribog, stribog_region, geojson_stribog_dir):
        self.geojson_prepared_folder = geojson_prepare_dir
        self.stribog = stribog
        self.stribog_region = stribog_region
        self.geojson_stribog_dir = geojson_stribog_dir
        self.geojson_files = os.listdir(self.geojson_prepared_folder)
        self.geojson_files = [file for file in self.geojson_files if Path(file).suffix == ".geojson"]
        self.tra_file = None

    def run(self):

        tra_preparer = PrepareTra()
        based_on_tra_preparer = PrepareBasedOnTra()

        tra_files = [file for file in self.geojson_files if Path(file).stem in TRA_FILES]
        files_for_prepare_based_on_tra = [file for file in self.geojson_files if Path(file).stem in BASED_ON_TRA_FILES]

        for file in tra_files:

            print(f"    -- Create flightRules from {file}")

            tra_preparer.read_data_from_file(file, self.geojson_prepared_folder)
            tra_preparer.prepare_tra()
            tra_preparer.write_data_to_file(file, self.geojson_prepared_folder)

            self.tra_file = file

        for file in files_for_prepare_based_on_tra:

            print(f"    -- Create flightRules from {file}")

            based_on_tra_preparer.read_data_from_file(file, self.geojson_prepared_folder)
            based_on_tra_preparer.read_data_from_tra_file(self.tra_file, self.geojson_prepared_folder)
            based_on_tra_preparer.prepare_based_on_tra(self.tra_file)
            based_on_tra_preparer.write_data_to_file(file, self.geojson_prepared_folder)
