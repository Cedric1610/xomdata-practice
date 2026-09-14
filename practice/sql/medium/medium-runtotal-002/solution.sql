-- Xom Data · Each customer's cumulative spending
-- Problem: https://xomdata.com/practice/medium-runtotal-002
-- Solved: 2026-09-14

SELECT customer_name, month, spend,
SUM(spend) OVER(PARTITION BY customer_name ORDER BY month ASC) AS cumulative_spend
FROM wallet_monthly
ORDER BY customer_name ASC, month ASC
