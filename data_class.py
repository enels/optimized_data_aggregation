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

class ValidateData(DBConnect):


    def __init__(self, file_path):

        self.file_path = file_path
        self.__header_names = None
        self.data = list()
        self.current_status = list()

        super().__init__()

    def __get_table_name(self):

        """ Get the table name that the data
            will be ingested into

            Note that, the name part of the filename should
            be set as the already created table name in the
            database
        """
        table_name = self.file_path.split("/")[-1].split(".")[0]

        return table_name

    def __get_column_names(self):

        """
            Get the column names from the designated table for
            the data to be loaded.

            Note again that the name part ofthe filename should
            be set as the already created table in the database.

            This is to enable the program know what to do.
        """

        # get table name
        table_name = self.__get_table_name()

        # get column name
        super().connect()

        # query to get the column names
        query = "SELECT column_name FROM (SELECT * from information_schema.columns WHERE table_schema = 'public' AND table_name = '{}')".format(table_name)

        cur = self.conn.cursor()
        cur.execute(query)
        column_names = cur.fetchall()
        
        return column_names

    def open_file_for_validation(self):

        n_nonempty_rows = 0

        with open(self.file_path) as csv_file:

            csv_reader = csv.reader(csv_file, delimiter=',')

            n_nonempty_rows = 0 # keeps count of the number of rows

            # read the columns before reading the contents
            # since the first row is the column

            for row in csv_reader:
                if not row:
                    print("empty row")
                    continue

                n_nonempty_rows += 1
                if n_nonempty_rows == 1:
                    # store the column header row
                    # assuming it's the header
                    self.__header_names = row
                    continue

                # store the other data
                self.data.append(tuple(row))

        
    def  validate_num_of_columns(self):

        column_names = self.__get_column_names()

        if len(self.__header_names) == len(column_names):
            self.current_status.append(True)
        else:
            self.current_status.append(False)
            
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

    
    def _extract_file_name(self):

        """
            Extracts the file name
        """

        if "/" in self.file_path:
            self.file_name = self.file_path.split("/")[-1]
        else:
            self.file_name = self.file_path

    def get_file_name(self):

        # checks file for errors
        self._check_file()

        # extract the file name from the file path
        # checks if file name is already set
        if self.file_name == "":
            self._extract_file_name()
        
        # return file name
        return self.file_name

    def _check_file(self):


        try:
            with open(self.file_path) as csv_file:

                csv_reader = csv.reader(csv_file, delimiter=',')

        except FileNotFoundError:
            self._extract_file_name()
            print("Error: The csv file with name {0} cannot be found".format(self.file_name))

        # check for bad file format
        except csv.Error as e:
            print("Error: {}".format(e))

        # check for characters that are outside the unicode system
        except UnicodeDecodeError:
            print("Error: File contains illegal character")

        # Miscellaneuos errors
        except Exception as e:
            print("Unexpected error: {}".format(e))
