import unitttest
import psycopg2
import time
import db_connect


class TestQueryPerformance(unittest.TestCase):
    def setUp(self):

            # connet to the database
            self.conn = DBconnect
            self.cursor = self.conn.connect().cursor()

    def tearDown(self):
            self.conn.close()



if __name__ == '__main__':
    unittest.main()
