# DataEngineering-Project
## Tools and Technologies:
  1. OLTP database - MySQL
  2. NoSql database - MongoDB
  3. Staging Data warehouse – PostgreSQL
  4. Big data platform - Hadoop
  5. Big data analytics platform – Spark
  6. Business Intelligence Dashboard - IBM Cognos Analytics and Tableau
  7. Data Pipelines - Apache Airflow
### OLTP Database:
  - [OLTP](https://github.com/mehassanhmood/DataEngineering-Project/tree/main/OLTP)
  - We import the data in MySQL Database
  - The loaded data along with sql query is retrieved and stored as a 'sql' file.
### MongoDB:
  - [NoSQL-MongoDB](https://github.com/mehassanhmood/DataEngineering-Project/tree/main/NoSQL-MongoDB)
  - The data source is a .json file.
  - The first step is connecting database and making a collection named 'electronics'
      -This is done after establishing the connection with MongoAtlas and then running the *db-conn.js* file using mongo shell:
        ```load('path/to/db-conn.js)```
  - The next step is to load the data in the collection and save a copy of slected fields using *import-sxport.sh* file:
      ```./import-export.sh```
  - Finally we explore the loaded data using *mongodb-queries.js* file using mongo shell:
      ```load('mongodb-queries.js)```
### Staging Data Warehouse:
  - [DataWarehousing-PostgreSQL](https://github.com/mehassanhmood/DataEngineering-Project/tree/main/DataWarehousing-PostgreSQL)
  - This is for educational purposes only as a Data Warehouse requires reference data source and metadata.
### Analytics:
  - [Dashboards-BI](https://github.com/mehassanhmood/DataEngineering-Project/tree/main/Analytics)
    1. Data Visualization for Understanding:
       - Dashboards present complex data in visually intuitive formats.
       - Visualization enhances comprehension, making data accessible to diverse stakeholders.
    2. Real-Time Monitoring and Proactive Analysis:
       - Dashboards offer real-time updates on key metrics for prompt decision-making.
       - BI tools enable proactive problem identification by highlighting deviations and trends.
    3. Informed Decision-Making with Actionable Insights:
       - Dashboards provide a centralized source for actionable insights.
       - BI facilitates data-driven decisions, fostering accountability and optimizing processes.
