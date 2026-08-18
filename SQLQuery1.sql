drop TABLE Luxury_Housing;
CREATE DATABASE LuxuryHousing;
USE LuxuryHousing;
CREATE TABLE Luxury_Housing (
    Property_ID VARCHAR(20),
    Micro_Market VARCHAR(100),
    Project_Name VARCHAR(100),
    Developer_Name VARCHAR(100),
    Unit_Size_Sqft FLOAT,
    Configuration VARCHAR(20),
    Ticket_Price_Cr FLOAT,
    Transaction_Type VARCHAR(50),
    Buyer_Type VARCHAR(50),
    Purchase_Quarter DATE,
    Connectivity_Score FLOAT,
    Amenity_Score FLOAT,
    Possession_Status VARCHAR(50),
    Sales_Channel VARCHAR(50),
    NRI_Buyer VARCHAR(10),
    Locality_Infra_Score FLOAT,
    Avg_Traffic_Time_Min INT,
    Buyer_Comments VARCHAR(255),
    Purchase_Year INT,
    Quarter_Number INT,
    Quarter_Label VARCHAR(20),
    Price_per_Sqft FLOAT,
    Booking_Flag  INT
);
SELECT *
FROM Luxury_Housing;

    
    -- 1. Row count
SELECT COUNT(*) AS Total_Rows
FROM Luxury_Housing;


-- 2. Transaction type distribution
SELECT
    Transaction_Type,
    COUNT(*) AS Count_Rows
FROM Luxury_Housing
GROUP BY Transaction_Type;


-- 3. Average ticket price per developer
SELECT
    Developer_Name,
    AVG(Ticket_Price_Cr) AS Avg_Ticket_Price_Cr
FROM Luxury_Housing
GROUP BY Developer_Name
ORDER BY Avg_Ticket_Price_Cr DESC;
-- Group by Booking Status
SELECT 
    Booking_Flag,
    COUNT(*) AS Transaction_Count
FROM Luxury_Housing
GROUP BY Booking_Flag;


-- 4. NULL validation
SELECT
    SUM(CASE WHEN Ticket_Price_Cr IS NULL THEN 1 ELSE 0 END) AS Null_Ticket_Price,
    SUM(CASE WHEN Unit_Size_Sqft IS NULL THEN 1 ELSE 0 END) AS Null_Unit_Size,
    SUM(CASE WHEN Price_per_Sqft IS NULL THEN 1 ELSE 0 END) AS Null_Price_Per_Sqft
FROM Luxury_Housing;


-- 5. Duplicate validation
SELECT
    Property_ID,
    COUNT(*) AS Duplicate_Count
FROM Luxury_Housing
GROUP BY Property_ID
HAVING COUNT(*) > 1;