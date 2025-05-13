# Data Warehouse Project

## 📌 Project Overview
This project implements a **data warehouse** to store business data efficiently for 6 csv files using SQL Server. It includes an **ETL (Extract, Transform, Load) pipeline** to ingest and process data from six CSV files and provides views that are suitable for analysis and informed decision-making.

## 🏗️ Architecture
<img src="https://github.com/Joshua-K1234/sql-data-warehouse-project/blob/main/images/Diagram.png" alt="Components diagram" width="(600/9)16" height="600"/>

## What does the project do? Why?
This project takes in 6 csv files related to products, sales and customers and processes them so that they are ready for analyis.

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
