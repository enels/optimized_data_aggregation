# csv file library for working with csv
import csv 

# import database connectivity class
from db_connect import DBConnect


class ValidateData(DBConnect):


    def __init__(self, file_path):

        self.file_path = file_path
        self.__header_names = None
        self.data = list()
        self.__validation_errors = dict()

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
            pass
        else:
            self.__validation_errors['Validation Error: Number of columns in csv file {} \
                    does not match with number of columns in table'] = True
            
    def validate_delimiter_consistency(self):
        pass
    
    def validate_correct_header_names(self):

        column_names = self.__get_column_names()

        # compare lower cases of each coloumn names and
        # header names in file


        # first, make sure the length are the same
        if len(self.__header_names) == len(column_names):
            for idx in range(len(self.__header_names)):

                # check if they are both equal - the column name from the database
                # and the column name from the csv file
                if self.__header_names[idx].lower() == column_names[idx][0].lower():
                    pass

                # if they are not, append false to the current validation status
                # then break out of loop
                else:
                    self.__validation_errors['Validation Error: Column names in csv file {} does \
                    not match with column names in table'] = True
                    break

    def validate_datatype(self):
        pass

    def remove_any_initial_whitespace(self):
        pass

    def get_validated_data(self):
        
        return self.data

    def get_validation_errors(self):
        
        return self.__validation_errors
