import psycopg2

conn = psycopg2.connect("dbname=testdb user=postgres password=9@$$w07D")

cur = conn.cursor()

print(f'cursor: {cur}')
cur.execute("INSERT INTO test_tbl(name, levy) VALUES('John Doe', 500.32)")

#records = cur.fetchall()
conn.commit()
conn.close()
#print(records)
