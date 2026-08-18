
# 02------------BASIC BUSINESS ANALYSIS-------------

#Query 9 – Total Boardings(256383922)
SELECT
SUM(boardings) AS Total_Boardings
FROM ridership;

#Query 10 – Total Alightings(256504630)
SELECT
SUM(alightings) AS Total_Alightings
FROM ridership;

#Query 11 – Total Revenue(11246267350)
SELECT
SUM(daily_revenue) AS Total_Revenue
FROM ridership;

#Query 12 – Average Daily Ridership(4333.99)
SELECT
ROUND(AVG(daily_ridership),2) AS Avg_Daily_Ridership
FROM ridership;

#Query 13 – Average Occupancy(71.19)
SELECT
ROUND(AVG(occupancy_rate),2) AS Avg_Occupancy
FROM ridership;

#Query 14 – Average Fare(21.56)
SELECT
ROUND(AVG(fare),2) AS Avg_Fare
FROM ridership;

#Query 15 – Weekend vs Weekday(190599434,65784488)
SELECT
CASE
WHEN is_weekend=1 THEN 'Weekend'
ELSE 'Weekday'
END AS Day_Type,

SUM(boardings) AS Total_Boardings

FROM ridership

GROUP BY Day_Type;

#Query 16 – Ridership by Season(autumn)
SELECT
season,
SUM(boardings) AS Total_Boardings
FROM ridership
GROUP BY season
ORDER BY Total_Boardings DESC;

#Query 17 – Monthly Ridership
SELECT
month,
month_name,
SUM(boardings) AS Total_Boardings
FROM ridership
GROUP BY month,month_name
ORDER BY month;

#Query 18 – Quarterly Ridership
SELECT
quarter,
SUM(boardings) AS Total_Boardings
FROM ridership
GROUP BY quarter
ORDER BY quarter;

#Query 19 – Demand Level Distribution
SELECT
demand_level,
COUNT(*) AS Days
FROM ridership
GROUP BY demand_level;

#Query 20 – Passenger Density Distribution
SELECT
passenger_density,
COUNT(*) AS Total
FROM ridership
GROUP BY passenger_density;