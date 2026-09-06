-- Xom Data · Median and percentile salary by department
-- Problem: https://xomdata.com/practice/hard-percentile-001
-- Solved: 2026-09-06

WITH percenrank AS (
    SELECT 
        department,
        salary,
        PERCENT_RANK() OVER(PARTITION BY department ORDER BY salary ASC) AS pr
    FROM employees
),
rank_distance AS (
    SELECT 
        department,
        salary,
        ROW_NUMBER() OVER(PARTITION BY department ORDER BY ABS(pr - 0.25) ASC, salary ASC) AS rn_25,
        ROW_NUMBER() OVER(PARTITION BY department ORDER BY ABS(pr - 0.50) ASC, salary ASC) AS rn_50,
        ROW_NUMBER() OVER(PARTITION BY department ORDER BY ABS(pr - 0.75) ASC, salary ASC) AS rn_75
    FROM percenrank
)
SELECT 
    department,
    MAX(CASE WHEN rn_25 = 1 THEN salary END) AS p25,
    MAX(CASE WHEN rn_50 = 1 THEN salary END) AS p50,
    MAX(CASE WHEN rn_75 = 1 THEN salary END) AS p75
FROM rank_distance
GROUP BY department
ORDER BY department ASC;
