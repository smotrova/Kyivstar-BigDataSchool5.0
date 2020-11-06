-- ====================================================================
-- Create Tables for Azure SQL Data Warehouse Database
-- ====================================================================

-- dict for Vendor
CREATE TABLE smotrova_yellow_taxi.Vendor
(  
   id int NOT NULL,  
   Name varchar(50)  
  )  
WITH  
  (   
    DISTRIBUTION = HASH(id)  
  );

INSERT INTO smotrova_yellow_taxi.Vendor(id, Name) VALUES (1, N'Creative Mobile Technologies, LLC');
INSERT INTO smotrova_yellow_taxi.Vendor(id, Name) VALUES(2, N'VeriFone Inc.');

-- dict for RateCode  
  CREATE TABLE smotrova_yellow_taxi.RateCode
(  
   id int NOT NULL,  
   Name varchar(50)  
  )  
WITH  
  (   
    DISTRIBUTION = HASH(id)  
  );

INSERT INTO smotrova_yellow_taxi.RateCode(id, Name) VALUES (1, N'Standard rate');
INSERT INTO smotrova_yellow_taxi.RateCode(id, Name) VALUES (2,N'JFK'); 
INSERT INTO smotrova_yellow_taxi.RateCode(id, Name) VALUES (3, N'Newark'); 
INSERT INTO smotrova_yellow_taxi.RateCode(id, Name) VALUES (4, N'Nassau or Westchester'); 
INSERT INTO smotrova_yellow_taxi.RateCode(id, Name) VALUES (5, N'Negotiated fare'); 
INSERT INTO smotrova_yellow_taxi.RateCode(id, Name) VALUES (6, N'Group ride');

-- dict for Payment_type
  CREATE TABLE smotrova_yellow_taxi.Payment_type
(  
   id int NOT NULL,  
   Name varchar(50)  
  )  
WITH  
  (   
    DISTRIBUTION = HASH(id)  
  );

INSERT INTO smotrova_yellow_taxi.Payment_type(id, Name) VALUES (1, N'Credit card'); 
INSERT INTO smotrova_yellow_taxi.Payment_type(id, Name) VALUES (2, N'Cash'); 
INSERT INTO smotrova_yellow_taxi.Payment_type(id, Name) VALUES (3, N'No charge'); 
INSERT INTO smotrova_yellow_taxi.Payment_type(id, Name) VALUES (4, N'Dispute'); 
INSERT INTO smotrova_yellow_taxi.Payment_type(id, Name) VALUES (5, N'Unknown'); 
INSERT INTO smotrova_yellow_taxi.Payment_type(id, Name) VALUES (6, N'Voided trip');