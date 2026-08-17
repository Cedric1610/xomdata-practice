-- Xom Data · 7-day moving average of revenue
-- Problem: https://xomdata.com/practice/hard-frame-001
-- Solved: 2026-08-17

SELECT date, amount AS revenue,
ROUND(AVG(amount) OVER(ORDER BY date ASC ROWS BETWEEN 6 PRECEDING AND CURRENT ROW),2) AS ma7
FROM daily_revenue
ORDER BY date ASC
