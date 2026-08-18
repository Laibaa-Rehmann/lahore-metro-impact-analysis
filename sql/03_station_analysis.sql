
# 03------------STATION ANALYSIS-------------
#Query 21 – Top 10 Busiest Stations
-- Query 21: Top 10 Stations by Total Boardings

SELECT
    station_name,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY station_name
ORDER BY total_boardings DESC
LIMIT 10;


#Query 22 – Bottom 10 Stations
-- Query 22: Bottom 10 Stations by Total Boardings

SELECT
    station_name,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY station_name
ORDER BY total_boardings ASC
LIMIT 10;

#Query 23 – Highest Revenue Stations
-- Query 23: Stations Generating Highest Revenue(SHAHDARA)

SELECT
    station_name,
    SUM(daily_revenue) AS total_revenue
FROM ridership
GROUP BY station_name
ORDER BY total_revenue DESC;


#Query 24 – Highest Occupancy Stations
-- Query 24: Average Occupancy by Station

SELECT
    station_name,
    ROUND(AVG(occupancy_rate),2) AS avg_occupancy
FROM ridership
GROUP BY station_name
ORDER BY avg_occupancy DESC;

#Query 25 – Ridership by Administrative Town
-- Query 25: Administrative Town Performance

SELECT
    administrative_town,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY administrative_town
ORDER BY total_boardings DESC;


#Query 26 – Ridership by Area Type
-- Query 26: Urban vs Commercial vs Residential Areas

SELECT
    area_type,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY area_type
ORDER BY total_boardings DESC;

-- Query 27: Top 5 Landmarks by Ridership

-- Query 27: Top 5 Landmarks by Ridership

SELECT
    s.Landmark,
    SUM(r.boardings) AS total_boardings
FROM ridership r
JOIN stations s
    ON r.station_id = s.station_id
WHERE s.Landmark IS NOT NULL
  AND s.Landmark <> ''
GROUP BY s.Landmark
ORDER BY total_boardings DESC
LIMIT 5;

#Query 28 – Average Daily Ridership by Station
-- Query 28: Average Daily Ridership per Station

SELECT
    station_name,
    ROUND(AVG(daily_ridership),0) AS avg_daily_ridership
FROM ridership
GROUP BY station_name
ORDER BY avg_daily_ridership DESC;

#Query 29 – Station Ranking
-- Query 29: Rank Stations by Boardings

SELECT
    station_name,
    SUM(boardings) AS total_boardings,
    RANK() OVER (
        ORDER BY SUM(boardings) DESC
    ) AS station_rank
FROM ridership
GROUP BY station_name;

#Query 30 – Passenger Density by Station
-- Query 30: Passenger Density Categories

SELECT
    station_name,
    passenger_density,
    COUNT(*) AS observations
FROM ridership
GROUP BY station_name, passenger_density
ORDER BY station_name;
