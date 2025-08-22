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

@app.route("/products", methods = ['GET'])
def index():

    print(psycopg2.__version__)

    conn = get_connection()
    cur = conn.cursor()

    cur.execute("SELECT product_name, price*5 AS new_price FROM products ORDER BY new_price ASC LIMIT 5")

    records = cur.fetchall()
    conn.close()

    return make_response(jsonify(records))


@app.route("/products/<product_id>", methods = ['GET'])
def get_product_by_id(product_id):

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute("SELECT * FROM products WHERE product_id = {}".format(product_id))
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
