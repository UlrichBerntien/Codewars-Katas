-- Selects all managers wit at least 2 employess older 60 years.
SELECT
  m.id,
  m.name,
  COUNT(s.id) AS older_subordinate_count
FROM employees AS m
INNER JOIN employees AS s ON (s.manager_id = m.id) AND s.birthdate <= CURRENT_DATE - INTERVAL '60 year'
GROUP BY m.id
HAVING COUNT(s.id) > 1
ORDER BY older_subordinate_count DESC, id DESC;
