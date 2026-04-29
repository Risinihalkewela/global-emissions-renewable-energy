--Step 1 — Rename tables
EXEC sp_rename '[dbo].[EN_ATM_GHGT_AIP]', 'GHG_Emissions';
EXEC sp_rename '[dbo].[EG_FEC_RNEW]', 'Renewable_Energy';


--Step 2 - Remove unwanted columns
--For GHG_Emissions
ALTER TABLE GHG_Emissions DROP COLUMN [Goal];
ALTER TABLE GHG_Emissions DROP COLUMN [Target];
ALTER TABLE GHG_Emissions DROP COLUMN [Indicator];
ALTER TABLE GHG_Emissions DROP COLUMN [Time_Detail];
ALTER TABLE GHG_Emissions DROP COLUMN [TimeCoverage];
ALTER TABLE GHG_Emissions DROP COLUMN [UpperBound];
ALTER TABLE GHG_Emissions DROP COLUMN [LowerBound];
ALTER TABLE GHG_Emissions DROP COLUMN [BasePeriod];
ALTER TABLE GHG_Emissions DROP COLUMN [Source];
ALTER TABLE GHG_Emissions DROP COLUMN [GeoInfoUrl];
ALTER TABLE GHG_Emissions DROP COLUMN [FootNote];
ALTER TABLE GHG_Emissions DROP COLUMN [Nature];
ALTER TABLE GHG_Emissions DROP COLUMN [Reporting_Type];
ALTER TABLE GHG_Emissions DROP COLUMN [Units];
ALTER TABLE GHG_Emissions DROP COLUMN [column21];
ALTER TABLE GHG_Emissions DROP COLUMN [column22];
ALTER TABLE GHG_Emissions DROP COLUMN [column23];
ALTER TABLE GHG_Emissions DROP COLUMN [column24];
ALTER TABLE GHG_Emissions DROP COLUMN [column25];
ALTER TABLE GHG_Emissions DROP COLUMN [column26];
ALTER TABLE GHG_Emissions DROP COLUMN [column27];
ALTER TABLE GHG_Emissions DROP COLUMN [column28];
ALTER TABLE GHG_Emissions DROP COLUMN [column29];
ALTER TABLE GHG_Emissions DROP COLUMN [column30];
ALTER TABLE GHG_Emissions DROP COLUMN [column31];
ALTER TABLE GHG_Emissions DROP COLUMN [column32];
ALTER TABLE GHG_Emissions DROP COLUMN [column33];
ALTER TABLE GHG_Emissions DROP COLUMN [column34];
ALTER TABLE GHG_Emissions DROP COLUMN [column35];
ALTER TABLE GHG_Emissions DROP COLUMN [column36];
ALTER TABLE GHG_Emissions DROP COLUMN [column37];
ALTER TABLE GHG_Emissions DROP COLUMN [column38];
ALTER TABLE GHG_Emissions DROP COLUMN [column39];
ALTER TABLE GHG_Emissions DROP COLUMN [column40];
ALTER TABLE GHG_Emissions DROP COLUMN [column41];
ALTER TABLE GHG_Emissions DROP COLUMN [column42];
ALTER TABLE GHG_Emissions DROP COLUMN [column43];
ALTER TABLE GHG_Emissions DROP COLUMN [column44];
ALTER TABLE GHG_Emissions DROP COLUMN [column45];
ALTER TABLE GHG_Emissions DROP COLUMN [column46];
ALTER TABLE GHG_Emissions DROP COLUMN [column47];
ALTER TABLE GHG_Emissions DROP COLUMN [column48];
ALTER TABLE GHG_Emissions DROP COLUMN [column49];
ALTER TABLE GHG_Emissions DROP COLUMN [column50];
ALTER TABLE GHG_Emissions DROP COLUMN [column51];
ALTER TABLE GHG_Emissions DROP COLUMN [column52];
 
--For Renewable_Energy
ALTER TABLE Renewable_Energy DROP COLUMN [Goal];
ALTER TABLE Renewable_Energy DROP COLUMN [Target];
ALTER TABLE Renewable_Energy DROP COLUMN [Indicator];
ALTER TABLE Renewable_Energy DROP COLUMN [Time_Detail];
ALTER TABLE Renewable_Energy DROP COLUMN [TimeCoverage];
ALTER TABLE Renewable_Energy DROP COLUMN [UpperBound];
ALTER TABLE Renewable_Energy DROP COLUMN [LowerBound];
ALTER TABLE Renewable_Energy DROP COLUMN [BasePeriod];
ALTER TABLE Renewable_Energy DROP COLUMN [Source];
ALTER TABLE Renewable_Energy DROP COLUMN [GeoInfoUrl]
ALTER TABLE Renewable_Energy DROP COLUMN [FootNote];
ALTER TABLE Renewable_Energy DROP COLUMN [Nature];
ALTER TABLE Renewable_Energy DROP COLUMN [Reporting_Type];
ALTER TABLE Renewable_Energy DROP COLUMN [Units];
ALTER TABLE Renewable_Energy DROP COLUMN [column21];
ALTER TABLE Renewable_Energy DROP COLUMN [column22];
ALTER TABLE Renewable_Energy DROP COLUMN [column23];
ALTER TABLE Renewable_Energy DROP COLUMN [column24];
ALTER TABLE Renewable_Energy DROP COLUMN [column25];
ALTER TABLE Renewable_Energy DROP COLUMN [column26];
ALTER TABLE Renewable_Energy DROP COLUMN [column27];
ALTER TABLE Renewable_Energy DROP COLUMN [column28];
ALTER TABLE Renewable_Energy DROP COLUMN [column29];
ALTER TABLE Renewable_Energy DROP COLUMN [column30];
ALTER TABLE Renewable_Energy DROP COLUMN [column31];
ALTER TABLE Renewable_Energy DROP COLUMN [column32];
ALTER TABLE Renewable_Energy DROP COLUMN [column33];
ALTER TABLE Renewable_Energy DROP COLUMN [column34];
ALTER TABLE Renewable_Energy DROP COLUMN [column35];
ALTER TABLE Renewable_Energy DROP COLUMN [column36];
ALTER TABLE Renewable_Energy DROP COLUMN [column37];
ALTER TABLE Renewable_Energy DROP COLUMN [column38];
ALTER TABLE Renewable_Energy DROP COLUMN [column39];
ALTER TABLE Renewable_Energy DROP COLUMN [column40];
ALTER TABLE Renewable_Energy DROP COLUMN [column41];
ALTER TABLE Renewable_Energy DROP COLUMN [column42];
ALTER TABLE Renewable_Energy DROP COLUMN [column43];
ALTER TABLE Renewable_Energy DROP COLUMN [column44];
ALTER TABLE Renewable_Energy DROP COLUMN [column45];
ALTER TABLE Renewable_Energy DROP COLUMN [column46];
ALTER TABLE Renewable_Energy DROP COLUMN [column47];
ALTER TABLE Renewable_Energy DROP COLUMN [column48];
ALTER TABLE Renewable_Energy DROP COLUMN [column49];
ALTER TABLE Renewable_Energy DROP COLUMN [column50];
ALTER TABLE Renewable_Energy DROP COLUMN [column51];
ALTER TABLE Renewable_Energy DROP COLUMN [column52];


--Step 3 — Standardize column names
--For GHG_Emissions
EXEC sp_rename 'GHG_Emissions.[SeriesCode]', 'Series_Code';
EXEC sp_rename 'GHG_Emissions.[SeriesDescription]', 'series_Description';
EXEC sp_rename 'GHG_Emissions.[GeoAreaCode]', 'Country_Code';
EXEC sp_rename 'GHG_Emissions.[GeoAreaName]', 'Country';
EXEC sp_rename 'GHG_Emissions.[TimePeriod]', 'Year';


--For Renewable_Energy
EXEC sp_rename 'Renewable_Energy.[SeriesCode]', 'Series_Code';
EXEC sp_rename 'Renewable_Energy.[SeriesDescription]', 'Series_Description';
EXEC sp_rename 'Renewable_Energy.[GeoAreaCode]', 'Country_Code';
EXEC sp_rename 'Renewable_Energy.[GeoAreaName]', 'Country';
EXEC sp_rename 'Renewable_Energy.[TimePeriod]', 'Year';


Select *
From [dbo].[GHG_Emissions]

Select *
From [dbo].[Renewable_Energy]


--Step 4 - Check data types
--For GHG_Emissions
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'GHG_Emissions';

--For Renewable_Energy
SELECT 
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'Renewable_Energy';


--Step 5 - Apply the correct data types
--For GHS_Emissions
ALTER TABLE GHG_Emissions ALTER COLUMN Series_Code VARCHAR(50);
ALTER TABLE GHG_Emissions ALTER COLUMN Series_Description VARCHAR(255);

ALTER TABLE GHG_Emissions ALTER COLUMN Country_Code VARCHAR(10);
ALTER TABLE GHG_Emissions ALTER COLUMN Country VARCHAR(100);

ALTER TABLE GHG_Emissions ALTER COLUMN Year INT;
ALTER TABLE GHG_Emissions ALTER COLUMN Value FLOAT;

--For Renewable_Energy
SELECT [Value]
FROM Renewable_Energy
WHERE TRY_CONVERT(float, [value]) IS NULL
AND [Value] IS NOT NULL;

ALTER TABLE Renewable_Energy ALTER COLUMN Series_Code VARCHAR(50);
ALTER TABLE Renewable_Energy ALTER COLUMN Series_Description VARCHAR(255);

ALTER TABLE Renewable_Energy ALTER COLUMN Country_Code VARCHAR(10);
ALTER TABLE Renewable_Energy ALTER COLUMN Country VARCHAR(100);

ALTER TABLE Renewable_Energy ALTER COLUMN Year INT;
ALTER TABLE Renewable_Energy ALTER COLUMN Value float;


--Find rows containing ANY NULL values
SELECT *
FROM GHG_Emissions
WHERE 
    Series_Code IS NULL OR
    Series_Description IS NULL OR
    Country_Code IS NULL OR
    Country IS NULL OR
    Year IS NULL OR
    Value IS NULL;

Select *
From GHG_Emissions

SELECT *
FROM Renewable_Energy
WHERE 
    series_Code IS NULL OR
    Series_Description IS NULL OR
    Country_Code IS NULL OR
    Country IS NULL OR
    Year IS NULL OR
    Value IS NULL;

Select *
From Renewable_Energy

--Check Duplicate Rows
SELECT 
    Series_Code, Series_Description, Country_Code, Country, Year, Value,
    COUNT(*) AS Duplicate_Count
FROM GHG_Emissions
GROUP BY 
    Series_Code, Series_Description, Country_Code, Country, Year, Value
HAVING COUNT(*) > 1;


SELECT 
    Series_Code, Series_Description, Country_Code, Country, Year, Value,
    COUNT(*) AS Duplicate_Count
FROM Renewable_Energy
GROUP BY 
    Series_Code, Series_Description, Country_Code, Country, Year, Value
HAVING COUNT(*) > 1;


Select *
From GHG_Emissions

Select *
From Renewable_Energy

--Create SQL Views for Power BI?
--View 1: vw_Renewable_Energy
CREATE VIEW vw_Renewable_Energy AS
SELECT 
    Series_Code,
    Series_Description,
    Country_Code,
    Country,
    CAST(Year AS INT) AS Year,
    CAST(Value AS FLOAT) AS Renewable_Energy_Percent
FROM Renewable_Energy
WHERE Value IS NOT NULL;


--View 2: vw_GHG_Emissions
CREATE VIEW vw_GHG_Emissions AS
SELECT 
    Series_Code,
    Series_Description,
    Country_Code,
    Country,
    CAST(Year AS INT) AS Year,
    CAST(Value AS FLOAT) AS GHG_Emissions
FROM GHG_Emissions
WHERE Value IS NOT NULL;

--Create a Combined View for Power BI
CREATE VIEW vw_RE_GHG_Combined AS
SELECT 
    r.Country,
    r.Country_Code,
    r.Year,
    r.Renewable_Energy_Percent,
    g.GHG_Emissions
FROM vw_Renewable_Energy r
INNER JOIN vw_GHG_Emissions g
    ON r.Country = g.Country
    AND r.Year = g.Year;

