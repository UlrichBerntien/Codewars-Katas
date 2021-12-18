SELECT
  sub.date AS date,
  sub.count as count,
  sum(sub.count) OVER (ORDER BY sub.date) AS total
FROM
  (SELECT 
    created_at::date AS date,
    count(*)::smallint AS count
  FROM posts
  GROUP BY date
  ORDER BY date) AS sub;