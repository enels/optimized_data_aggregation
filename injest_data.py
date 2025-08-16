from data_class import LoadData

if __name__ == "__main__":
    
    data = "sales_data.csv"

    # create the object to load data into database
    data_handler = LoadData(data)

    # establish connection to database
    data_handler.establish_db_connection()

    # load data into database
    data_handler.load_data_to_dbase()

    data_handler.close_db_connection()

