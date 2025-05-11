/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/


USE DataWarehouse;
GO

IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL DROP TABLE silver.crm_cust_info;
IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL DROP TABLE silver.crm_prd_info;
IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL DROP TABLE silver.crm_sales_details;
IF OBJECT_ID('silver.erp_cust_az12', 'U') IS NOT NULL DROP TABLE silver.erp_cust_az12;
IF OBJECT_ID('silver.erp_loc_a101', 'U') IS NOT NULL DROP TABLE silver.erp_loc_a101;
IF OBJECT_ID('silver.erp_px_cat_g1v2', 'U') IS NOT NULL DROP TABLE silver.erp_px_cat_g1v2;
GO

CREATE TABLE silver.crm_cust_info (
    cst_id INT,
    cst_key VARCHAR(50),
    cst_firstname VARCHAR(100),
    cst_lastname VARCHAR(100),
    cst_marital_status CHAR(20),
    cst_gndr CHAR(20),
    cst_create_date DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE silver.crm_prd_info (
    prd_id INT,
	cat_id NVARCHAR(50),
    prd_key VARCHAR(50),
    prd_nm VARCHAR(255),
    prd_cost DECIMAL(30, 2),
    prd_line NVARCHAR(40),
    prd_start_dt DATE,
    prd_end_dt DATE,  
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE silver.crm_sales_details (
    sls_ord_num VARCHAR(50),
    sls_prd_key VARCHAR(50),
    sls_cust_id INT,
    sls_order_dt DATE,
    sls_ship_dt DATE,
    sls_due_dt DATE,
    sls_sales DECIMAL(18, 2),
    sls_quantity INT,
    sls_price DECIMAL(18, 2),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

-- customer demographics
CREATE TABLE silver.erp_cust_az12 (
    cid VARCHAR(50),
    bdate DATE,
    gen VARCHAR(20),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE silver.erp_loc_a101 (
    cid VARCHAR(50),
    cntry VARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

CREATE TABLE silver.erp_px_cat_g1v2 (
    ID VARCHAR(50),
    CAT VARCHAR(50),
    SUBCAT VARCHAR(50),
    MAINTENANCE VARCHAR(20), -- Assuming 'Yes'/'No' values
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

PRINT '** SUCCESS: All tables created for silver layer';
