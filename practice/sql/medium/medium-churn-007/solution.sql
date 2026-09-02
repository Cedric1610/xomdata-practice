-- Xom Data · Doanh thu đội nón ra đi cùng khách cũ
-- Problem: https://xomdata.com/practice/medium-churn-007
-- Solved: 2026-09-02

SELECT customer_id, MAX(order_date) AS last_order_date,
SUM(amount) AS lost_revenue
FROM orders
GROUP BY customer_id
HAVING julianday('2024-06-30') - julianday(MAX(order_date)) > 90
ORDER BY lost_revenue DESC, customer_id ASC
