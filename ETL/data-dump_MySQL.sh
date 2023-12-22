#!/bin/bash

user=root
database=sales

mysql -u $user --password=Password1234 -e "CREATE DATABASE IF NOT EXISTS $database;"

if [ $? -eq 0 ] ; then
    echo 'Database "sales" created'
else
    echo 'Failed to create database "sales"'
    exit 1
fi

mysql -u $user -p $database --password=Password1234 < ./sales.sql

if [ $? -eq 0 ] ; then
	echo 'Data Uploaded'
else
	echo 'Execution failed'
fi
