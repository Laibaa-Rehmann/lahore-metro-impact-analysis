 -- 05------------EXTERNAL FACTORS (weather,FUEL,FARE ETC)ANALYSIS-------------
-- Query 41: Average Boardings by Weather Condition

SELECT
    w.weather_description,
    ROUND(AVG(r.boardings),0) AS avg_boardings

FROM ridership r

JOIN weather w
ON STR_TO_DATE(r.date,'%Y-%m-%d %H:%i:%s')
=
STR_TO_DATE(w.time,'%Y-%m-%d')

GROUP BY w.weather_description

ORDER BY avg_boardings DESC;

-- Query 42: Rainfall Effect
SELECT

CASE
WHEN w.rain_sum_mm=0 THEN 'No Rain'
WHEN w.rain_sum_mm<=5 THEN 'Light Rain'
WHEN w.rain_sum_mm<=20 THEN 'Moderate Rain'
ELSE 'Heavy Rain'
END AS rainfall_category,

ROUND(AVG(r.boardings),0) AS avg_boardings

FROM ridership r

JOIN weather w
ON STR_TO_DATE(r.date,'%Y-%m-%d %H:%i:%s')
=
STR_TO_DATE(w.time,'%Y-%m-%d')

GROUP BY rainfall_category

ORDER BY avg_boardings DESC;

-- Query 43 – Temperature vs Ridership
SELECT

ROUND(w.temperature_2m_max_degc) AS temperature,

ROUND(AVG(r.boardings),0) AS avg_boardings

FROM ridership r

JOIN weather w
ON STR_TO_DATE(r.date,'%Y-%m-%d %H:%i:%s')
=
STR_TO_DATE(w.time,'%Y-%m-%d')

GROUP BY temperature

ORDER BY temperature;

-- Query 44 – Holiday vs Normal Days
SELECT

CASE

WHEN h.holiday_name IS NULL THEN 'Normal Day'

ELSE 'Holiday'

END AS day_type,

ROUND(AVG(r.boardings),0) AS avg_boardings

FROM ridership r

LEFT JOIN holidays h

ON STR_TO_DATE(r.date,'%Y-%m-%d %H:%i:%s')
=
STR_TO_DATE(h.date,'%Y-%m-%d')

GROUP BY day_type;

-- Query 45 – Public Holiday Types
SELECT

holiday_type,

COUNT(*) total_holidays

FROM holidays

GROUP BY holiday_type;


-- Query 46 – Fuel Price vs Ridership
SELECT

f.petrol_ron92,

ROUND(AVG(r.boardings),0) avg_boardings

FROM ridership r

JOIN fuel_prices f

ON r.year=f.year

GROUP BY f.petrol_ron92

ORDER BY f.petrol_ron92;

-- Query 47 – Fare Changes
SELECT

fare_type,

AVG(fare_per_trip_pkr) average_fare

FROM fare_history

GROUP BY fare_type;

-- Query 48 – Population Growth
SELECT

year,

population,

annual_growth_rate

FROM population

ORDER BY year;

-- Query 49 – Population vs Ridership
SELECT

p.year,

p.population,

SUM(r.boardings) total_boardings

FROM population p

JOIN ridership r

ON p.year=r.year

GROUP BY p.year,p.population

ORDER BY p.year;

-- Query 50 – Revenue by Fuel Price
SELECT

f.petrol_ron92,

SUM(r.daily_revenue) total_revenue

FROM ridership r

JOIN fuel_prices f

ON r.year=f.year

GROUP BY f.petrol_ron92

ORDER BY f.petrol_ron92;









