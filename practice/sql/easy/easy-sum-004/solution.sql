-- Xom Data · Total shipping fees collected
-- Problem: https://xomdata.com/practice/easy-sum-004
-- Solved: 2026-07-27

SELECT SUM(shipping_fee) AS total_fee
FROM shipments
