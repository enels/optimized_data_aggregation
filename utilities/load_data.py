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
