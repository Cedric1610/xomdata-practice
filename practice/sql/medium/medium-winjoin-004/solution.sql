-- Xom Data · The same customer's previous order
-- Problem: https://xomdata.com/practice/medium-winjoin-004
-- Solved: 2026-08-28

SELECT member_name, purchase_date, amount,
LAG(amount,1) OVER(PARTITION BY member_name ORDER BY purchase_date ASC) AS prev_amount
FROM purchases AS p
JOIN members AS m
    ON p.member_id = m.id
