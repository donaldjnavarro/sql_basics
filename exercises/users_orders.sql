-- orders_with_users.sql
-- Purpose: Show all orders along with the corresponding user info.
-- Useful for QA: verifying that each order is linked to a valid user.

SELECT 
    u.name,        -- user's name
    u.email,       -- user's email
    o.product,     -- product name from the order
    o.quantity,    -- quantity ordered
    o.price,       -- price per item
    o.order_date   -- when the order was placed
FROM orders o
-- JOIN connects rows from two tables based on a related column
JOIN users u 
    ON u.id = o.user_id;  -- only include orders where user_id exists in users

/*
Explanation of the JOIN:
- 'orders' is the left table, 'users' is the right table.
- The ON clause specifies the relationship: orders.user_id = users.id
- This is an INNER JOIN by default in SQLite, so:
    - Only rows that have a matching user are included.
    - Any orders with invalid user_id (no matching users.id) are excluded.
*/
