# Data Warehouse Project

## 📌 Project Overview

- Business Problem: A company needs to consolidate sales data from multiple files. It would like a modern data warehouse to store the data, the data needs to be cleaned and transformed so it is ready for analysis.

- How I plan on Solving the Problem: I will build a datawarehouse in SQL server. It will:
  - Import sales data from the sources
  - Cleanse data and solve data issues prior analysis.

## 🏗️ Architecture
<img src="https://github.com/Joshua-K1234/sql-data-warehouse-project/blob/main/images/Diagram.png" alt="Components diagram" width="(600/9)16" height="600"/>

## Explanation of the SQL Scripts used to solve the problem

## Conclusion

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
