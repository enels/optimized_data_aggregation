import unittest
import psycopg2
import time
from db_connect import DBConnect


class TestQueryPerformance(unittest.TestCase):
    def setUp(self):

        # connet to the database
        self.conn = DBConnect()
        self.conn.connect()

        self.cursor = self.conn.conn.cursor()

    def tearDown(self):
        self.conn.close_connection()

    def test_monthly_sales_summary_query_performance(self):
            
        query = "SELECT EXTRACT (MONTH FROM date) AS month, region_name, COUNT(product_id) * products.price AS \
                 total_sales, product_name FROM sales LEFT JOIN products USING(product_id) LEFT JOIN \
                 regions USING (region_id) GROUP BY (month, products.price, product_name, region_name) ORDER BY month ASC;"

        start_time = time.time()
        self.cursor.execute(query)
        self.cursor.fetchall()
        end_time = time.time()
        execution_time = end_time - start_time

        print("Execution time: {:.4f}".format(execution_time))

        self.assertLess(execution_time, 0.001)


if __name__ == '__main__':
    unittest.main()
