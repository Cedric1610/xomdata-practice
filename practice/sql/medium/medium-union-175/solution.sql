-- Xom Data · Summary of issues to handle
-- Problem: https://xomdata.com/practice/medium-union-175
-- Solved: 2026-08-30

WITH base_data AS
(
    SELECT 'Complaint' AS type,
    COALESCE(SUM(CASE WHEN status = 'Pending' THEN 1 ELSE 0 END), 0) AS quantity
    FROM complaints
    UNION ALL
    SELECT 'Cancelled Order' AS type,
    COALESCE(SUM(CASE WHEN status = 'Cancelled' THEN 1 ELSE 0 END), 0) AS quantity
    FROM orders
    UNION ALL
    SELECT 'Out of Stock Product' AS type,
    COALESCE(SUM(CASE WHEN status = 'Out of Stock' THEN 1 ELSE 0 END), 0) AS quantity
    FROM products
)
SELECT 
    type,
    quantity,
    ROUND(quantity * 100.0 / SUM(quantity) OVER(), 2) AS pct_of_total,
    RANK() OVER(ORDER BY quantity DESC) AS rank_pos,
    ROUND(
        SUM(quantity) OVER(ORDER BY quantity DESC, type ASC) * 100.0 
        / SUM(quantity) OVER(), 
    2) AS cumulative_pct
FROM base_data
ORDER BY 
    rank_pos ASC, 
    type ASC;
