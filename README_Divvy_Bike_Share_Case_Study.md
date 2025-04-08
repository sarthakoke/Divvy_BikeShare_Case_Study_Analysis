
# 🚲 Divvy Bike-Share Case Study Analysis

## 📌 Overview

This case study was completed as part of the **Google Data Analytics Professional Certificate** program. The goal was to explore user behavior in Chicago’s bike-share system (operated by Divvy, owned by Lyft) and provide actionable insights to help Cyclistic (a fictional company based on Divvy) convert casual riders into annual members.

> 📊 [Interactive Tableau Dashboard](https://public.tableau.com/app/profile/sarthak.oke/viz/DivvyBikesDataset/Dashboard1)

---

## 🎯 Business Task

**Primary Objective**:  
Analyze how **casual riders** and **annual members** use Divvy bikes differently in order to design targeted marketing strategies that convert casual users into members.

---

## 👥 Stakeholders

- **Lily Moreno**: Director of Marketing, responsible for campaign strategy
- **Cyclistic Executive Team**: Final decision-makers for implementing new strategies
- **Marketing Analytics Team**: Responsible for deriving insights from historical data

---

## 🗂️ Data Sources

- **Provider**: Divvy (via Lyft) – public data made available under a shared license
- **Time Period**: April 2023 to March 2024
- **Dataset Size**: Over 970,000 individual ride records
- **Fields Included**: ride ID, start/end stations & time, user type (member/casual), ride length, bike type, geolocation

---

## 🧹 Data Cleaning & Preprocessing

Data was cleaned and transformed using **SQL Server Management Studio (SSMS)**. Key steps included:

- Filtering out rides less than 1 minute or longer than 24 hours
- Removing NULL values for station IDs and geolocation fields
- Creating new features:
  - `ride_length_in_mins`
  - `month`
  - `day_of_week`

📌 Sample transformation:

```sql
SELECT 
  ride_id,
  DATEDIFF(MINUTE, started_at, ended_at) AS ride_length_in_mins,
  DATENAME(MONTH, started_at) AS month,
  DATENAME(WEEKDAY, started_at) AS day_of_week
FROM trips
WHERE ride_length_in_mins BETWEEN 1 AND 1440
  AND start_station_name IS NOT NULL
  AND end_station_name IS NOT NULL
```

---

## 🧠 Key Insights

- **User Distribution**:  
  - Annual Members: 59.22%  
  - Casual Riders: 40.78%

- **Ride Duration**:  
  - Casual users averaged **25–30 minutes per ride**  
  - Members averaged **12–15 minutes per ride**

- **Bike Type Preferences**:
  - Casual riders preferred **electric bikes**
  - Members leaned towards **classic bikes**

- **Weekly Trends**:
  - Casual users peaked on **weekends**, while members rode consistently across weekdays

- **Monthly Trends**:
  - Ridership peaked in **July–August**, declining in winter months

- **Recommendation Based on Cost**:
  - Promoting **classic bikes** may reduce maintenance costs by ~20%

---

## 📊 Visualizations

Tableau dashboard visualizes:
- Ridership by month, week, and user type
- Ride lengths and frequency trends
- Bike type preferences
- Weekly & monthly averages

🖼️ Example preview:

> Check the dashboard linked at the top of this README.

---

## 💡 Recommendations

Based on the data analysis:
- **Incentivize classic bike usage** to reduce maintenance costs
- **Promote weekend membership deals** for casual users who ride most on Saturdays/Sundays
- **Personalized engagement**: Encourage long-ride casual users to consider switching to memberships for cost savings

---

## 🛠️ Tools & Technologies Used

- **SQL Server Management Studio (SSMS)**: Data cleaning, transformation, and analysis
- **Tableau**: Interactive dashboard creation
- **Microsoft Excel/Sheets**: Initial inspection & structure check

---

## 🚧 Limitations

- **No demographic data**: Gender, age, or residence details were excluded due to privacy
- **Geographic patterns**: While analyzed, exact personal locations cannot be linked due to anonymization
- **Behavioral motivation**: The dataset doesn't reveal "why" users ride, just "how"

---

## 📁 Folder Structure (example)

```
📁 Divvy-Case-Study
├── 📊 TableauDashboard.twbx
├── 🧾 README.md
├── 📄 SQL_Cleaning_Queries.sql
├── 📂 Assets
│   └── divvy-dashboard.png
└── 📄 Cleaned_Dataset.csv
```

---

## 🏁 Conclusion

This project highlights how even basic user segmentation and ride pattern analysis can lead to powerful insights for shaping product and marketing strategies in shared mobility services.

---

## 🔗 References

- [Divvy System Data](https://ride.divvybikes.com/system-data)
- [Google Data Analytics Capstone](https://www.coursera.org/professional-certificates/google-data-analytics)

---

> 💼 *Project completed as a final capstone for the Google Data Analytics Professional Certificate*
