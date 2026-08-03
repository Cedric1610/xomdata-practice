-- Xom Data · Top 10 highest-profit dishes
-- Problem: https://xomdata.com/practice/medium-agg-147
-- Solved: 2026-08-03

WITH cte_table AS
(
SELECT dish_name, category_name, SUM(quantity) AS total_sold, 
SUM(quantity * unit_price) AS revenue,
(SUM((quantity * unit_price)) - SUM(cost_price * quantity)) AS profit,
ROUND(COALESCE((SUM((quantity * unit_price)) - SUM(cost_price * quantity)) * 100.0/ SUM(quantity * unit_price),0),2) AS margin_pct
FROM dishes AS d 
JOIN categories AS c 
    ON d.category_id = c.id
JOIN order_items AS oi
    ON d.id = oi.dish_id
JOIN orders as o
    ON oi.order_id = o.id
GROUP BY dish_name, category_name
HAVING status = 'Completed'
)
SELECT *,
RANK() OVER(ORDER BY profit DESC) AS rank_by_profit,
RANK() OVER(ORDER BY margin_pct DESC) AS rank_by_margin
FROM cte_table
ORDER BY rank_by_profit ASC, dish_name ASC
LIMIT 10
