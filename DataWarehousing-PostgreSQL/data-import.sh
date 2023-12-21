#!/bin/bash

# Define PostgreSQL connection details
DB_HOST=127.0.0.1
DB_PORT=5432
DB_NAME=Test1
DB_USER=postgres

# Define the path to your CSV files
category="./DimCategory.csv"
country="./DimCountry.csv"
date="./DimDate.csv"
sales="./FactSales.csv"

# Import data into tables using psql
psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER -c '\COPY "DimCategory" FROM '$category' WITH CSV HEADER;'
psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER -c '\COPY "DimCountry" FROM '$country' WITH CSV HEADER;'
psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER -c '\COPY  "DimDate" FROM '$date' WITH CSV HEADER;'
psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER -c '\COPY "FactSales" FROM '$sales' WITH CSV HEADER;'

if [ $? -eq 0 ] ; then

	echo "Data import completed."

else
	echo "Import Failed"
fi
