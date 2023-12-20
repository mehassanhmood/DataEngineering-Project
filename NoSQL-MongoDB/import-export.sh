#!/bin/bash

mongoimport --db catalog --collection electronics --file catalog.json
if [ $? -eq 0 ]; then
	echo 'Import Successful'
else 
	echo 'Import Failed'
	exit 1
fi

mongoexport --db catalog --collection electronics --type=csv --fields _id,type,model --out electronics.csv

if [ $? -eq 0 ]; then
        echo 'export Successful'
else
        echo 'export Failed'
        exit 1
fi
