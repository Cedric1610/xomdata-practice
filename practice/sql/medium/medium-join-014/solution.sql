-- Xom Data · Stock-in history by supplier
-- Problem: https://xomdata.com/practice/medium-join-014
-- Solved: 2026-08-16

WITH base_data AS
(
SELECT warehouse_name, COUNT(DISTINCT s.id) AS import_count,
COUNT(DISTINCT product_id) AS distinct_product_count,
COUNT(DISTINCT suppliers) AS distinct_supplier_count,
MAX(import_date) AS last_import_date
FROM stock_imports AS s
JOIN warehouses AS w
    ON s.warehouse_id = w.id
JOIN products AS p 
    ON s.product_id = p.id
GROUP BY warehouse_name
)
SELECT *,
DENSE_RANK() OVER(ORDER BY import_count DESC) AS activity_rank,
LAG(warehouse_name,1) OVER (ORDER BY import_count DESC) AS prev_warehouse
FROM base_data
ORDER BY activity_rank ASC, warehouse_name ASC
