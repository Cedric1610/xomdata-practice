-- Xom Data · Portfolio profit/loss
-- Problem: https://xomdata.com/practice/medium-casewhen-047
-- Solved: 2026-07-23

WITH cte_table AS
(
SELECT stock_code, stock_quantity, avg_cost_price, current_price, ((current_price-avg_cost_price) * stock_quantity) AS profit_loss,
ROUND((((current_price-avg_cost_price) * stock_quantity) / (avg_cost_price * stock_quantity)* 100.00),2) AS profit_pct
FROM categories AS c 
JOIN stocks AS s 
    ON c.stock_id = s.id
)
SELECT *,
CASE
    WHEN profit_pct > 10 THEN 'Strong Gain'
    WHEN profit_pct > 0 AND profit_pct <= 10 THEN 'Mild Gain'
    WHEN profit_pct = 0 THEN 'Break Even'
    WHEN profit_pct >= -10 AND profit_pct < 0 THEN 'Mild Loss'
    ELSE 'Strong Loss'
END AS status,
RANK() OVER(ORDER BY profit_pct DESC) AS rank_by_pct,
SUM(stock_quantity * avg_cost_price) OVER(ORDER BY profit_pct DESC, stock_code ASC) AS cumulative_invested
FROM cte_table
ORDER BY rank_by_pct ASC, stock_code ASC;
