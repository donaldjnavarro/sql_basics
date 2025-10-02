-- above_average_spender.sql
-- Purpose: Find users who spent more than the average order amount.
-- Useful for QA: identifying outliers.

SELECT 
    u.name,
    SUM(o.quantity * o.price) AS total_spent
FROM users u
JOIN orders o 
    ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING SUM(o.quantity * o.price) > (
    SELECT AVG(quantity * price) FROM orders
);

/*
JOIN explanation:
- Similar to total_spent_per_user.sql: each order is linked to a user.
- GROUP BY aggregates per user.
- HAVING applies a condition **after aggregation**, unlike WHERE.
- The subquery calculates the average spending per order across all orders.
- Users whose total spending exceeds this average are returned.
*/
