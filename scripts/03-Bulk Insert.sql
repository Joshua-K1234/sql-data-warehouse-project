USE DataWarehouse;
GO
/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data (So its empty prior).
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.
    - Output duration taking to complete the procedure.

Parameters:
    None. 
    This stored procedure does not accept any parameters or return any values.

-- Uncomment the line below to run the procedure
-- EXEC bronze.load_bronze

-- Use: "EXEC bronze.load_bronze"
===============================================================================
*/

CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME;
	BEGIN TRY
		SET @start_time = GETDATE();

		-- Truncate all tables before inserting new data
		PRINT '==============================';
		PRINT 'Truncating all tables before inserting data';
		PRINT '==============================';
		TRUNCATE TABLE bronze.crm_cust_info;
		TRUNCATE TABLE bronze.crm_prd_info;
		TRUNCATE TABLE bronze.crm_sales_details;
		TRUNCATE TABLE bronze.erp_cust_az12;
		TRUNCATE TABLE bronze.erp_loc_a101;
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		PRINT '** SUCCESS: All tables truncated successfully.';
		PRINT '';

		-- Loading data into all tables.
		PRINT '==============================';
		PRINT 'Loading Bronze Layer';
		PRINT '==============================';
		PRINT '------------------------------';
		PRINT 'Loading all CRM Tables';
		PRINT '------------------------------';

		PRINT '>> Loading bronze layer: crm_cust_info';
		BULK INSERT bronze.crm_cust_info
		FROM 'C:/01_projects/dwh_projects/source_crm/cust_info.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,	-- Skips header
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK		-- Improves performance by locking the entire table
		);

		PRINT '>> Loading bronze layer: crm_prd_info';
		BULK INSERT bronze.crm_prd_info
		FROM 'C:/01_projects/dwh_projects/source_crm/prd_info.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
	

		PRINT '>> Loading bronze layer: crm_sales_details';
		BULK INSERT bronze.crm_sales_details
		FROM 'C:/01_projects/dwh_projects/source_crm/sales_details.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
	

		PRINT '------------------------------';
		PRINT 'Loading all ERP Tables';
		PRINT '------------------------------';
		PRINT '>> Loading bronze layer: erp_cust_az12';
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:/01_projects/dwh_projects/source_erp/cust_az12.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,	-- Skips header
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
	

		PRINT '>> Loading bronze layer: erp_loc_a101';
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:/01_projects/dwh_projects/source_erp/loc_a101.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
	

		PRINT '>> Loading bronze layer: erp_px_cat_g1v2';
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:/01_projects/dwh_projects/source_erp/px_cat_g1v2.csv'
		WITH (
			FORMAT = 'CSV',
			FIRSTROW = 2,
			FIELDTERMINATOR = ',',
			ROWTERMINATOR = '\n',
			TABLOCK
		);
		PRINT '==============================';
		PRINT '** SUCCESS: All files loaded successfully into the bronze layer.';
		
		SET @end_time = GETDATE();
		PRINT '>> Total Load Duration: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' Seconds';
		PRINT '==============================';

	END TRY
	BEGIN CATCH
		PRINT '==============================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER PROCEDURE';
		PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
        	PRINT 'ERROR NUMBER: ' + CAST(ERROR_NUMBER() AS VARCHAR(10));
        	PRINT 'ERROR SEVERITY: ' + CAST(ERROR_SEVERITY() AS VARCHAR(10));
        	PRINT 'ERROR STATE: ' + CAST(ERROR_STATE() AS VARCHAR(10));
		PRINT '==============================';
	END CATCH

END
