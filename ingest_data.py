from data_class import LoadData, ValidateData, FileErrorCheck

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

    file_path = "data/products_data.csv"

    
    ########## checks for any error in file ############

    status = FileErrorCheck(file_path)

    "get the file name"
    file_name = status.get_file_name()

    """
    ########### validate data in file #############

    data_handler = ValidateData(file_path)

    # remove any initial white spaces
    data_handler.remove_any_initial_whitespace()

    # validate number of columns in the csv file
    data_handler.validate_num_of_columns()

    # validate the consistency of the delimiter
    data_handler.validate_delimiter_consistency()

    # validate the column names
    # this checks if the column names in the csv file matches
    # what is in the database
    data_handler.validate_correct_header_names()

    # validate the datatype of the various data on the columns
    # of the csv file
    data_handler.validate_datatype()

    # checks if the entire data validation process was successful
    # if it didn't, program raises an exception
    if False in data_handler.get_current_status():
        raise Exception ("Data not validated, Please check csv file.")

    # if none of fthe above validation failes, get the validated data
    # Note that validated data is in List of Tuples
    validated_data = data_handler.get_validated_data()


    ########## Load Validated Data Into Database ###################

    # create the object to load the validated data into the database
    validated_data_handler = LoadData(validated_data)

    # establish connection to database
    validated_data_handler.establish_db_connection()

    # load data into database
    validated_data_handler.load_data_to_dbase()

    # close database connection
    validated_data_handler.close_db_connection()
    """
