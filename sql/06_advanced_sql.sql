--  06------------ADVANCED SQL-------------
-- Query 51 – Rank Stations
SELECT

station_name,

SUM(boardings) total_boardings,

RANK() OVER(

ORDER BY SUM(boardings) DESC

) station_rank

FROM ridership

GROUP BY station_name;

-- Query 52 – Dense Rank
SELECT

station_name,

SUM(boardings) total_boardings,

DENSE_RANK() OVER(

ORDER BY SUM(boardings) DESC

) dense_rankk

FROM ridership

GROUP BY station_name;


-- Query 53 – Row Number
SELECT

station_name,

SUM(boardings) total_boardings,

ROW_NUMBER() OVER(

ORDER BY SUM(boardings) DESC

) row_num

FROM ridership

GROUP BY station_name;

-- Query 54 – Running Total
SELECT

year,

SUM(boardings) yearly_boardings,

SUM(SUM(boardings))

OVER(

ORDER BY year

) running_total

FROM ridership

GROUP BY year;

-- Query 55 – Previous Year's Ridership
SELECT

year,

SUM(boardings) yearly_boardings,

LAG(SUM(boardings))

OVER(

ORDER BY year

) previous_year

FROM ridership

GROUP BY year;

-- Query 56 – Year-over-Year Growth
WITH yearly AS

(

SELECT

year,

SUM(boardings) boardings

FROM ridership

GROUP BY year

)

SELECT

year,

boardings,

LAG(boardings)

OVER(ORDER BY year) previous_year,

ROUND(

(boardings-LAG(boardings)

OVER(ORDER BY year))

/

LAG(boardings)

OVER(ORDER BY year)

*100,2

) growth_percentage

FROM yearly;

-- Query 57 – Top Station in Every Year
WITH station_year AS

(

SELECT

year,

station_name,

SUM(boardings) boardings,

RANK()

OVER(

PARTITION BY year

ORDER BY SUM(boardings) DESC

) rk

FROM ridership

GROUP BY year,station_name

)

SELECT *

FROM station_year

WHERE rk=1;

-- Query 58 – Highest Revenue Station Each Year
WITH revenue_rank AS

(

SELECT

year,

station_name,

SUM(daily_revenue) revenue,

ROW_NUMBER()

OVER(

PARTITION BY year

ORDER BY SUM(daily_revenue) DESC

) rn

FROM ridership

GROUP BY year,station_name

)

SELECT *

FROM revenue_rank

WHERE rn=1;

-- Query 59 – Monthly Running Revenue
SELECT

year,

month,

SUM(daily_revenue) revenue,

SUM(SUM(daily_revenue))

OVER(

PARTITION BY year

ORDER BY month

) cumulative_revenue

FROM ridership

GROUP BY year,month;

-- Query 60 – Top 3 Stations Per Administrative Town
WITH ranked AS

(

SELECT

administrative_town,

station_name,

SUM(boardings) boardings,

ROW_NUMBER()

OVER(

PARTITION BY administrative_town

ORDER BY SUM(boardings) DESC

) rn

FROM ridership

GROUP BY administrative_town,station_name

)

SELECT *

FROM ranked

WHERE rn<=3;










