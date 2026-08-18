# 04------------TIME ANALYSIS-------------
-- Query 31: Yearly Boardings
SELECT
    year,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY year
ORDER BY year;

-- Query 32: Monthly Boardings
SELECT
    month,
    month_name,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY month, month_name
ORDER BY month;

-- Query 33: Quarterly Boardings
SELECT
    quarter,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY quarter
ORDER BY quarter;

-- Query 34: Ridership by Day
SELECT
    day_name,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY day_name
ORDER BY FIELD(
    day_name,
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
);

-- Query 35: Weekday vs Weekend

SELECT
    CASE
        WHEN is_weekend=1 THEN 'Weekend'
        ELSE 'Weekday'
    END AS day_type,

    SUM(boardings) AS total_boardings

FROM ridership

GROUP BY day_type;

-- Query 36: Top 5 Months(OCT<NOV<DEC<JAN<MAY)

SELECT
    month_name,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY month, month_name
ORDER BY total_boardings DESC
LIMIT 5;

-- Query 37: Lowest 5 Months(JULY<JUN<FEB<AUG<APR)

SELECT
    month_name,
    SUM(boardings) AS total_boardings
FROM ridership
GROUP BY month, month_name
ORDER BY total_boardings ASC
LIMIT 5;

-- Query 38: Occupancy by Month

SELECT
    month_name,
    ROUND(AVG(occupancy_rate),2) AS avg_occupancy
FROM ridership
GROUP BY month, month_name
ORDER BY month;

-- Query 39: Revenue Trend

SELECT
    month_name,
    SUM(daily_revenue) AS total_revenue
FROM ridership
GROUP BY month, month_name
ORDER BY month;

-- Query 40: Average Boardings by Day

SELECT
    day_name,
    ROUND(AVG(boardings),0) AS avg_boardings
FROM ridership
GROUP BY day_name
ORDER BY FIELD(
    day_name,
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday'
);

