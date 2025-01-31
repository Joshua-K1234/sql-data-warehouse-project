-- ================================================
-- Title: Create Tables for Data Warehouse Project
-- Overview: This script creates several tables in the 'dwp_bronze' database to store customer, product, 
--           sales order, customer info, customer country, and product category data. The data sources 
--           are primarily from CRM systems, with the top three datasets coming from CRM and the others 
--           coming from ERP systems.
-- Warning: Ensure 'dwp_bronze' database exists before running.
-- ================================================

USE dwp_bronze;
CREATE TABLE IF NOT EXISTS crm_customers (
    cst_id INT AUTO_INCREMENT PRIMARY KEY,          -- Unique identifier for each customer
    cst_key VARCHAR(50) NOT NULL,                   -- Unique key for the customer
    cst_firstname VARCHAR(100) NOT NULL,            -- Customer's first name
    cst_lastname VARCHAR(100) NOT NULL,             -- Customer's last name
    cst_marital_status VARCHAR(20),                 -- Customer's marital status
    cst_gndr CHAR(10),                               -- Customer's gender (e.g., 'M' or 'F')
    cst_create_date DATE -- Date and time when the customer record was created (YYYY-MM--DD)
);

CREATE TABLE IF NOT EXISTS crm_products (
    prd_id INT AUTO_INCREMENT PRIMARY KEY,          -- Unique identifier for each product
    prd_key VARCHAR(50) NOT NULL,                   -- Unique key for the product
    prd_nm VARCHAR(100) NOT NULL,                   -- Product name
    prd_cost DECIMAL(20, 2) NOT NULL,               -- Product cost (with two decimal places for cents)
    prd_line VARCHAR(50),                           -- Product line (e.g., category or type)
    prd_start_dt DATE,                              -- Product start date (the date the product became available)
    prd_end_dt DATE                                 -- Product end date (the date the product is discontinued, if applicable)
);

CREATE TABLE IF NOT EXISTS crm_sales_orders (
    sls_ord_num INT AUTO_INCREMENT PRIMARY KEY,     -- Unique order number for the sale
    sls_prd_key VARCHAR(50) NOT NULL,                -- Product key for the ordered product
    sls_cust_id INT NOT NULL,                        -- Customer ID placing the order
    sls_order_dt DATE,                               -- Date when the order was placed
    sls_ship_dt DATE,                                -- Date when the order was shipped
    sls_due_dt DATE,                                 -- Date when the order is due (expected delivery date)
    sls_sales DECIMAL(20, 2) NOT NULL,               -- Total sales amount for the order
    sls_quantity INT NOT NULL,                       -- Quantity of items ordered
    sls_price DECIMAL(20, 2) NOT NULL                -- Price per item in the order
);

CREATE TABLE IF NOT EXISTS erp_customer_info (
    CID VARCHAR(20) PRIMARY KEY,   -- Customer ID (e.g., 'NASAW00011000')
    BDATE DATE,                    -- Birthdate of the customer
    GEN CHAR(10)                    -- Gender of the customer (e.g., 'Male' or 'Female')
);

CREATE TABLE IF NOT EXISTS erp_customer_country (
    CID VARCHAR(20) PRIMARY KEY,   -- Customer ID (e.g., 'AW-00011000')
    CNTRY VARCHAR(100)             -- Country of the customer (e.g., 'Australia')
);

CREATE TABLE IF NOT EXISTS erp_product_category (
    ID VARCHAR(20) PRIMARY KEY,     -- Product ID (e.g., 'AC_BR')
    CAT VARCHAR(50),                -- Product category (e.g., 'Accessories')
    SUBCAT VARCHAR(50),             -- Product subcategory (e.g., 'Bike Racks')
    MAINTENANCE VARCHAR(10)          -- Maintenance required (e.g., 'Yes' or 'No')
);
