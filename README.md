# A Python application that ingests CSV data into an SQL database (PostgreSQL) and provides optimized analytical
# reports through RESTapi endpoints(Python, Postgresql, Flask(No ORM))
        
#### The data ingestion process works like a set pipeline processing files stored in a list, extracting and storing
#### the data in a postgres database while performing error checking and validation along the way.

The data to be ingested into the database is a list of csv files that is stored in a directory(data).
 
The program loops through the data list and collect each of the file stored in the list index for error checking and validation.
 If the program encounters any error during error checking, it terminates the program flow.  During validation, if it encounteres any validation eror, the program won't run the code to ingest data into the database.

To run the program simply restore the database file which is located in the database folder, ingest the data,
and then run the analytical RESTapi endpoints. Run the following two commands in sequence.

python ingest_data.py
python app.py

The software requirements for running the applications is in the requirements.txt file
