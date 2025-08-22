import psycopg2, database.connection_details as connection_details

class DBConnect:

    def __init__(self):
    """
        Initialize the various connection parameters
    """
        self.db_name = connection_details.db_name # database name
        self.db_user = connection_details.db_user # database user
        self.db_password = connection_details.db_password # database password
        self.conn = ""

    def connect(self) -> bool:
    """Returns True
        
        Initiate a connection to the database using the initialized connection parameters
    """

        try:
            self.conn = psycopg2.connect("dbname={0} user={1} password={2}".format(self.db_name, self.db_user, self.db_password))

        except Exception as e:
            print("Error: ", e)

        return True

    def close_connection(self):
        """Returns True

            Closes a connection
        """
        self.conn.close()
        
        return True
