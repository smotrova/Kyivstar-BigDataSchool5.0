-- ==========================================================================
-- Create external file format for Azure SQL Data Warehouse Database 
-- ==========================================================================

IF EXISTS (
  SELECT *
	FROM sys.external_file_formats	
   WHERE name = N'smotrova_yellow_taxi_extff'	 
)
DROP EXTERNAL FILE FORMAT smotrova_yellow_taxi_extff
GO

CREATE EXTERNAL FILE FORMAT smotrova_yellow_taxi_extff WITH
(
	FORMAT_TYPE = DELIMITEDTEXT,
	FORMAT_OPTIONS 
	(
		FIELD_TERMINATOR = N',',
		DATE_FORMAT = N'yyyy-MM-dd HH:mm:ss',
		USE_TYPE_DEFAULT = FALSE,
		FIRST_ROW = 2  -- Optional property
	)
)
GO