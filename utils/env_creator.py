from dotenv import load_dotenv
import os


class EnvCreator:
    def __init__(self):
        self.config_loader()
        print(f"working with {self.mother_address}")

    def config_loader(self):
        load_dotenv()
        self.local = eval(os.getenv("LOCAL"))

        # параметры для трансфера
        self.airac = os.getenv("AIRAC")
        self.folder = os.getenv("DATA_PATH")

        # параметры для апы
        self.host = os.getenv("TRANSFER_ADDRESS")
        self.port = os.getenv("TRANSFER_PORT")

        # непосредственно для сборщика
        self.add_srid = eval(os.getenv("ADD_SRID"))
        self.stribog = eval(os.getenv("STRIBOG"))
        self.clean_base = eval(os.getenv("CLEAN_DB"))
        self.urgent = eval(os.getenv("IS_URGENT"))
        self.stribog_region = os.getenv("STRIBOG_REGION")

        # mother base connections
        if self.local:
            self.mother_address = os.getenv("LOCAL_MOTHER_ADDRESS")
        else:
            self.mother_address = os.getenv("MOTHER_ADDRESS")
        self.mother_port = os.getenv("MOTHER_PORT")
        self.mother_name = os.getenv("MOTHER_NAME")
        self.mother_user = os.getenv("MOTHER_USER")
        self.mother_pass = os.getenv("MOTHER_PASS")

    def get_transfer_app_props(self):
        return {
            "host": self.host,
            "port": int(self.port)
        }

    def get_navtransfer_props(self):
        return {
            "airac": self.airac,
            "folder": self.folder,
            "add_srid": self.add_srid,
            "stribog": self.stribog,
            "clean_base": self.clean_base,
            "is_urgent": not self.urgent,
            "local": self.local
        }

    def get_mother_props(self):
        return {
            "address": self.mother_address,
            "port": self.mother_port,
            "name": self.mother_name,
            "user": self.mother_user,
            "password": self.mother_pass
        }

    def get_preparation_props(self):
        return {
            "folder": self.folder,
            "stribog": self.stribog,
            "stribog_region": self.stribog_region,
            "local": self.local
        }

    def get_airac(self):
        return self.airac

    def get_folder(self):
        return self.folder

    def get_dbLogicCreator_props(self):
        return {
            "folder": self.folder,
            "add_srid": self.add_srid,
            "stribog": self.stribog,
            "clean_base": self.clean_base,
        }


proj_env = EnvCreator()
