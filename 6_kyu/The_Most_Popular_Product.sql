-- Selects the most popular products.
-- Most popular are products with maximal order count.
WITH
  orders_counted AS (
    SELECT product_id, COUNT(*)
    FROM orders
    GROUP BY product_id
  )
SELECT
  product_id,
  product_name,
  count AS count_orders
FROM orders_counted AS o
LEFT JOIN products AS p ON p.id = o.product_id
WHERE count = (SELECT max(count) FROM orders_counted)
ORDER BY product_id DESC;
