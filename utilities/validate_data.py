# csv file library for working with csv
import csv 

# import database connectivity class
from db_connect import DBConnect


class ValidateData(DBConnect):


    def __init__(self, file_path):

        self.file_path = file_path
        self.__header_names = None
        self.__data = list()
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

    def __get_datatypes(self):


        """
            Get the datatypes of the table column names
        """

        # get table name
        table_name = self.__get_table_name()

        # get column name
        super().connect()

        # query to get the column names
        query = "SELECT data_type FROM (SELECT * from information_schema.columns WHERE table_schema = 'public' AND table_name = '{}')".format(table_name)

        cur = self.conn.cursor()
        cur.execute(query)
        data_types = cur.fetchall()

        # close database connection
        super().close_connection()

        return data_types
        
    def get_column_names(self):

        """
            Get the column names from the designated table for
            the data to be loaded.

            Note again that the name part of the filename should
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
        
        # close database connection
        super().close_connection()

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
              self.__data.append(tuple(row))


    def  validate_num_of_columns(self):

        column_names = self.get_column_names()

        if len(self.__header_names) == len(column_names) - 1:
            pass
        else:
            self.__validation_errors['ColumnNamesCountError'] = 'Number of columns in csv file {} \
does not match with number of columns in table'
            
    def validate_order_of_column_names(self):
        
        column_names = self.get_column_names()

        for idx in range(len(column_names)-1):
            if column_names[idx] == self.__header_names[idx]:
                pass
            else:
                self.__validation_errors['ColumnNamesOrderMismatchError'] = 'Column names in csv file is not in the same order \
as the table column names order'

    def validate_delimiter_consistency(self):
        """
            Validates delimiter consistency across the data and eliminates rows
            thas has missing values
        """

	# get column names
        column_names = self.get_column_names()

        column_names_len = len(column_names) - 1


	# get the entire total record on the dataset
        total_rows_in_data = len(self.__data)

        for idx in range(total_rows_in_data):

	    # checks if row has a missing value
            if  "" in self.__data[idx] or column_names_len != len(self.__data[idx]):

			   # delete empty row or row with missing column values
               del(self.__data[idx])
    
    def validate_correct_header_names(self):

        column_names = self.get_column_names()

        # compare lower cases of each coloumn names and
        # header names in file

        column_names_len = len(column_names) - 1 # minus the index(id) column

        # first, make sure the length are the same
        if len(self.__header_names) == column_names_len:
            for idx in range(1, len(column_names)): # excluding the index(id) column

                # check if they are both equal - the column name from the database
                # and the column name from the csv file
                if self.__header_names[idx - 1].lower() == column_names[idx][0].lower():
                    pass

                # if they are not, append false to the current validation status
                # then break out of loop
                else:
                    self.__validation_errors['ColumnNameMismatchError'] = 'Column names in csv file {} does \
not match with column names in table'
                    break

    def validate_datatype(self):

        """
            Validates the datatypes in each data of the csv file with the data types on the table column
            If the data types does not match, it raises an exception

            Limitations: Please note that this file only validates the integer, float, and char data types
        """
        
        column_data_types = self.__get_datatypes()

        for i in range(len(column_data_types) - 1):
            for j in range(len(self.__data)):
                try:

                    print(column_data_types[i][0])
                    print(self.__data[j][i])

                    if (column_data_types[i][0] == 'integer' and type(self.__data[j][i]) == int) or \
                            (column_data_types[i][0] == 'character varying') and (type(self.__data[j][i]) == str) or \
                            (column_data_types[i][0] == 'numeric') and (type(float(self.__data[j][i])) == float):
                        pass
                    else:
                        pass
                except ValueError:
                    self.__validation_errors['DataTypeError: '] = 'Invalid data type in csv file'

    def get_validated_data(self):
        
        return self.__data

    def get_validation_errors(self):
        
        return self.__validation_errors
