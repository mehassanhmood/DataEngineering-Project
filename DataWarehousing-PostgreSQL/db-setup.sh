#!/bin/bash

# Define PostgreSQL connection details
DB_HOST=127.0.0.1
DB_PORT=5432
DB_USER=postgres
# DB_PASSWORD=Password1234
DB_NAME=Test1

# Create the database
createdb -h $DB_HOST -p $DB_PORT -U $DB_USER -W $DB_NAME

# Define the path to the SQL script with table definitions
script="./CREATE_SCRIPT.sql"

# Import data into tables using psql
psql -h $DB_HOST -p $DB_PORT -d $DB_NAME -U $DB_USER  -f $script

echo "Database and tables created successfully."
