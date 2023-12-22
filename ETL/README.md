# ETL-1
This sub-section of repository contains scripts and automation for a data transfer project. The project involves creating databases, populating them, and automating the transfer of new records between MySQL and PostgreSQL databases.
## Bash Scripts

### 1. Create and Populate MySQL Database

- **Script Name:** `data-dump_MySQL.sh`
- **Description:** This Bash script creates a MySQL database, and then populates it with data from a sql file.
- **How to Run:**
  ```
  ./data-dump_MySQL.sh 
### 2. Create and Populate PostgreSQL Database
- **Script Name:** `data-dump_pg.sh`
- **Description:** This Bash script creates a PostgreSQL database, and then populates it with data from a CSV file.
- **How to Run:**
  ```bash
   ./data-dump_pg.sh
## Python Automation Script
### 3. MySQL to PostgreSQL Data Transfer
- **Script Name:** `automation.py`
- **Description:** This Python script automates the transfer of new records from MySQL to PostgreSQL. It checks for new records in the MySQL database and transfers them to the corresponding table in PostgreSQL.
- **How to Run:**
  ```bash
  python automation.py
## Contributing
Feel free to contribute to the project by suggesting improvements, reporting issues, or adding additional features. Contributions are welcome!
