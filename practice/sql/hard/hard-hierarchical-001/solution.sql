-- Xom Data · Total sales by org branch
-- Problem: https://xomdata.com/practice/hard-hierarchical-001
-- Solved: 2026-08-19

WITH RECURSIVE Hierarchy AS (
    SELECT 
        id AS ancestor_id, 
        direct_sales AS sales
    FROM agents
    UNION ALL
    SELECT 
        a.manager_id AS ancestor_id, 
        h.sales
    FROM Hierarchy h
    JOIN agents a ON h.ancestor_id = a.id
    WHERE a.manager_id IS NOT NULL
)
SELECT 
    a.id AS agent_id,
    a.name AS agent_name,
    a.direct_sales,
    SUM(h.sales) AS team_total
FROM agents a
JOIN Hierarchy h ON a.id = h.ancestor_id
GROUP BY 
    a.id, 
    a.name, 
    a.direct_sales
ORDER BY 
    team_total DESC, 
    agent_id ASC;
