-- Xom Data · Cumulative revenue from successful transactions only
-- Problem: https://xomdata.com/practice/hard-conditional-001
-- Solved: 2026-09-06

WITH base_data AS
(
SELECT id, date, status, amount,
    CASE
        WHEN status = 'success' THEN amount
        ELSE 0
    END AS support_col
FROM transactions
)
SELECT date, status, amount, SUM(support_col) OVER(ORDER BY date ASC, status ASC, id ASC) AS running_success_total
FROM base_data
ORDER BY date ASC, status ASC, id ASC
