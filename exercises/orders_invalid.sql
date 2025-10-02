-- Purpose: QA check to detect orders referencing users that do not exist
SELECT *
FROM orders o
LEFT JOIN users u ON o.user_id = u.id
WHERE u.id IS NULL;
