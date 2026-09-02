-- Xom Data · So găng lượng khách giữa các quý
-- Problem: https://xomdata.com/practice/medium-active-006
-- Solved: 2026-09-02

WITH base_data AS
(
SELECT strftime('%Y-', order_date) || 'Q' || ((CAST(strftime('%m', order_date) AS INTEGER) + 2) / 3) AS quarter, COUNT(DISTINCT customer_id) AS active_customers
FROM orders
GROUP BY quarter
)
SELECT *,
active_customers - LAG(active_customers,1) OVER(ORDER BY quarter ASC) AS change_vs_prev
FROM base_data
