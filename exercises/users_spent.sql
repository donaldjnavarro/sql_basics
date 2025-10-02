-- Total amount spent per user
SELECT u.name, SUM(o.quantity * o.price) AS total_spent
FROM users u
JOIN orders o ON u.id = o.user_id
GROUP BY u.id, u.name
ORDER BY total_spent DESC;
