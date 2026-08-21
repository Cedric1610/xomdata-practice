-- Xom Data · Revenue rank of each category
-- Problem: https://xomdata.com/practice/medium-rank-003
-- Solved: 2026-08-21

WITH base_data AS
(
SELECT category, SUM(amount) AS total_revenue
FROM sales
GROUP BY category
)
SELECT *,
RANK() OVER(ORDER BY total_revenue DESC) AS revenue_rank
FROM base_data
ORDER BY total_revenue DESC, revenue_rank ASC, category ASC
