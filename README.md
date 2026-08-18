# 🚍 Lahore Metro Bus Impact Analysis

> An end-to-end data analytics project analyzing Lahore Metro Bus ridership patterns, station performance, seasonal trends, holidays, fares, weather, population, and fuel prices using SQL and Power BI.

---

## 📊 Project Overview

The **Lahore Metro Bus Impact Analysis** is a data analytics project designed to understand passenger ridership patterns and identify the key factors associated with changes in Lahore Metro Bus usage.

The project analyzes historical transportation data from **2014 to 2025** and combines multiple datasets to explore ridership trends across time, stations, seasons, holidays, weather conditions, fares, population, and fuel prices.

The analysis follows a complete data analytics workflow:

**Raw Data → Data Preparation → SQL Analysis → KPI Development → Power BI Visualization → Insights → Recommendations**

---
<img width="1201" height="678" alt="image" src="https://github.com/user-attachments/assets/aee59da7-2d0a-4b92-accc-24551d487518" />


## 🎯 Business Objective

The main objective of this project is to transform historical Metro Bus data into actionable insights that can help understand passenger demand and support transportation planning.

The analysis focuses on questions such as:

- How has Metro Bus ridership changed over time?
- Which year recorded the highest ridership?
- Which stations have the highest passenger demand?
- How does ridership differ between holidays and non-holidays?
- Which seasons have the highest ridership?
- How do weather conditions relate to ridership?
- How have fare changes evolved over time?
- How does population growth compare with ridership growth?
- How do fuel price changes relate to ridership patterns?
- Which operational areas require greater attention?

---

# 🛠️ Tools & Technologies

| Tool | Purpose |
|---|---|
| **MySQL** | Database management and SQL analysis |
| **SQL** | Data exploration, transformation and analytical queries |
| **Power BI** | Interactive dashboard and data visualization |
| **DAX** | KPI and analytical measures |
| **Excel / CSV** | Data inspection and preparation |
| **GitHub** | Project documentation and version control |

---

# 📂 Datasets

The analysis combines multiple datasets related to Lahore Metro Bus operations and external factors.

### Core datasets

- **Ridership** — Daily passenger ridership data
- **Stations** — Station information and characteristics
- **Weather** — Weather-related data
- **Holiday** — Holiday and non-holiday indicators
- **Population** — Population data
- **Fare History** — Historical fare information
- **Fuel Prices** — Historical fuel price information

The complete ridership dataset is larger than GitHub's standard web upload limit, so a representative sample is provided in the repository while the full dataset was used for the analysis.

---

# 🔎 SQL Analysis

The project includes **60 SQL analytical queries** covering multiple areas of the Metro Bus system.

### Ridership Analysis

- Total ridership
- Average daily ridership
- Yearly ridership trends
- Monthly ridership trends
- Ridership growth
- Moving averages
- Weekend vs weekday analysis
- Peak ridership periods

### Station Analysis

- Station-level ridership
- Highest-ridership stations
- Station rankings
- Interchange vs non-interchange stations
- Route-level performance

### Holiday Analysis

- Holiday vs non-holiday ridership
- Average ridership comparison
- Holiday ridership impact
- Percentage change in ridership

### Seasonal Analysis

- Ridership by season
- Seasonal comparisons
- Identification of high- and low-ridership periods

### Weather Analysis

- Weather conditions and ridership
- Weather score analysis
- Ridership patterns across different weather conditions

### Fare Analysis

- Historical fare trends
- Average fare
- Fare categories
- Fare and ridership analysis

### Population Analysis

- Population growth
- Ridership growth
- Comparison between population and ridership trends

### Fuel Price Analysis

- Fuel price trends
- Fuel price categories
- Relationship between fuel prices and ridership

---

# 📈 Power BI Dashboard

The SQL analysis was transformed into an interactive **Power BI dashboard** designed to provide a clear overview of Metro Bus performance.

### Dashboard includes:

- Executive Overview
- Ridership Trends
- Station Performance
- Revenue and Fare Analysis
- External Factor Analysis
- Insights and Recommendations

---

# 📌 Key Performance Indicators

| KPI | Result |
|---|---:|
| **Total Ridership** | **513M** |
| **Peak Ridership Year** | **2023** |
| **Holiday Ridership Impact** | **-27.82%** |
| **Highest-Ridership Station** | **Shahdara** |

---

# 💡 Key Insights

### 1. High Overall Passenger Demand

The Metro Bus system recorded approximately **513 million passenger boardings** across the analyzed period, demonstrating the importance of the system within Lahore's public transportation network.

### 2. 2023 Recorded Peak Ridership

**2023** was identified as the peak ridership year in the analyzed dataset.

This makes 2023 an important period for further investigation into the factors contributing to increased passenger demand.

### 3. Significant Holiday Ridership Decline

Average ridership during holidays was approximately **27.82% lower** than during non-holiday periods.

This indicates a clear difference in passenger demand between regular operating days and holidays.

### 4. Shahdara Was the Highest-Ridership Station

**Shahdara** recorded the highest ridership among the analyzed stations.

High-demand stations can be important areas for operational planning, passenger-flow management, and capacity considerations.

### 5. Ridership Varies Across Seasons

The analysis identified differences in ridership across seasons, highlighting the importance of considering seasonal demand when evaluating transportation usage.

### 6. Station Performance Is Uneven

Passenger demand is not distributed equally across stations. Some locations consistently attract substantially more passengers, making station-level analysis important for understanding the overall system.

---

# 📊 Dashboard Preview

## Executive Dashboard
<img width="1201" height="678" alt="image" src="https://github.com/user-attachments/assets/aee59da7-2d0a-4b92-accc-24551d487518" />



## Ridership Analysis

<img width="836" height="679" alt="ridership analysis" src="https://github.com/user-attachments/assets/2d6bac27-379c-45cb-a01e-39108508f3a0" />


## Station Analysis

<img width="825" height="684" alt="station analysis" src="https://github.com/user-attachments/assets/71a9fc5e-2f3c-42a3-bf8e-e31fdf6155d5" />


## Revenue and Fare Analysis

<img width="837" height="681" alt="Revenue and Fare analysis" src="https://github.com/user-attachments/assets/f41e050d-5018-41e0-8fd3-290882c86f78" />


## External Factor Analysis

<img width="836" height="687" alt="External Factor analysis" src="https://github.com/user-attachments/assets/89df34fc-37a3-47f5-aed2-4f12dc037585" />


## Insights and recommendations

<img width="744" height="686" alt="Insights n recommedations" src="https://github.com/user-attachments/assets/7b7bfef0-2ce2-4989-b1b1-8f0bea0b2114" />



# 🧮 Example DAX Measures

### Average Daily Ridership

```DAX
Average Daily Ridership =
AVERAGE('lahore_metro_analysis ridership'[daily_ridership])

### Average Occupancy

```DAX
Average Occupancy =
AVERAGE('lahore_metro_analysis ridership'[occupancy_rate])


### Average Fare

```DAX
Average Fare =
AVERAGE('lahore_metro_analysis fare_history'[fare_per_trip_pkr])


### Highest Ridership Station

```DAX
Highest Ridership Station = 
CALCULATE(
    MAX('lahore_metro_analysis ridership'[station_name]),
    TOPN(
        1,
        VALUES('lahore_metro_analysis ridership'[station_name]),
        CALCULATE(SUM('lahore_metro_analysis ridership'[daily_ridership])),
        DESC
    )
)


### Total Ridership

```DAX
Total Ridership = 
SUM('lahore_metro_analysis ridership'[daily_ridership])


### Years Covered

```DAX
Years Covered = 
DISTINCTCOUNT('lahore_metro_analysis ridership'[year])


### Peak Ridership Year

```DAX
Peak Ridership Year = 
VAR YearlyTable =
    SUMMARIZE(
        'lahore_metro_analysis ridership',
        'lahore_metro_analysis ridership'[year],
        "YearTotal",
            CALCULATE(
                SUM('lahore_metro_analysis ridership'[daily_ridership])
            )
    )
VAR BestYear =
    TOPN(
        1,
        YearlyTable,
        [YearTotal], DESC
    )
RETURN
    MAXX(
        BestYear,
        'lahore_metro_analysis ridership'[year]
    )



###🚀 Recommendations

Based on the findings, several operational recommendations can be considered:

**1. Optimize Holiday Operations**

Historical holiday demand patterns can be used to adjust service frequency, fleet allocation, and staffing according to expected passenger demand.

**2. Prioritize High-Demand Stations**

High-ridership stations such as Shahdara should receive greater attention when evaluating passenger flow, capacity, service frequency, and infrastructure requirements.

**3. Use Seasonal Demand Patterns**

Seasonal ridership trends can support better planning of bus frequency and operational resources during periods of changing passenger demand.

**4. Adopt Demand-Based Scheduling**

Ridership patterns by day, month, season, and holiday status can be used to develop more efficient transportation schedules.

**5. Monitor External Factors**

Weather, population, fares, and fuel prices should be considered alongside ridership when evaluating changes in passenger demand.


**📌 Project Workflow**
Raw Data
   ↓
Data Preparation
   ↓
MySQL Database
   ↓
60 SQL Analytical Queries
   ↓
KPI & Insight Development
   ↓
Power BI Dashboard
   ↓
Business Insights
   ↓
Operational Recommendations


👤 Author

Laiba Rehman
