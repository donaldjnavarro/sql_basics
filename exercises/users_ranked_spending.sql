-- users_ranked_spending.sql
-- Purpose: Rank users by total spending.
-- Useful for QA: verifying leaderboard, top customers, etc.

SELECT 
    u.name,
    SUM(o.quantity * o.price) AS total_spent,
    RANK() OVER (ORDER BY SUM(o.quantity * o.price) DESC) AS rank
FROM users u
JOIN orders o 
    ON u.id = o.user_id
GROUP BY u.id, u.name;

/*
JOIN explanation:
- We still join orders to users by user_id = id.
- SUM() calculates total spent per user.
- RANK() OVER(...) is a window function:
    - It ranks users by total_spent in descending order.
    - Unlike GROUP BY, window functions do not collapse rows—they operate across the grouped result.
- This query lets QA see both totals and rankings in a single step.
*/
