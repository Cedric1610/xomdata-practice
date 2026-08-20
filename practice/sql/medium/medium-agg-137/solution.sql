-- Xom Data · Investor trade summary
-- Problem: https://xomdata.com/practice/medium-agg-137
-- Solved: 2026-08-20

WITH base_data AS
(
SELECT full_name, segment, COUNT(side) AS total_trades,
SUM(
  CASE
    WHEN side = 'buy' THEN amount
    ELSE 0
  END) AS total_bought,
SUM(
  CASE
    WHEN side = 'sell' THEN amount
    ELSE 0
  END) AS total_sold  
FROM investors AS i
RIGHT JOIN trades AS t
  ON i.id = t.investor_id
GROUP BY full_name, segment
)
SELECT *,
(total_bought - total_sold) AS net_position,
CASE
  WHEN (total_bought - total_sold) > 0 THEN 'Bull'
  WHEN (total_bought - total_sold) = 0 THEN 'Neutral'
ELSE 'Bear'
END AS stance,
DENSE_RANK() OVER(PARTITION BY segment ORDER BY (total_bought + total_sold) DESC) AS rank_in_segment
FROM base_data
ORDER BY (total_bought + total_sold) DESC, full_name ASC
