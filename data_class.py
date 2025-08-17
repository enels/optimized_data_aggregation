# csv file library for working with csv
import csv 

 # for collecting database connection details
from db_connect import DBConnect

class LoadData(DBConnect):

    
    def __init__(self, data):

        super().__init__()

        # data list to be loaded into database
        self.data = data

    def establish_db_connection(self):

        # try establishing connection
        super().connect()

    def close_db_connection(self):

        # close connection
        super().close_connection()

    def load_data_to_dbase(self):
        pass

    def _get_product_id(self, product_name):
        pass

    def _get_region_id(self, region):
        pass
    
    def _get_country_id(self, country):
        pass

class ValidateData(LoadData):


    def __init__(self, filename):

        self.filename = filename
        self.header = list()
        self.data = list()
        self.current_status = list()

        super().__init__()

    def  validate_num_of_columns(self):
        pass
    
    def validate_delimiter_consistency(self):
        pass
    
    def validate_correct_header_names(self):
        pass

    def validate_datatype(self):
        pass

    def remove_any_initial_whitespace(self):
        pass

    def _get_column_names(self):
        pass

    def get_validated_data(self):
        pass

    def get_current_status(self):
        
        return self.current_status

class FileErrorCheck:

    def __init__(self, file_path):
        
        self.file_path = file_path
        self.file_name = ""

    def check_file(self):

        try:
            with open(self.filename) as csv_file:

                csv_reader = csv.reader(csv_file, delimiter=',')

        except FileNotFoundError:
            print("Error: The csv file with name {0} cannot be found".format(file))

        # check for bad file format
        except csv.Error as e:
            print("Error: {}".format(e))

        # check for characters that are outside the unicode system
        except UnicodeDecodeError:
            print("Error: File contains illegal character")

        # Miscellaneuos errors
        except Exception as e:
            print("Unexpected error: {}".format(e))
