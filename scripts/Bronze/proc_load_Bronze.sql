/*
==============================================================================
Stored Procedure : Load Bronze Layer (Source --> Bronze)
==============================================================================
Script purpose: 
  This stored procedure loads data into the 'Bronze' schema from external CSV files. 
  It performs the following actions:
    - Truncate the bronze tables before loading data.
    - Uses the 'BULK INSERT' command to load data from csv files to bronze tables. 

Parameter:
  none. 
  This stored procedure does not accept any parameter or return any values. 

Usage Example: 
  EXEC Bronze.load_Bronze;
==============================================================================
*/

CREATE OR ALTER PROCEDURE Bronze.load_Bronze AS 
BEGIN
	DECLARE @start_time DATETIME , @end_time DATETIME, @process_start DATETIME, @process_end DATETIME;
	SET @process_start = GETDATE();
	BEGIN TRY
		PRINT '==========================================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '==========================================================';

		PRINT '----------------------------------------------------------';
		PRINT 'LOADING CRM TABLES';
		PRINT '----------------------------------------------------------';

			SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_cust_info';
			TRUNCATE TABLE Bronze.crm_cust_info;
		PRINT '>> Inserting Into: Bronze.crm_cust_info';
			BULK INSERT Bronze.crm_cust_info
			FROM 'C:\Users\Rishi\Downloads\SQL COURSE\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
		PRINT 'LOADING DURATION: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		PRINT '>> -------------------------------------------------------';

			SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_prd_info';
			TRUNCATE TABLE Bronze.crm_prd_info;
		PRINT '>> Inserting Into: Bronze.crm_prd_info';
			BULK INSERT Bronze.crm_prd_info
			FROM 'C:\Users\Rishi\Downloads\SQL COURSE\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
		PRINT 'LOADING DURATION: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		PRINT '>> -------------------------------------------------------';

			SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.crm_sales_details';
			TRUNCATE TABLE Bronze.crm_sales_details;
		PRINT '>> Inserting Into: Bronze.crm_sales_details';
			BULK INSERT Bronze.crm_sales_details
			FROM 'C:\Users\Rishi\Downloads\SQL COURSE\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
		PRINT 'LOADING DURATION: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
	
		PRINT '----------------------------------------------------------';
		PRINT 'LOADING ERP TABLES';
		PRINT '----------------------------------------------------------';
	
			SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_cust_az12';
			TRUNCATE TABLE Bronze.erp_cust_az12;
		PRINT '>> Inserting Into: Bronze.erp_cust_az12';
			BULK INSERT Bronze.erp_cust_az12
			FROM 'C:\Users\Rishi\Downloads\SQL COURSE\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
		PRINT 'LOADING DURATION: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		PRINT '>> -------------------------------------------------------';

			SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_loc_a101';
			TRUNCATE TABLE Bronze.erp_loc_a101;
		PRINT '>> Inserting Into: Bronze.erp_loc_a101';
			BULK INSERT Bronze.erp_loc_a101
			FROM 'C:\Users\Rishi\Downloads\SQL COURSE\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
		PRINT 'LOADING DURATION: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		PRINT '>> -------------------------------------------------------';

			SET @start_time = GETDATE();
		PRINT '>> Truncating Table: Bronze.erp_px_cat_g1v2';
			TRUNCATE TABLE Bronze.erp_px_cat_g1v2;
		PRINT '>> Inserting Into: Bronze.erp_px_cat_g1v2';
			BULK INSERT Bronze.erp_px_cat_g1v2
			FROM 'C:\Users\Rishi\Downloads\SQL COURSE\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
			WITH (
				FIRSTROW = 2,
				FIELDTERMINATOR = ',',
				TABLOCK
			);
			SET @end_time = GETDATE();
		PRINT 'LOADING DURATION: ' + CAST (DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + ' seconds'
		PRINT '>> -------------------------------------------------------';

			SET @process_end = GETDATE();
		PRINT '==========================================================';
		PRINT '----------------------------------------------------------';
		PRINT 'LOADING PROCESS COMPLETED';
		PRINT 'Total time taken ' + CAST (DATEDIFF(second, @process_start, @process_end) AS NVARCHAR) + ' seconds'
		PRINT '==========================================================';
	END TRY 
	BEGIN CATCH
		PRINT '==========================================================';
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER';
		PRINT 'ERROR MESSAGE: ' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE: ' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT '=========================================================='
	END CATCH 
END
