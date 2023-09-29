from os.path import join
import re
from env_creator import proj_env
from database.Engine import connection

SQL_FILE = (
    "utils/sql_storage/funcs.sql",
    "utils/sql_storage/views_creation.sql",
    "utils/sql_storage/frame_procedures.sql",
    "utils/sql_storage/area_mat_views.sql",
    "utils/sql_storage/sid_mat_views.sql",
    "utils/sql_storage/index_creation.sql",
    "utils/sql_storage/simple_procedures.sql",
    "utils/sql_storage/area_procedures.sql",
    "utils/sql_storage/sid_procedure.sql",
    "utils/sql_storage/functions_on_materialized.sql",
    "utils/sql_storage/sid_to_map_procedure.sql",
    "utils/sql_storage/refresh_views.sql"
)

class MotherBaseLogicCreator:

    def __init__(self, folder):

        for key, value in proj_env.get_dbLogicCreator_props().items():
            setattr(self, key, value)
        self.folder = folder
        self.xml_transfer = None

        # order is VERY important
        self.sql_migrate = (
            "aixm.sql",
            "tables_creation.sql",
            "channel_frequency_pair.sql",
            "funcs.sql"
        )

        self.sql_logic = (
            "funcs.sql",
            # "views_creation.sql",
            # "simple_procedures.sql",
            # "area_mat_views.sql",
            # "sid_to_map_procedure.sql",
            # "refresh_views.sql",
            # "functions_on_materialized.sql",
            # "index_creation.sql"
        )

    def aixm_migrate(self):
        for sql_file in self.sql_migrate:
            print(f"sql_file = {sql_file}")
            self.exec_sql_file(join(self.folder, sql_file))

        if self.add_srid:
            self.exec_sql_file(join(self.folder, 'add_srid.sql'))

    def aixm_logic(self):
        print("-- Start executing sql scripts")
        for sql_file in self.sql_logic:
            print(f"    -- Start executing {sql_file}")
            self.exec_sql_file(join(self.folder, sql_file))

    @staticmethod
    def exec_sql_file(sql_file):
        statement = ""
        for line in open(sql_file):
            if re.match(u'--', line) or re.match('﻿--', line):
                continue
            elif not re.search(r';$', line):
                statement = statement + line
            else:
                statement = statement + line
        connection.cursor.execute(statement)
        connection.db.commit()

    def insert_sql_script(self):
        for file in SQL_FILE:
            print(file)
            self.exec_sql_file(file)
        print("end")
