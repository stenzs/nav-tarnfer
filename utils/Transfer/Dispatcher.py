from database.Engine import connection


class Dispatcher:

    def __init__(self, data_from_file, id_field_name, possible_missing_fields, avia_type, connector):
        self.data_from_file = data_from_file
        self.id_field_name = id_field_name
        self.avia_type = avia_type
        self.possible_missing_fields = possible_missing_fields
        self.connector = connector

    def comparing_nav_objects(self):

        ids_from_db = {}
        data_from_db = self.create_list_from_db()

        for feature in data_from_db:
            ids_from_db.setdefault(feature[self.id_field_name], feature["uuid"])
        ids_from_file = [feature["properties"][self.id_field_name] for feature in self.data_from_file["features"]]

        features_for_update = [feature for feature in self.data_from_file["features"]
                               if feature["properties"][self.id_field_name] in ids_from_db]
        features_for_insert = [feature for feature in self.data_from_file["features"]
                               if feature["properties"][self.id_field_name] not in ids_from_db]
        features_for_delete = [feature for feature in data_from_db if feature[self.id_field_name] not in ids_from_file]

        return features_for_insert, features_for_update, features_for_delete, ids_from_db

    def create_list_from_db(self):

        target_table_name = f"{self.avia_type}_data"
        exist_tables_names = connection.get_exist_tables()

        if target_table_name not in exist_tables_names:
            return []

        data_from_db = self.connector.perform_query_with_json(query=f"select * from \"{target_table_name}\"")

        if not data_from_db:
            return []

        return data_from_db
