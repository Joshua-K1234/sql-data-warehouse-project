-- Title: Create Database and Schemas
-- Overview: This script checks if the 'DataWarehouse' database exists and creates it if not. 
-- It then switches to the 'DataWarehouse' database and creates three schemas: 'bronze', 'silver', and 'gold' 
-- only if they don't already exist.

USE master;
GO

-- Force drop the database if it exists  
IF DB_ID('DataWarehouse') IS NOT NULL  
BEGIN  
    ALTER DATABASE DataWarehouse SET SINGLE_USER WITH ROLLBACK IMMEDIATE;  
    DROP DATABASE DataWarehouse;  
END  
GO  

CREATE DATABASE DataWarehouse;
GO

USE DataWarehouse;
GO

CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold;
GO