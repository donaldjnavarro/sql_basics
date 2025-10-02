-- Find duplicate names
SELECT name, COUNT(*) AS count_duplicates
FROM users
GROUP BY name
HAVING count_duplicates > 1;
