-- Xom Data · Splitting customers into four spending tiers
-- Problem: https://xomdata.com/practice/medium-ntile-001
-- Solved: 2026-09-12

SELECT customer_name, total_spent,
    NTILE(4) OVER(ORDER BY total_spent DESC, customer_name ASC) AS spend_quartile
FROM customer_spending
ORDER BY spend_quartile ASC, total_spent DESC, customer_name ASC
