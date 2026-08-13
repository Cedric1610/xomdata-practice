-- Xom Data · Employees averaging over 5 overtime hours
-- Problem: https://xomdata.com/practice/medium-having-128
-- Solved: 2026-08-13

WITH cte_table AS 
(
SELECT full_name, employee_code,
AVG(work_days) AS avg_work_days,
AVG(overtime_hours) AS avg_overtime_hours,
AVG(net_salary) AS avg_salary,
ROUND(AVG(overtime_hours)/AVG(work_days),4) AS overtime_intensity
FROM employees AS e 
JOIN attendance AS a 
    ON e.id = a.employee_id
JOIN payroll AS p
    ON e.id = p.employee_id
GROUP BY full_name, employee_code
HAVING AVG(overtime_hours) > 5 AND AVG(work_days) >= 18
)
SELECT *,
DENSE_RANK() OVER(ORDER BY overtime_intensity DESC) AS intensity_rank,
NTILE(4) OVER(ORDER BY overtime_intensity DESC) AS workload_quartile
FROM cte_table
ORDER BY intensity_rank ASC, employee_code ASC
