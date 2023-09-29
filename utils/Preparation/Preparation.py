import os
import shutil
from pathlib import Path
from dataclasses import dataclass
from .FlightRulesCreator.Preparation import FlightRulesPreparation
from .GridmoraCreator.Preparation import GridmoraPreparation
from .CombineDuplicatesSector.Preparation import SectorPreparation
from .StribogFormatCreator.Preparation import StribogPreparation

AIRAC = os.getenv("AIRAC")
STRIBOG = eval(os.getenv('STRIBOG')) if os.getenv('STRIBOG') is not None else False
STRIBOG_REGION = os.getenv("STRIBOG_REGION")
ROOT_DIR = os.getenv("ROOT_DIR")
GEOJSON_DIR = f"{ROOT_DIR}/data/{AIRAC}/GEOJSON"
GEOJSON_PREPARE_DIR = GEOJSON_DIR
STRIBOG_DIR = f"{GEOJSON_PREPARE_DIR}/stribog" if STRIBOG else None


@dataclass
class PreparationOperations:
    SectorPreparation = SectorPreparation
    FlightRulesPreparation = FlightRulesPreparation
    GridmoraPreparation = GridmoraPreparation
    StribogPreparation = StribogPreparation

class Preparation:
    operations: PreparationOperations = PreparationOperations()
    def __init__(self, operations: list = None):
        self.prepare_folders_and_files()

        self.__operations_to_run = [
            self.operations.SectorPreparation,
            self.operations.FlightRulesPreparation,
            self.operations.GridmoraPreparation,
            self.operations.StribogPreparation
        ]

        if operations:
            self.__operations_to_run = [op for op in operations if op in self.__operations_to_run ]

    def run(self):
        print(f"-- Start prepare geojson")
        for operation in self.__operations_to_run:
            operation(
                geojson_prepare_dir=GEOJSON_PREPARE_DIR,
                stribog=STRIBOG,
                stribog_region=STRIBOG_REGION,
                geojson_stribog_dir=STRIBOG_DIR
            ).run()

    def prepare_folders_and_files(self):
        if GEOJSON_DIR:
            self.create_folder(GEOJSON_DIR)

        if GEOJSON_PREPARE_DIR:
            if GEOJSON_PREPARE_DIR != GEOJSON_DIR:
                self.remove_folder(GEOJSON_PREPARE_DIR)
            self.create_folder(GEOJSON_PREPARE_DIR)

        if STRIBOG and STRIBOG_DIR:
            self.remove_folder(STRIBOG_DIR)
            self.create_folder(STRIBOG_DIR)

        self.copy_files_to_prepare_dir()

    @staticmethod
    def create_folder(folder):
        Path(folder).mkdir(parents=True, exist_ok=True)

    @staticmethod
    def remove_folder(folder):
        if Path(folder).exists() and Path(folder).is_dir():
            shutil.rmtree(Path(folder))

    @staticmethod
    def copy_files_to_prepare_dir():
        if GEOJSON_DIR == GEOJSON_PREPARE_DIR:
            return
        for file in os.listdir(GEOJSON_DIR):
            file = Path(f"{GEOJSON_DIR}/{file}")
            if file.is_file() and file.suffix == ".geojson":
                shutil.copy(file, GEOJSON_PREPARE_DIR)
