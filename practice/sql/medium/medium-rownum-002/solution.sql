-- Xom Data · Intake sequence per warehouse
-- Problem: https://xomdata.com/practice/medium-rownum-002
-- Solved: 2026-09-13

SELECT warehouse, 
DENSE_RANK() OVER(PARTITION BY warehouse ORDER BY entry_date ASC, product ASC) AS entry_no,
        product,entry_date
FROM stock_entries
ORDER BY warehouse ASC, entry_no ASC
