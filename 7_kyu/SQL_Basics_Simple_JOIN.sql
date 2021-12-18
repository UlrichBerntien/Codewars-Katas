SELECT
  p.*,
  c.name AS company_name
FROM products AS p
INNER JOIN companies AS c ON c.id = p.company_id;