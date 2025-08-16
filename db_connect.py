# import the necessary files
import psycopg2, connection_details

"""
connection_details: contains the hard coded details of the database connection to be established
psycopg2: helps in establishing the database connection
"""

class DBConnect:

    def __init__(self):
        self.db_name = connection_details.db_name # database name
        self.db_user = connection_details.db_user # database user
        self.db_password = connection_details.db_password # database password
        self.conn = ""

    def connect(self):

        try:
            self.conn = psycopg2.connect("dbname={0} user={1} password={2}".format(self.db_name, self.db_user, self.db_password))

        except Exception as e:
            print("Error: ", e)

        print("Connection Successful!")

    def close_connection(self):
        self.conn.close()
        
        print("connection close")
