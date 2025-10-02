-- Rank users by total spending
SELECT u.name,
       SUM(o.quantity * o.price) AS total_spent,
       RANK() OVER (ORDER BY SUM(o.quantity * o.price) DESC) AS rank
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name;
