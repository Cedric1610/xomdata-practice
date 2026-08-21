-- Xom Data · Sales rank within each region
-- Problem: https://xomdata.com/practice/medium-rank-002
-- Solved: 2026-08-21

SELECT
region,
RANK() OVER(PARTITION BY region ORDER BY sales_amount DESC) AS region_rank,
rep_name,
sales_amount
FROM reps
ORDER BY region ASC ,sales_amount DESC, region_rank ASC, rep_name ASC
