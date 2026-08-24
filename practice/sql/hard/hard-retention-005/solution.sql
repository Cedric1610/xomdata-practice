-- Xom Data · Còn sống sót tính từ tháng thứ hai trở đi
-- Problem: https://xomdata.com/practice/hard-retention-005
-- Solved: 2026-08-24

WITH customer_orders AS (
    SELECT
        customer_id,
        MIN(order_date) AS first_order_date,
        MAX(order_date) AS last_order_date
    FROM orders
    GROUP BY customer_id
),
cte_table1 AS (
    SELECT
        strftime('%Y-%m', first_order_date) AS cohort_month,
        COUNT(customer_id) AS cohort_size
    FROM customer_orders
    GROUP BY cohort_month
),
cte_table2 AS (
    SELECT
        customer_id,
        strftime('%Y-%m', first_order_date) AS cohort_month,
        (
            CAST(strftime('%Y', last_order_date) AS INTEGER)
            -
            CAST(strftime('%Y', first_order_date) AS INTEGER)
        ) * 12
        +
        (
            CAST(strftime('%m', last_order_date) AS INTEGER)
            -
            CAST(strftime('%m', first_order_date) AS INTEGER)
        ) AS month_difference
    FROM customer_orders
),
cte_table3 AS (
    SELECT
        cohort_month,
        COUNT(customer_id) AS survivors
    FROM cte_table2
    WHERE month_difference >= 2
    GROUP BY cohort_month
)
SELECT
    c1.cohort_month,
    c1.cohort_size,
    COALESCE(c3.survivors, 0) AS survivors,
    ROUND(
        COALESCE(c3.survivors, 0) * 100.0
        / c1.cohort_size,
        2
    ) AS survival_pct
FROM cte_table1 AS c1
LEFT JOIN cte_table3 AS c3
    ON c1.cohort_month = c3.cohort_month
ORDER BY c1.cohort_month ASC;
