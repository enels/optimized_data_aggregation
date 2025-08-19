import psycopg2#, jsonify
from flask import Flask, jsonify, make_response

app = Flask(__name__)

def get_connection():

    conn = psycopg2.connect("dbname=testdb user=postgres password=9@$$w07D")

    print("Connection Successful")

    return conn

@app.route("/users", methods = ['GET'])
def index():

    print(psycopg2.__version__)

    conn = get_connection()
    cur = conn.cursor()

    #cur.execute("SELECT json_agg(q) AS tbl FROM(SELECT * FROM test_tbl) AS q") 
    cur.execute("SELECT * FROM test_tbl") 

    records = cur.fetchall()
    conn.close()

    return make_response(jsonify(records))

@app.route("/addusers", methods = ['POST'])
def addusers():

    conn = get_connection()

    cur = conn.cursor()
    try:
        cur.execute("INSERT INTO test_tbl (name) VALUES('Magdalene')")
        conn.commit()
    except Exception as e:
        print("Error: ", e)
    finally:
        conn.close()
    
    return make_response(jsonify({"name": "Magdalene"}), 201)

@app.route("/getuser/<id>", methods = ['GET'])
def get_users_by_id(id):

    conn = get_connection()
    cur = conn.cursor()

    try:
        cur.execute("SELECT * FROM test_tbl WHERE id = {}".format(id))
    except Exception as e:
        print("Error: ", e)
    
    records = cur.fetchall();
    cur.close() # close cursor

    return make_response(jsonify(records))
        
