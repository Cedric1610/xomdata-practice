-- Xom Data · Each customer's latest contact number
-- Problem: https://xomdata.com/practice/medium-dedup-001
-- Solved: 2026-09-11

SELECT customer_name, phone, MAX(updated_date) AS updated_date
FROM contact_updates
GROUP BY customer_name
ORDER BY customer_name ASC
