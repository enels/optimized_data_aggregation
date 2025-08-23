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

        print("Monthly Sales Summaries Execution time: {:.4f}".format(execution_time))

        self.assertLess(execution_time, 0.001)

    def test_monthly_sales_summary_query_performance_filtering_by_product(self):
            
        query = "SELECT EXTRACT (MONTH FROM date) AS month, EXTRACT (YEAR FROM date) as year, region_name, \
                COUNT(product_id) AS quantity_sold, COUNT(product_id) * products.price AS \
                 total_sales, product_name FROM sales LEFT JOIN products USING(product_id) \
                 LEFT JOIN regions USING (region_id) WHERE product_id = {} GROUP BY \
                 (month, year, products.price, product_name, region_name) ORDER BY month ASC;".format(4)
                
        start_time = time.time()
        self.cursor.execute(query)
        self.cursor.fetchall()
        end_time = time.time()
        execution_time = end_time - start_time

        print("Monthly Summaries by Product Execution time: {:.4f} seconds".format(execution_time))

        self.assertLess(execution_time, 0.001)

    def test_monthly_sales_summary_query_performance_filtering_by_region(self):
            
        query = "SELECT EXTRACT (MONTH FROM date) AS month, EXTRACT (YEAR FROM date) as year, region_name, \
                COUNT(product_id) AS quantity_sold, COUNT(product_id) * products.price AS \
                 total_sales, product_name FROM sales LEFT JOIN products USING(product_id) \
                 LEFT JOIN regions USING (region_id) WHERE region_id = {} GROUP BY \
                 (month, year, products.price, product_name, region_name) ORDER BY month ASC;".format(3)
                
        start_time = time.time()
        self.cursor.execute(query)
        self.cursor.fetchall()
        end_time = time.time()
        execution_time = end_time - start_time

        print("Monthly Summaries by Region Execution time: {:.4f}seconds".format(execution_time))

        self.assertLess(execution_time, 0.001)

    def test_monthly_sales_summary_query_performance_filtering_by_date_range(self):
            
        query = "SELECT EXTRACT (MONTH FROM date) AS month, EXTRACT (YEAR FROM date) as year, region_name, \
                COUNT(product_id) AS quantity_sold, COUNT(product_id) * products.price AS \
                 total_sales, product_name FROM sales LEFT JOIN products USING(product_id) \
                 LEFT JOIN regions USING (region_id) WHERE date >= '{}' and date <= '{}' GROUP BY \
                 (month, year, products.price, product_name, region_name) ORDER BY month \
ASC;".format('2024-02-01','2024-03-30')
                
        start_time = time.time()
        self.cursor.execute(query)
        self.cursor.fetchall()
        end_time = time.time()
        execution_time = end_time - start_time

        print("Monthly Summaries by Range Execution time: {:.4f}seconds".format(execution_time))

        self.assertLess(execution_time, 0.001)

    def test_query_performance_for_the_top_five_revenue(self):
            
        query = "SELECT product_id, product_name, COUNT(product_id) * price AS total_revenue \
                 FROM sales INNER JOIN products USING(product_id) \
                 GROUP BY (price,product_id,product_name) \
                 ORDER BY total_revenue DESC LIMIT 5"
                
        start_time = time.time()
        self.cursor.execute(query)
        self.cursor.fetchall()
        end_time = time.time()
        execution_time = end_time - start_time

        print("Monthly Summaries by Top 5 Revenue Products Execution time: {:.4f}seconds".format(execution_time))

        self.assertLess(execution_time, 0.001)

if __name__ == '__main__':
    unittest.main()
