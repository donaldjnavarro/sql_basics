-- Users who spent more than average
SELECT u.name, SUM(o.quantity * o.price) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
HAVING total_spent > (
    SELECT AVG(quantity * price) FROM orders
);
