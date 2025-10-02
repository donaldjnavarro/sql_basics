-- List all orders with user names and emails
SELECT u.name, u.email, o.product, o.quantity, o.price, o.order_date
FROM orders o
JOIN users u ON u.id = o.user_id;
