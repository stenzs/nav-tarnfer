import os
import datetime
import math
from env_creator import proj_env
from services.MotherBaseLogicCreator import MotherBaseLogicCreator
from database.Engine import connection
from Transfer.Geojson.Transfer import Transfer


ROOT_DIR = os.getenv("ROOT_DIR")


class AeroTransfer:

    def __init__(self):
        for key, value in proj_env.get_navtransfer_props().items():
            setattr(self, key, value)

        self.sql_storage_path = "utils/sql_storage"

        if self.local:
            self.folder = f"{ROOT_DIR}/{self.folder}"
            self.sql_storage_path = f"{ROOT_DIR}/utils/sql_storage"
            os.environ["MOTHER_ADDRESS"] = os.getenv("LOCAL_MOTHER_ADDRESS")

        self.valid_date = self.date_by_circle(self.airac)
        self.valid_date_str = str(self.valid_date)
        self.list_files = self.set_list_files()

        self.xml_transfer = None
        self.db_logic_creator = MotherBaseLogicCreator(self.sql_storage_path)

    def set_list_files(self):
        try:
            return sorted(os.listdir(self.folder))
        except FileNotFoundError:
            print(self.folder)
            print("Wrong path to files or no files")

    @staticmethod
    def date_by_circle(circle):
        date = datetime.datetime.strptime(circle[:2], '%y').date()
        step = int(circle[2:])
        bearing = datetime.date(2018, 1, 4)
        days = date - bearing
        count_circle = math.floor(days.days / 28) + step
        return bearing + datetime.timedelta(days=count_circle * 28)

    def check_db(self):
        empty = connection.check_db_is_empty()
        if empty:
            self.db_logic_creator.aixm_migrate()

    def insert_to_db(self):
        self.check_db()
        self.insert_geojson()
        # self.insert_xml()
        self.db_logic_creator.aixm_logic()

    def insert_geojson(self):
        print(' Insert JSON to DB')
        print('--------------------')
        Transfer().run()
