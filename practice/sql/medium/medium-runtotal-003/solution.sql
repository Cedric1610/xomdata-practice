-- Xom Data · Balance after each transaction
-- Problem: https://xomdata.com/practice/medium-runtotal-003
-- Solved: 2026-08-31

SELECT txn_date, amount,
    SUM(amount) OVER(ORDER BY txn_date ASC) AS balance
FROM transactions
ORDER BY txn_date ASC
