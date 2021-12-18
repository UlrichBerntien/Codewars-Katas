WITH
partioned AS (
  SELECT
    categories.id AS category_id,
    categories.category,
    posts.title,
    posts.views,
    posts.id AS post_id,
    rank() OVER (PARTITION BY categories.category ORDER BY posts.views DESC, posts.id) AS pos
  FROM posts
  RIGHT JOIN categories ON categories.id = posts.category_id
)
SELECT
  category_id,
  category,
  title,
  views,
  post_id
FROM partioned
WHERE pos < 3
ORDER BY category, views DESC, post_id;