-- Xom Data · Suppliers that deliver late frequently
-- Problem: https://xomdata.com/practice/medium-having-162
-- Solved: 2026-08-29

WITH base_data AS
(
    SELECT 
        s.supplier_name, 
        s.material_type,
        COUNT(po.id) AS purchase_count,
        SUM(po.total_value) AS total_purchase_value,
        ROUND(AVG(julianday(po.actual_receipt) - julianday(po.expected_receipt)), 2) AS avg_late_days,
        ROUND(
            SUM(CASE WHEN julianday(po.actual_receipt) <= julianday(po.expected_receipt) THEN 1.0 ELSE 0.0 END) * 100.0 / COUNT(po.id), 
            2
        ) AS on_time_rate
    FROM suppliers AS s
    INNER JOIN purchase_orders AS po 
        ON s.id = po.supplier_id
    GROUP BY 
        s.id,
        s.supplier_name, 
        s.material_type
    HAVING 
        COUNT(po.id) >= 3 
        AND AVG(julianday(po.actual_receipt) - julianday(po.expected_receipt)) > 0
)
SELECT 
    supplier_name,
    material_type,
    purchase_count,
    total_purchase_value,
    avg_late_days,
    on_time_rate,
    RANK() OVER(ORDER BY avg_late_days DESC) AS late_rank,
    NTILE(4) OVER(ORDER BY avg_late_days DESC) AS risk_tier
FROM base_data
ORDER BY 
    avg_late_days DESC, 
    supplier_name ASC;
