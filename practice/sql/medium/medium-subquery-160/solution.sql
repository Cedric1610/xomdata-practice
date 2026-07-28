-- Xom Data · Low-activity users
-- Problem: https://xomdata.com/practice/medium-subquery-160
-- Solved: 2026-07-28

WITH user_stats AS (
    SELECT
        u.id,
        u.user_name,
        COUNT(o.id) AS order_count,
        SUM(o.value) AS total_value,
        AVG(o.value) AS avg_order_value
    FROM users u
    LEFT JOIN orders o
        ON u.id = o.user_id
    GROUP BY u.id, u.user_name
),

user_tier AS (
    SELECT
        *,
        CASE
            WHEN order_count = 0 THEN 'Inactive'
            WHEN total_value < (
                SELECT AVG(total_value)
                FROM user_stats
                WHERE total_value IS NOT NULL
            ) THEN 'Low'
            ELSE 'Normal'
        END AS tier
    FROM user_stats
)

SELECT
    user_name,
    order_count,
    total_value,
    avg_order_value,
    tier,
    RANK() OVER (
        ORDER BY COALESCE(total_value, 0)
    ) AS activity_rank,
    ROUND(
        PERCENT_RANK() OVER (
            ORDER BY COALESCE(total_value, 0)
        ) * 100,
        2
    ) AS pct_above_peers
FROM user_tier
WHERE tier IN ('Inactive', 'Low')
ORDER BY activity_rank, user_name;
