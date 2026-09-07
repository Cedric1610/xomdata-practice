-- Xom Data · Each expense's share of the fund
-- Problem: https://xomdata.com/practice/medium-winagg-006
-- Solved: 2026-09-07

SELECT expense_name, amount,
   ROUND(amount * 100.00/SUM(amount) OVER(),2) AS pct_of_total
FROM fund_expenses
ORDER BY amount DESC, expense_name ASC
