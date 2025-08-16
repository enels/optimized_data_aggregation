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
