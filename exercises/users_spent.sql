-- total_spent_per_user.sql
-- Purpose: Calculate total spending for each user.
-- Useful for QA: checking totals, aggregations, or detecting anomalies.

SELECT 
    u.name, 
    SUM(o.quantity * o.price) AS total_spent  -- multiply quantity by price for each order
FROM users u
JOIN orders o 
    ON u.id = o.user_id  -- link orders to their user
GROUP BY u.id, u.name   -- aggregate all orders per user
ORDER BY total_spent DESC;  -- highest spenders first

/*
JOIN explanation:
- We want the spending per user.
- Each row in 'orders' is matched to its corresponding user in 'users' by id.
- SUM() aggregates all the matched orders for each user.
- GROUP BY tells SQL to calculate SUM() separately for each user.
*/
