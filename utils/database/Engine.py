import os
import psycopg2
from sqlalchemy import URL, create_engine, inspect
from sqlalchemy.ext.asyncio import create_async_engine
from env_creator import proj_env


class Engine:
    def __init__(self):

        env_mother_props = proj_env.get_mother_props()
        self.user = env_mother_props["user"]
        self.password = env_mother_props["password"]
        self.host = env_mother_props["address"]
        self.port = env_mother_props["port"]
        self.database = env_mother_props["name"]
        self.db = None
        self.cursor = None
        self.engine = None
        self.async_engine = None

    def create_engine(self):
        url_object = URL.create(
            "postgresql",
            username=self.user,
            password=self.password,
            host=self.host,
            port=self.port,
            database=self.database
        )
        self.engine = create_engine(url_object, future=True)

    def create_async_engine(self):
        async_url_object = URL.create(
            "postgresql+asyncpg",
            username=self.user,
            password=self.password,
            host=self.host,
            port=self.port,
            database=self.database
        )
        self.async_engine = create_async_engine(async_url_object, future=True)

    def create_cursor(self):
        self.db = psycopg2.connect(
            user=self.user,
            password=self.password,
            host=self.host,
            port=self.port,
            database=self.database

        )
        self.cursor = self.db.cursor()

    def check_db_is_empty(self):
        empty = not inspect(self.engine).has_table("airportheliport")
        return empty

    def get_exist_tables(self):
        tables = inspect(self.engine).get_table_names(schema="public")
        return tables

    def connect(self):
        self.create_cursor()
        self.create_engine()
        self.create_async_engine()


connection = Engine()
connection.connect()
