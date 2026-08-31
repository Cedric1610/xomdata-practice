-- Xom Data · Thuê bao còn hiệu lực hay đã dừng
-- Problem: https://xomdata.com/practice/medium-churn-002
-- Solved: 2026-08-31

SELECT sub_id, customer_id,
    CASE
        WHEN end_date >= '2024-06-30' OR end_date IS NULL THEN 'active'
        ELSE 'stopped'
    END AS status
FROM subscriptions
