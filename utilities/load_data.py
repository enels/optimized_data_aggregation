# for collecting database connection details
from db_connect import DBConnect


class LoadData(DBConnect):

    
    def __init__(self, data):

        super().__init__()

        # validated data list to be loaded into database
        self.__data = data

    def load_data_to_dbase(self):
        pass

    def __get_product_id(self, product_name):
        pass

    def __get_region_id(self, region):
        pass
    
    def __get_country_id(self, country):
        pass
