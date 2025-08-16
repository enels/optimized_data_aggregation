# csv file library for working with csv
import csv 

 # for collecting database connection details
from db_connect import DBConnect

class LoadData:

    
    def __init__(self, data):

        # data list to be loaded into database
        self.data = data
        
        # create connection object
        self.connection_handle = DBConnect()

    def establish_db_connection(self):

        # try establishing connection
        self.connection_handle.connect()

    def close_db_connection(self):
        self.connection_handle.close_connection()

    def load_data_to_dbase(self):
        pass
