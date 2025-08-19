# for collecting database connection details
from db_connect import DBConnect


class LoadData(DBConnect):

    
    def __init__(self, data, column_names, table_name):

        super().__init__()

        # validated data list to be loaded into database
        self.__data = data
        self.__column_names = column_names
        self.__table_name = table_name
        self.__line_no = 1 # for tracking the exact line number where erro may occur in csv file

    def load_data_to_dbase(self):

        """
           Loads data into the database
        """

        # get column name
        super().connect()

        # query to get the column names
        queries = self.__generate_queries()

        cur = self.conn.cursor()

        print("...loading data")

        for query in queries:
            cur.execute(query)
            self.conn.commit()
        
        print("Data Loaded!")

        super().close_connection()

    def __generate_queries(self):

        """
          Generates queries to be executed and use to load data into database
        """

        print("...generating queries")

        generated_queries = list()

        # extract the values in string format
        values = self.__extract_data_values()
        column_names = self.__extract_column_names()

        # if the id value is not set, then an insert query to be be generated 

        if self.__table_name == 'products':
		# generates queries to insert into product table
            generated_queries.append("INSERT INTO {}({}) VALUES{}".\
format(self.__table_name, column_names, values))

        else:
            # generates queries to insert into sales table
            # first, generate ids that the _retrieve_id method
            # will be used to identify each table for their various id retrieval
            # since there are 3 tables who's ids are required in the sales table
            # an iteration over a range of 3 will e required

            # get number of rows in the sales dataset that is to be inserted into the sales
            # table
            n_rows = len(self.__data)

            # iterate through each row while collecting the required column id of each data value
            # from the various tables - products, countries, and regions
            for row_id in range(n_rows):
                required_column_ids = []

                self.__line_no += 1
            # iterate through each table to collect the id and generate the equivalent insert query
                for table_id in range(3):
                    required_column_ids.append(self.__retrieve_id(table_id, self.__data[row_id][table_id]))
                    
                # append the date value from the data
                required_column_ids.append((self.__data[row_id][table_id + 1]))

                required_column_ids = tuple(required_column_ids)

                # Next, generate the insert query to be used to insert the various data into the
                # sales table
                generated_queries.append("INSERT INTO {}({}) VALUES{}".format(self.__table_name,column_names,
required_column_ids))

	
        return generated_queries
              
    def __extract_column_names(self):
        
        # extract the values from the data in string format
        cnames = ""

        # get number of column
        column_length = len(self.__column_names[1:])

        idx = 0
        
        for name in self.__column_names[1:]:
            if idx != column_length - 1:
                cnames += name[0] + ", "
            else:
                cnames += name[0]
            idx += 1

        return cnames

    def __extract_data_values(self):
        
        # extract the values from the data in string format
        values = ""

        values_length = len(self.__data)

        values_count = 0
        
        for value in self.__data:
            if values_count != values_length - 1:
                values += str(value) + ", "
            else:
                values += str(value)
            values_count += 1

        return values
    
    def __retrieve_id(self, table_id, value):
            
        """
            Get the required id of the row based on the data value
        """

        if table_id == 0:
            # get product_id
            query = "SELECT product_id FROM products WHERE product_name = '{}'".format(value)
        elif table_id == 1:
            # get region_id
            query = "SELECT region_id FROM regions WHERE region_name = '{}'".format(value)
        elif table_id == 2:
            # get country_id
            query = "SELECT country_id FROM countries WHERE country_name = '{}'".format(value)

        super().connect()

        cur = self.conn.cursor()

        cur.execute(query)
        record = cur.fetchall()

        try:
            return record[0][0]
            #record_id = record[0][0]
        except IndexError:
            print("IndexError Caught: The requested list index is out of range")
            print("Check line number {} in {}.csv data file to correct any data mismatch or \
inconsistency".format(self.__line_no, self.__table_name))
            exit()

