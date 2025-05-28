# Data Warehouse Project

## 📌 Project Overview

- Business Problem: A company needs to consolidate sales data from multiple files. It would like a modern data warehouse to store the data, the data needs to be cleaned and transformed so it is ready for analysis.

- How I plan on Solving the Problem: I will build a datawarehouse in SQL server. It will:
  - Import sales data: Load Sales, Product and Customer data into the data warehouse
  - Data Cleansing: Cleanse data and solve data issues prior to analysis
  - Clear documentation: All the SQL Scripts will have header comments describing purpose and functionality.
  - Build-in Error Handling & Logging: SQL Scrips include try and catch blocks that print error messages, success confirmations and execution time.

## 🏗️ Architecture
<img src="https://github.com/Joshua-K1234/sql-data-warehouse-project/blob/main/images/Diagram.png" alt="Components diagram" width="(600/9)16" height="600"/>

## Explanation of the SQL Scripts used to solve the problem

1) The first script creates a database called "DataWarehouse", if it exists already the old database is deleted. It additionally creates the bronze, silver and gold schema's for the medallion architecture.
2) The second script creates tables in the bronze schema for each csv file. It drops existing old tables.
3) The third script is a stored procedure. It includes error handling & logging & outputs execution time. It first of all truncates all the tables in the bronze layer. Next it loads all the tables using "BULK INSERT" to populate the tables.
4) The fourth script creates tables in the silver schema for each csv file. This done again so we have copy of both the raw data and the transformed data that we are creating in the silver layer.
5) The fifth script is a stored procedure. It includes error handling & logging & outputs execution time. It first of all truncates all the tables in the silver layer. Next loads data from the bronze layer but this time the data is transformed, the data is transformed in various ways including: Trimming, Standarisation, Extracting characters and much more.  
6) The sixth script creates views ready for analysis, it combines data from various silver tables as shown in the architecture.

These images are for the 3rd script followed by the 5th script.

<img src="https://github.com/Joshua-K1234/sql-data-warehouse-project/blob/main/images/Bronze%20Layer%20Load.JPG" width="(600/9)16" height="600"/>

<img src="https://github.com/Joshua-K1234/sql-data-warehouse-project/blob/main/images/Silver%20Layer%20Load.JPG" width="(400/9)16" height="400"/>

## 🚀 Key Features
- Centralized Data Storage: Combines product, sales, and customer data into a unified schema.
- Automated ETL Pipeline: Extracts, transforms, and loads data from CSVs using stored procedures.
- Clean, Structured Data: Ensures consistency and reliability for analysis.
- SQL Views for Analysis: Provides a foundation for insights and reporting.
- Scalable Performance: Designed for efficient querying and batch updates.

## 🛠️ Tech Stack
- **Data Warehouse**: SQL Server
- **ETL**: SQL Scripts (Stored Procedures)
- **Data Storage**: CSV Files
- **Analytics**: SQL Views, SSMS (SQL Server Management Studio)


## 🏁 Setup & Installation
1. Clone the repository:
2. In the third file "bronze-load.sql" , change the location of all bulk insert statements to the directory where you decide to keep the datasets.
3. Execute the provided SQL scripts in numerical order to transform and load data.

## 📜 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
