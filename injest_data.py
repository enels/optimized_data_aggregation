from data_class import LoadData

if __name__ == "__main__":
    
    """
        the data is a list of csv files that is stored in the data variable
        the program loops through the data list and collect each of the file
        stored in the list index for error checking and validation.

        All you have to do is make changes to the database connection file to match
        what you have and add more files to the the data list object for iteration

        But first, make sure you have created a database and create tables in it to match
        the possible columns you may have in the csv file.
    """

    data = "sales_data.csv"

    # create the object to load data into database
    data_handler = LoadData(data)

    # establish connection to database
    data_handler.establish_db_connection()

    # load data into database
    data_handler.load_data_to_dbase()

    data_handler.close_db_connection()

