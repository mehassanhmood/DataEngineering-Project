# Import libraries required for connecting to mysql

# Import libraries required for connecting to DB2 or PostgreSql
import psycopg2
from psycopg2 import extras
import mysql.connector
# Connect to MySQL
mysql_conn = mysql.connector.connect(user='root',password='Password1234',host='127.0.0.1',database='sales')
mysql_cursor = mysql_conn.cursor()
# Connect to  PostgreSql
pg_conn = psycopg2.connect(user='postgres',password='Password1234',host='127.0.0.1',port='5432',database='sales')
pg_cursor = pg_conn.cursor()
# Find out the last rowid from DB2 data warehouse or PostgreSql data warehouse
# The function get_last_rowid must return the last rowid of the table sales_data on the IBM DB2 database or PostgreSql.

def get_last_rowid():
    sql = 'SELECT MAX(row_id) FROM sales_data;'
    pg_cursor.execute(sql)
    last_rowID = pg_cursor.fetchone()[0]
    return last_rowID


last_row_id = get_last_rowid()
print("Last row id on production datawarehouse = ", last_row_id)

# List out all records in MySQL database with rowid greater than the one on the Data warehouse
# The function get_latest_records must return a list of all records that have a rowid greater than the last_row_id in the sales_data table in the sales database on the MySQL staging data warehouse.

def get_latest_records(rowid):
    my_sql = 'SELECT * FROM sales_data WHERE rowid > %s;'
    mysql_cursor.execute(my_sql, (rowid,))
    new_records = mysql_cursor.fetchall()
    return new_records

new_records = get_latest_records(last_row_id)

print("New rows on staging datawarehouse = ", len(new_records))

# Insert the additional records from MySQL into DB2 or PostgreSql data warehouse.
# The function insert_records must insert all the records passed to it into the sales_data table in IBM DB2 database or PostgreSql.

def insert_records(records):
    table_name = 'sales_data'
    try: 
        insert_query = f'INSERT INTO {table_name} (row_id, product_id, customer_id, quantity) VALUES %s;'
        extras.execute_values(pg_cursor,insert_query,records)
        pg_conn.commit()
        print('Command executed succesfully')

    except psycopg2.Error as e:
        print(f'Error: {e}')

insert_records(new_records)
print("New rows inserted into production datawarehouse = ", len(new_records))

# disconnect from mysql warehouse
mysql_conn.close()
# disconnect from DB2 or PostgreSql data warehouse 
pg_conn.close()
# End of program