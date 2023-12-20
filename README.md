# DataEngineering-Project
## Tools and Technologies:
  1. OLTP database - MySQL
  2. NoSql database - MongoDB
  3. Production Data warehouse – DB2 on Cloud
  4. Staging Data warehouse – PostgreSQL
  5. Big data platform - Hadoop
  6. Big data analytics platform – Spark
  7. Business Intelligence Dashboard - IBM Cognos Analytics
  8. Data Pipelines - Apache Airflow
### OLTP Database:
  - We import the data in MySQL Database
  - The loaded data along with sql query is retrieved and stored as a 'sql' file.
### MongoDB:
  - The data source is a .json file.
  - The first step is connecting database and making a collection named 'electronics'
      -This is done after establishing the connection with MongoAtlas and then running the *db-conn.js* file using mongo shell:
        ```load('path/to/db-conn.js)```
  - The next step is to load the data in the collection and save a copy of slected fields using *import-sxport.sh* file:
      ```./import-export.sh```
  - Finally we explore the loaded data using *mongodb-queries.js* file using mongo shell:
      ```load('mongodb-queries.js)```
