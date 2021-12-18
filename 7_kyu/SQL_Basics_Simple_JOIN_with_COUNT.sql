SELECT
  p.id,
  p.name,
  count(p.id) AS toy_count
FROM people AS p
INNER JOIN toys AS t ON t.people_id = p.id
GROUP BY p.id;