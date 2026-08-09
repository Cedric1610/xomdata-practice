-- Xom Data · Monthly income and expense report
-- Problem: https://xomdata.com/practice/medium-groupby-080
-- Solved: 2026-08-09

WITH cte_table AS
(
SELECT
STRFTIME('%Y-%m', transaction_date) AS month,
SUM(
    CASE
        WHEN type = 'Thu' THEN amount
        ELSE 0
    END) AS total_income,
SUM(
    CASE
        WHEN type = 'Chi' THEN amount
        ELSE 0
    END) AS total_expense
FROM transactions
GROUP BY month
), cte_table2 AS
(
SELECT *,
(total_income - total_expense) AS balance,
SUM(total_income - total_expense) OVER(ORDER BY month ASC) AS cumulative_balance
FROM cte_table
)
SELECT *,
CASE
    WHEN balance > 0 THEN 'Surplus'
    WHEN balance = 0 THEN 'Balanced'
    ELSE 'Deficit'
END AS status
FROM cte_table2
ORDER BY month ASC
