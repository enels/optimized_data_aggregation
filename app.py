import psycopg2
from flask import Flask, jsonify, make_response
from db_connect import DBConnect

app = Flask(__name__)

def get_connection():

    # instantiate the connection class
    conn = DBConnect()

    # connect to the database
    conn.connect()

    # return the connection
    return conn.conn

@app.route("/monthly-sales-summaries", methods = ['GET'])
def index():

    print(psycopg2.__version__)

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT EXTRACT (MONTH FROM date) AS month, EXTRACT (YEAR FROM date) as year, \
                region_name, COUNT(product_id) AS quantity_sold, COUNT(product_id) * products.price AS total_sales, product_name \
                FROM sales LEFT JOIN products USING(product_id) \
                LEFT JOIN regions USING (region_id) GROUP BY \
                (month, year, products.price, product_name, region_name) ORDER BY month ASC")

    records = cur.fetchall()
    conn.close()

    return make_response(jsonify(records))


@app.route("/monthly-sales-summaries/<product_id>", methods = ['GET'])
def get_product_by_id(product_id):

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute("SELECT EXTRACT (MONTH FROM date) AS month, EXTRACT (YEAR FROM date) as year, \
                region_name, COUNT(product_id) AS quantity_sold, COUNT(product_id) * products.price AS total_sales, product_name \
                FROM sales LEFT JOIN products USING(product_id) \
                LEFT JOIN regions USING (region_id) WHERE product_id = {} GROUP BY \
                (month, year, products.price, product_name, region_name) ORDER BY month ASC".format(product_id))

    except Exception as e:
        print("Error: ", e)
    
    records = cur.fetchall();
    cur.close() # close cursor

    return make_response(jsonify(records))


@app.route("/products/<product_id>", methods = ['GET'])
def get_sales_by_region(region_id):

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute("SELECT * FROM sales WHERE product_id = {}".format(sales_id))
    except Exception as e:
        print("Error: ", e)
    
    records = cur.fetchall();
    cur.close() # close cursor

    return make_response(jsonify(records))


if __name__ == "__main__":
    app.run()
