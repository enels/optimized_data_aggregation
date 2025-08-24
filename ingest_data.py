from utilities.load_data import LoadData
from utilities.validate_data import ValidateData
from utilities.file_error_checker import FileErrorCheck

if __name__ == "__main__":
    
    """
        The data to be ingested into the database is a list of csv files 
        that is stored in a directory(located in the same directory as this
        file).
        
        The program loops through the data list and collect each of the file
        stored in the list index for error checking and validation.

        If the program encounters any error during error checking, it terminates
        the program flow.

        During valudation, if it encounteres any validation eror, the program won't
        run the code to ingest data into the database.

    """

    files_path = ["data/products.csv", "data/sales.csv"]
    
    ########## checks for any error in file ############

    for file_path in files_path:
        
        status = FileErrorCheck(file_path)

        #get the file name
        file_name = status.get_file_name()

        # check for any error(s) in file
        file_errors = status.get_file_errors()

        # if there were file errors, skips file validation process
        if len(file_errors) > 0:
            for k,v in file_errors.items():
                print("{0}: {1}".format(k, v))
                
                # exists program if file error found
                quit()
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
            if file_name != "sales.csv":
                data_handler.validate_correct_header_names()

                # checks the order of arrangement of the column names of
                # both the csv file and the table from database
                data_handler.validate_order_of_column_names()
                
                data_handler.check_for_availability_of_column_names()

            # checks if the entire data validation process was successful
            # if it didn't, program raises an exception
            validation_errors = data_handler.get_validation_errors()
        
            # if none of fthe above validation failes, get the validated data
            # Note that validated data is in List of Tuples
            validated_data = data_handler.get_validated_data()

            # checks if there were errors in file validation process,skips data loading
            if len(validation_errors) > 0:
                for k,v in validation_errors.items():
                    print("{0}: {1}".format(k, v))

            ########## Load Validated Data Into Database ###################

            else:
                # create the object to load the validated data into the database
                table_name = file_name.split(".")[0]
                column_names = data_handler.get_column_names()

                validated_data_handler = LoadData(validated_data, column_names, table_name)

                # ingest data into database
                validated_data_handler.load_data_to_dbase()
