-- Xom Data · Sales rankings with department names
-- Problem: https://xomdata.com/practice/medium-winjoin-001
-- Solved: 2026-08-05

SELECT dept_name,
RANK() OVER(PARTITION BY dept_name ORDER BY sales_amount DESC) AS dept_rank,
staff_name, sales_amount
FROM departments AS d 
JOIN staff AS s 
    ON d.id = dept_id
ORDER BY dept_name ASC, dept_rank ASC, staff_name ASC
