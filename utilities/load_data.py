# for collecting database connection details
from db_connect import DBConnect


class LoadData(DBConnect):

    
    def __init__(self, data, column_names, table_name):

        super().__init__()

        # validated data list to be loaded into database
        self.__data = data
        self.__column_names = column_names
        self.__table_name = table_name


    def load_data_to_dbase(self):

        """
           Loads data into the database
        """

        # get column name
        super().connect()

        # query to get the column names
        queries = self.__generate_queries()

        cur = self.conn.cursor()

        print("...load data")

        for query in queries:
            cur.execute(query)
            self.conn.commit()
        
        print("Data Loaded!")

        super().close_connection()
        

    def __get_product_id(self, product_name):
        pass

    def __get_region_id(self, region):
        pass
    
    def __get_country_id(self, country):
        pass

    def __generate_queries(self, id_value=None):

        """
          Generates queries to be executed and use to load data into database
        """

        generated_queries = list()

        # extract the values in string format
        values = self.__extract_data_values()
        column_names = self.__extract_column_names()

        # if the id value is not set, then an insert query to be be generated 
        if id_value == None:
           # generate insert query

           if self.__table_name == 'products':
		# generates queries to insert into product table
              generated_queries.append("INSERT INTO {}({}) VALUES{}".\
format(self.__table_name, column_names, values))

           else:
              pass
              # generates queries to insert into products table

        else:
              pass
           # generates select query
	
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
