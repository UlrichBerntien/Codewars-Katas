SELECT
  cat.id AS category_id,
  cat.category,
  pt.title,
  pt.views,
  pt.id AS post_id
FROM categories AS cat
LEFT JOIN LATERAL (
  SELECT * FROM posts WHERE cat.id = category_id
  ORDER BY views DESC, id ASC LIMIT 2
) AS pt ON true
ORDER BY cat.category ASC, pt.views DESC, pt.id ASC;
