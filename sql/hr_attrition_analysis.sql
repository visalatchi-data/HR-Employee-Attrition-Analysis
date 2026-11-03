-- 1. Overall attrition rate
SELECT COUNT(*) AS total_employees,
       SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrited,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition;

-- 2. Department-wise attrition (MAIN)
SELECT department,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrited,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY department
ORDER BY attrition_pct DESC;

-- 3. Job role-wise attrition
SELECT job_role,
       COUNT(*) AS total,
       SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) AS attrited,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct,
       RANK() OVER (ORDER BY SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) DESC) AS rnk
FROM hr_attrition
GROUP BY job_role;

-- 4. OverTime vs attrition
SELECT overtime,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY overtime;

-- 5. Age group-wise
SELECT CASE WHEN age < 25 THEN 'Below 25'
            WHEN age BETWEEN 25 AND 35 THEN '25-35'
            WHEN age BETWEEN 36 AND 45 THEN '36-45'
            ELSE '45+' END AS age_group,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY age_group
ORDER BY attrition_pct DESC;

-- 6. Income band-wise
SELECT CASE WHEN monthly_income < 3000 THEN 'Low (<3K)'
            WHEN monthly_income < 6000 THEN 'Medium (3-6K)'
            WHEN monthly_income < 10000 THEN 'High (6-10K)'
            ELSE 'Very High (10K+)' END AS income_band,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY income_band
ORDER BY attrition_pct DESC;

-- 7. Tenure-wise
SELECT CASE WHEN years_at_company <= 2 THEN '0-2 yrs'
            WHEN years_at_company <= 5 THEN '3-5 yrs'
            WHEN years_at_company <= 10 THEN '6-10 yrs'
            ELSE '10+ yrs' END AS tenure_band,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY tenure_band
ORDER BY attrition_pct DESC;

-- 8. Job satisfaction vs attrition
SELECT job_satisfaction,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY job_satisfaction
ORDER BY job_satisfaction;

-- 9. Business travel vs attrition
SELECT business_travel,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY business_travel
ORDER BY attrition_pct DESC;

-- 10. Department + OverTime combo
SELECT department, overtime,
       COUNT(*) AS total,
       ROUND(100.0 * SUM(CASE WHEN attrition='Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_pct
FROM hr_attrition
GROUP BY department, overtime
ORDER BY department, overtime;
