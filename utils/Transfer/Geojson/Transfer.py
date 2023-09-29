import os
from pathlib import Path
import datetime
import math
from dataclasses import dataclass
from Transfer.Geojson.Arp.Pipeline import ArpPipeline
from Transfer.Geojson.Nav.Pipeline import NavPipeline
from Transfer.Dispatcher import Dispatcher
from services.MotherBaseLogicCreator import MotherBaseLogicCreator
from database.Engine import connection
from database.models.Base import Base


AIRAC = os.getenv("AIRAC")
ROOT_DIR = os.getenv("ROOT_DIR")
GEOJSON_DIR = f"{ROOT_DIR}/data/{AIRAC}/GEOJSON"
GEOJSON_PREPARE_DIR = GEOJSON_DIR


@dataclass
class InsertionOperations:
    AirspaceInsertion = ArpPipeline, ["ARP", "ALS"]
    NavInsertion = NavPipeline, ["NAV"]

class Transfer:
    operations: InsertionOperations = InsertionOperations()

    def __init__(self, operations: list = None):

        self.connector = connection
        self.sql_storage_path = f"{ROOT_DIR}/utils/sql_storage"
        self.db_logic_creator = MotherBaseLogicCreator(self.sql_storage_path)
        self.geojson_files = os.listdir(GEOJSON_PREPARE_DIR)
        self.geojson_files = [file for file in self.geojson_files if Path(file).suffix == ".geojson"]
        self.create_all_tables()

        self.__operations_to_run = [
            self.operations.AirspaceInsertion,
            self.operations.NavInsertion
        ]

        if operations:
            self.__operations_to_run = [op for op in operations if op in self.__operations_to_run]

    def run(self):
        print(f"-- Start Transfer geojson files")
        for pipeline, operation_files in self.__operations_to_run:

            for operation_file in operation_files:

                operation = pipeline(
                    geojson_prepare_dir=GEOJSON_PREPARE_DIR,
                    valid_time_begin=self.date_by_circle(AIRAC),
                    airac=AIRAC,
                    avia_type=operation_file,
                    connector=self.connector
                )

                file = next(file for file in self.geojson_files if Path(file).stem == operation_file)

                if not file:
                    continue

                print(f"    -- Start Transfer for {file}")

                operation.read_data_from_file(file)

                features_for_insert, features_for_update, features_for_close, ids_from_db = Dispatcher(
                    operation.data,
                    operation.id_field_name,
                    operation.possible_missing_fields,
                    operation_file,
                    operation.connector,
                ).comparing_nav_objects()

                print(f"        -- Features for insert {len(features_for_insert)}")
                print(f"        -- Features for update {len(features_for_update)}")
                print(f"        -- Features for close {len(features_for_close)}")

                operation.ids_from_db = ids_from_db
                operation.features_for_insert = operation.prepare_data(features_for_insert)
                operation.features_for_update = operation.prepare_data(features_for_update)
                operation.features_for_close = features_for_close

                operation.insert_data()
                operation.update_data()
                operation.close_data()

        self.db_logic_creator.aixm_logic()

    def date_by_circle(self, circle):
        year = datetime.datetime.strptime(circle[:2], "%y").date()
        return self.circle_by_date(year, int(circle[2:]))

    @staticmethod
    def circle_by_date(date, step):
        bearing = datetime.date(2018, 1, 4)
        days = date - bearing
        count_circle = math.floor(days.days / 28) + step
        return bearing + datetime.timedelta(days=count_circle * 28)

    def create_all_tables(self):
        Base.metadata.create_all(connection.engine)
