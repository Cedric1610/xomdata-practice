-- Xom Data · Salary by department and title
-- Problem: https://xomdata.com/practice/medium-join-126
-- Solved: 2026-08-13

WITH cte_table AS
(
SELECT department_name, position_name, COUNT(DISTINCT e.id) AS employee_count,
AVG(net_salary) AS avg_salary,
MIN(net_salary) AS min_salary,
MAX(net_salary) AS max_salary,
MAX(net_salary) - MIN(net_salary) AS salary_spread
FROM employees AS e
JOIN departments AS d
    ON e.department_id = d.id
JOIN positions AS p 
    ON e.position_id = p.id
JOIN payroll AS pa 
    ON e.id = pa.employee_id
GROUP BY department_name, position_name
)
SELECT *,
DENSE_RANK() OVER(PARTITION BY department_name ORDER BY avg_salary DESC) AS rank_in_dept
FROM cte_table
ORDER BY department_name ASC, rank_in_dept ASC, position_name ASC
