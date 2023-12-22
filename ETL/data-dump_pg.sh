#!/bin/bash

user=postgres
host=127.0.0.1
port=5432
database=sales
csv_file=./sales.csv

createdb -h $host -p $port -U $user $database

# Check if the database creation was successful
if [ $? -eq 0 ] ; then
    echo "Database $database created"
else
    echo "Failed to create database $database"
    exit 1
fi


psql_cmd="psql -h $host -p $port -U $user -d $database -c"
$psql_cmd "CREATE TABLE sales_data (row_id int, product_id int, customer_id int, price int, quantity int, timestamp TIMESTAMP);"


# Check if table creation was successful
if [ $? -eq 0 ] ; then
    echo "Table created in database $database"
else
    echo "Failed to create table in database $database"
    exit 1
fi

copy_cmd="\COPY sales_data FROM '$csv_file' WITH CSV HEADER"
$psql_cmd "$copy_cmd"

# Check if CSV upload was successful
if [ $? -eq 0 ] ; then
    echo "CSV file uploaded to the table in database $database"
else
    echo "Failed to upload CSV file to the table in database $database"
    exit 1
fi


