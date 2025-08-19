from utilities.load_data import LoadData
from utilities.validate_data import ValidateData
from utilities.file_error_checker import FileErrorCheck

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

    #file_path = "data/products_data.csv"
    file_path = "data/test_tbl.csv"

    
    ########## checks for any error in file ############

    status = FileErrorCheck(file_path)

    "get the file name"
    file_name = status.get_file_name()
    print(file_name)

    # check for any error(s) in file
    file_errors = status.get_file_errors()
    
    # if there were file errors, skips file validation process
    if len(file_errors) > 0:
       for k,v in file_errors.items():
          print(k)
    else:
       ########### validate data in file #############
       data_handler = ValidateData(file_path)

       # first, open file for validation
       data_handler.open_file_for_validation()

       # validate number of columns in the csv file
       data_handler.validate_num_of_columns()

       # validate the column names
       # this checks if the column names in the csv file matches
       # what is in the database
       data_handler.validate_correct_header_names()

       # checks if the entire data validation process was successful
       # if it didn't, program raises an exception
       validation_errors = data_handler.get_validation_errors()
    
       # validate the consistency of the delimiter
       data_handler.validate_delimiter_consistency()

       # validate the datatype of the various data on the columns
       # of the csv file
       #data_handler.validate_datatype()


       # if none of fthe above validation failes, get the validated data
       # Note that validated data is in List of Tuples
       validated_data = data_handler.get_validated_data()

    # checks if there were errors in file validation process,skips data loading
    if len(validation_errors) > 0:
       for k,v in validation_errors.items():
          print(k.format(file_name))
       raise Exception ("Data was not loaded into database due to validation error(s).")
    else:
       print("...load data")

    ########## Load Validated Data Into Database ###################

    # create the object to load the validated data into the database
    table_name = file_name.split(".")[0]
    validated_data_handler = LoadData(validated_data, table_name)

    # load data into database
    validated_data_handler.load_data_to_dbase()

    # close database connection
    #validated_data_handler.close_db_connection()
