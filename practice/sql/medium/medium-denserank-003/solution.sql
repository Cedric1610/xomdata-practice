-- Xom Data · Spending tiers of loyal customers
-- Problem: https://xomdata.com/practice/medium-denserank-003
-- Solved: 2026-09-05

WITH base_data AS
(
SELECT customer_name, SUM(amount) AS total_spent
FROM purchases
GROUP BY customer_name
)
SELECT *, DENSE_RANK() OVER(ORDER BY total_spent DESC) AS spend_tier
FROM base_data
ORDER BY spend_tier ASC, customer_name ASC
