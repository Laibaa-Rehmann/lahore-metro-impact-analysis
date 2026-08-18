CREATE DATABASE lahore_metro_analysis;
USE lahore_metro_analysis;

# 01-----------DATA EXPLORATION-------------
#Query 1 – Show all tables
SHOW TABLES;

#Query 2 – View first 10 records
SELECT *
FROM ridership
LIMIT 10;

#Query 3 – Count total records(118341)
SELECT
COUNT(*) AS total_records
FROM ridership;

#Query 4 – Date Range(2014-2025)
SELECT
MIN(STR_TO_DATE(date,'%Y-%m-%d %H:%i:%s')) AS start_date,
MAX(STR_TO_DATE(date,'%Y-%m-%d %H:%i:%s')) AS end_date
FROM ridership;

#Query 5 – Number of Stations(27)
SELECT
COUNT(DISTINCT station_name) AS total_stations
FROM ridership;

#Query 6 – Number of Administrative Towns(3)
SELECT
COUNT(DISTINCT administrative_town) AS towns
FROM ridership;

#Query 7 – Number of Years (12)
SELECT
COUNT(DISTINCT year) AS total_years
FROM ridership;

#Query 8 – Check Missing Values
SELECT
COUNT(*) AS TotalRows,
COUNT(date) AS Date_Not_Null,
COUNT(station_name) AS Station_Not_Null,
COUNT(boardings) AS Boardings_Not_Null,
COUNT(alightings) AS Alightings_Not_Null,
COUNT(daily_revenue) AS Revenue_Not_Null
FROM ridership;
