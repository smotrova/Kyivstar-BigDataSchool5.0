DROP DATABASE SCOPED CREDENTIAL SmotrovaBlobCredential;
GO

-- Create a database scoped credential with Azure storage account key as the secret.
CREATE DATABASE SCOPED CREDENTIAL SmotrovaBlobCredential WITH
  IDENTITY = 'smotrovastorageblob',
  SECRET = '<my_access_key>'
GO

-- check if ext data source exits
IF EXISTS (
  SELECT *
   FROM sys.external_data_sources	
   WHERE name = N'smotrova_yellow_taxi_extds'	 
)
DROP EXTERNAL DATA SOURCE smotrova_yellow_taxi_extds
GO

-- create external data source
CREATE EXTERNAL DATA SOURCE smotrova_yellow_taxi_extds WITH
(
    TYPE = HADOOP,
    LOCATION = N'wasbs://smotrovahw2@smotrovastorageblob.blob.core.windows.net',
    CREDENTIAL = SmotrovaBlobCredential
)
GO

--SELECT * FROM sys.external_data_sources
--GO

--SELECT * from sys.database_scoped_credentials
--GO