#!/bin/bash

# Credentials:
DB_USER=root
DB_PASSWORD=Password1234
DB_NAME=sales
TABLE_NAME=sales_data

# output file:
OUTPUT_FILE=sales_data.sql

# mysql dump command:
mysqldump -u $DB_USER -p$DB_PASSWORD $DB_NAME $TABLE_NAME > $OUTPUT_FILE

# check if mysqldump was successful:

if [ $? -eq 0 ]; then
	echo 'Data from $TABLE_NAME table exported to $OUTPUT_FILE successful.'
else 
	echo "Error exporting data from $TABLE_NAME table."
fi


