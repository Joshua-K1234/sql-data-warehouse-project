# Data Warehouse Project

## 📌 Project Overview
This project implements a **data warehouse** to store and analyze business data efficiently. It includes an **ETL (Extract, Transform, Load) pipeline** to ingest and process data from two CSV files and provides views in the gold layer that are suitable for analysis.

## 🏗️ Architecture
<img src="https://github.com/Joshua-K1234/sql-data-warehouse-project/blob/main/images/Diagram.drawio" alt="Components diagram" width="(200/9)16" height="200"/>

## 🎯 Objectives
- **Centralized Data Storage**: Store structured data in a well-defined schema.
- **ETL Pipeline**: Automate data extraction, transformation, and loading from CSV sources.
- **Analytics & Reporting**: Enable business users to run SQL queries and generate insights.
- **Scalability**: Optimize performance within SQL Server.

## 🛠️ Tech Stack
- **Data Warehouse**: SQL Server
- **ETL**: SQL Scripts (Stored Procedures, SSIS optional) ????????
- **Data Storage**: CSV Files
- **Analytics**: SQL Views, SSMS (SQL Server Management Studio)

## 🚀 Features
✅ **Automated ETL Pipeline**: Extracts data from CSV files into SQL Server.
✅ **Data Transformation**: Cleans and structures data using SQL queries.
✅ **Batch Processing**: Loads and updates data efficiently.


## 🏁 Setup & Installation
1. Clone the repository:
2. In the third file, change the location of all bulk insert statements to the directory where you decide to keep the datasets.
4. Load CSV files into the SQL Server database.
5. Execute the provided SQL scripts in numerical order to transform and load data.


## 📜 License
This project is licensed under the **MIT License**. See the [LICENSE](LICENSE) file for details.
