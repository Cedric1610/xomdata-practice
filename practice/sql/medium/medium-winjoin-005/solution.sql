-- Xom Data · This invoice's share of the client's spend
-- Problem: https://xomdata.com/practice/medium-winjoin-005
-- Solved: 2026-08-28

SELECT client_name, invoice_code, amount,
ROUND(amount * 100.0 /SUM(amount) OVER(PARTITION BY client_name),2) AS pct_of_client
FROM invoices AS i
JOIN clients AS c
    ON i.client_id = c.id
ORDER BY client_name ASC, amount DESC, invoice_code ASC
