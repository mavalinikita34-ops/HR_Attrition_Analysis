use hr_analytics;
rename table hr_attrition_cleaned to hr_attrition;
select count(*) from hr_attrition;

--1)OVERALL ATTRITION % 
select count(*) as total_employees,
sum(attritionflag) as employees_left,
Round(AVG(Attritionflag) * 100, 1) as atttrition_pct
from hr_attrition;

--2) ATTRITION % BY DEPARTMENT 
SELECT department, COUNT(*) as total,
sum(attritionflag) as LEFT_COUNT,
round(avg(attritionflag) * 100,1) as attrition_pct
from hr_attrition
group by department
order by attrition_pct DESC;

--3) ATTRITION % BY OVERTIME
SELECT overtime,
round(avg(attritionflag) * 100,1) as attrition_pct
from hr_attrition
group by overtime; 


-- 4)ATTRITION % BY AGE GROUP
SELECT AGEGROUP,
ROUND(AVG(ATTRITIONFLAG) *100,1) as attrition_pct
from hr_attrition 
group by agegroup
order by attrition_pct DESC; 

 -- 5)average salary by job role
 SELECT JOBROLE,
 ROUND(AVG(MONTHLYincome)) as avg_income
 from hr_attrition
 group by jobrole
 order by avg_income DESC;
--6)CASE WHEN:LABEL JOB ROLES BY ATTRITION LEVEL

select jobrole,
round(avg(attritionflag)*100, 1)as attrition_pct,
case when avg(attritionflag) >= 0.20 then 'high'
when avg(attritionflag) >=0.10 then 'medium'
else 'low' end as risk_level
from hr_attrition
group by jobrole; 
