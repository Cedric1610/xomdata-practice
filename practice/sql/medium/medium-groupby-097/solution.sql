-- Xom Data · Top 10 most-engaged posts
-- Problem: https://xomdata.com/practice/medium-groupby-097
-- Solved: 2026-08-14

WITH cte_table AS (
    SELECT 
        u.full_name, 
        p.post_type, 
        p.post_date,
        SUM(p.like_count + p.comment_count + p.share_count) AS total_interactions
    FROM posts AS p
    JOIN users AS u 
        ON p.user_id = u.id
    GROUP BY p.id, u.full_name, p.post_type, p.post_date
)
SELECT 
    full_name,
    post_type,
    post_date,
    total_interactions,
    -- Hạng bị bỏ trống kế tiếp -> RANK()
    RANK() OVER(ORDER BY total_interactions DESC) AS overall_rank,
    
    -- Số thứ tự liên tục của mỗi tác giả -> ROW_NUMBER()
    ROW_NUMBER() OVER(
        PARTITION BY full_name 
        ORDER BY total_interactions DESC, post_date ASC
    ) AS rank_in_author,
    
    -- % Tương tác so với bài cao nhất toàn bảng
    ROUND(
        total_interactions * 100.0 / MAX(total_interactions) OVER(), 
        2
    ) AS pct_of_top
FROM cte_table
ORDER BY overall_rank ASC, full_name ASC, rank_in_author ASC
LIMIT 10;
