# HR Attrition Analysis (Excel + SQL + Power BI)

An end-to-end HR analytics project that analyses employee attrition using the **same dataset in three tools**: Excel for cleaning and MIS reporting, SQL for analysis, and Power BI for an interactive dashboard.

## Problem Statement

Why are employees leaving the company? This project finds which departments, age groups, job roles and working conditions (such as overtime) are linked to higher attrition, so HR can focus on the right areas.

## Dataset

- **Source:** IBM HR Analytics Employee Attrition & Performance (Kaggle)
- **Size:** 1,470 employees, 35 original columns
- **Key columns:** Age, Attrition, Department, JobRole, MonthlyIncome, OverTime, Gender, JobSatisfaction

## Tools Used

| Tool | Used for |
|---|---|
| Excel | Data cleaning, new fields, MIS summary, charts |
| MySQL | Analysis queries (GROUP BY, CASE WHEN, aggregate functions) |
| Power BI | KPI cards, charts and slicers |

## Project Steps

### 1. Excel: cleaning and MIS report
- Checked for blank cells and duplicate rows (none found).
- Removed 3 redundant columns (`EmployeeCount`, `Over18`, `StandardHours`) that had the same value in every row.
- Added readable labels for `Education` and `JobSatisfaction`.
- Created new fields: `AgeGroup`, `SalaryBand` and `AttritionFlag` (1 = left, 0 = stayed).
- Built an MIS summary with KPIs, attrition tables (Department, OverTime, Age Group, Salary Band, Gender, Job Role) and charts.
- Validated that every table total equals 1,470 employees.

### 2. SQL: analysis
- Imported the cleaned CSV into MySQL as `hr_attrition`.
- Wrote queries for overall attrition, attrition by department, overtime and age group, average income by job role, and a CASE WHEN risk label for each job role.
- Cross-checked the SQL results against the Excel summary.

### 3. Power BI: dashboard
- Loaded the same cleaned data.
- Created a measure: `Attrition % = AVERAGE(Data[AttritionFlag])`.
- Built KPI cards (Total Employees, Employees Left, Attrition %, Avg Monthly Income), charts by Department, Age Group and OverTime, and slicers.

## Key Insights

- Overall attrition is **16.1%** (237 of 1,470 employees left).
- Employees working **overtime** leave far more often: **30.5%** vs **10.4%**, about 3 times higher.
- **Sales** has the highest attrition among departments (**20.6%**), followed by HR (19.0%) and R&D (13.8%).
- Younger employees (**18-25**) have the highest attrition at **35.8%**, while the 36-45 group has the lowest (9.2%).
- **Sales Representatives** have the highest attrition among job roles (**39.8%**) and also the lowest average monthly income.

> Note: these patterns show association, not proof of cause.

## Screenshots

### Power BI dashboard
![Dashboard](screenshots/dashboard_overview.png)

### Excel MIS summary
![Excel Summary](screenshots/excel_summary_top.png)

### SQL results
![Department attrition](screenshots/sql_department_attrition.png)
![Overtime attrition](screenshots/sql_overtime_attrition.png)

## Repository Structure

```
HR-Attrition-Analysis/
├── data/HR_Attrition_Cleaned.csv 
├── screenshots/
├── sql/hr_attrition_queries.sql
├── excel/HR_Attrition_Analysis.xlsx
├── powerbi/HR_Attrition_Dashboard.pbix
└── README.md
```

## How to Reproduce

1. Open `excel/HR_Attrition_Analysis.xlsx` to see the cleaning steps and MIS summary.
2. In MySQL, create a database, import `data/HR_Attrition_Cleaned.csv` as `hr_attrition`, and run `sql/hr_attrition_queries.sql`.
3. Open `powerbi/HR_Attrition_Dashboard.pbix` in Power BI Desktop.

## Assumptions

- Salary bands are defined as Low (< 3,000), Medium (3,000 to 7,999) and High (8,000+). These cutoffs are chosen by the analyst and can be changed in the `Lookups` sheet of the Excel file.
