-- Select id ans name of user shopping all products.
WITH all_shoppers AS (
  SELECT
    user_id AS id
  FROM orders
  GROUP BY user_id
  HAVING COUNT(DISTINCT product_id) = (SELECT COUNT(id) FROM products)
)
SELECT
  id AS user_id,
  name
FROM users
RIGHT JOIN all_shoppers AS a USING(id)
ORDER BY user_id DESC;
