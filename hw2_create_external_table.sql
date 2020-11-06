-- ====================================================================
-- Create External Table for Azure SQL Data Warehouse Database
-- ====================================================================

IF OBJECT_ID('tripdata_extt', 'U') IS NOT NULL
    DROP EXTERNAL TABLE tripdata_extt
GO

CREATE EXTERNAL TABLE tripdata_extt
(
    VendorID                 int NULL,
	tpep_pickup_datetime     datetime NOT NULL,
	tpep_dropoff_datetime    datetime NULL,
	passenger_count          int NULL,
	trip_distance            real NULL,
	RatecodeID               int NULL,
	store_and_fwd_flag       char(1) NULL,
	PULocationID             int NULL,
	DOLocationID             int NULL,
	payment_type             int NULL,
	fare_amount              real NULL,
	extra                    real NULL,
	mta_tax                  real NULL,
	tip_amount               real NULL,
	tolls_amount             real NULL,
	improvement_surcharge    real NULL,
	total_amount             real NULL,
	congestion_surcharge     real NULL
	)
WITH
(
    LOCATION = N'/yellow_tripdata_2020-01.csv',
    DATA_SOURCE = smotrova_yellow_taxi_extds,
    FILE_FORMAT = smotrova_yellow_taxi_extff,
    REJECT_TYPE = VALUE,
    REJECT_VALUE = 0
    )
GO

-- ====================================================================
-- Importing Data from External Table into "ВашаСхема".fact_tripdata
-- ====================================================================

CREATE TABLE smotrova_yellow_taxi.fact_tripdata
WITH (DISTRIBUTION = HASH(tpep_pickup_datetime) )
AS SELECT * FROM
smotrova_yellow_taxi.tripdata_extt;


SELECT * FROM smotrova_yellow_taxi.fact_tripdata;