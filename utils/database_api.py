import os
from services.AeroTransfer import AeroTransfer
from Preparation.Preparation import Preparation


OPERATION_TYPE = os.getenv("OPERATION_TYPE")


if __name__ == "__main__":

    """
    Временно прописывам лобовое апи
    """
    print("--------------------")
    print(" Working with DB and JSON")
    print("--------------------")

    if OPERATION_TYPE == "preparation":
        preparation = Preparation()
        preparation.run()

    elif OPERATION_TYPE == "insert":
        transfer = AeroTransfer()
        transfer.insert_to_db()

    elif OPERATION_TYPE == "sql_script":
        transfer = AeroTransfer()
        transfer.insert_sql_script()

