-- Xom Data · Delivery performance by size class
-- Problem: https://xomdata.com/practice/medium-case-160
-- Solved: 2026-07-25

WITH cte_table AS
(
SELECT vehicle_type, capacity_tons, COUNT(s.truck_id) AS shipment_count,
CASE
    WHEN capacity_tons >= 10 THEN 'Large Truck'
    WHEN capacity_tons >= 5 AND capacity_tons < 10 THEN 'Medium Truck'
    ELSE 'Small Truck'
END AS size_class,
SUM(
    CASE
        WHEN results = 'success' THEN 1
        ELSE 0
        END)
AS delivered,
ROUND(SUM(
    CASE
        WHEN results = 'success' THEN 1
        ELSE 0
        END) * 100.00
/ COUNT(s.truck_id),2) AS delivery_rate
FROM trucks AS t 
JOIN shipments AS s 
    ON t.id = s.truck_id
JOIN deliveries AS d 
    ON s.id = d.shipment_id
GROUP BY vehicle_type
)
SELECT *,
RANK() OVER(PARTITION BY size_class ORDER BY delivery_rate DESC) AS rank_in_size
FROM cte_table
ORDER BY size_class ASC, rank_in_size ASC, vehicle_type ASC
