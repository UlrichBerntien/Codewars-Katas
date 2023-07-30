-- Counts the number of orders per product.
-- Calculates the ratio (percentage) of orders per product.
SELECT
  product_id,
  COUNT(order_id) AS count,
  ROUND(COUNT(order_id)*100./(SELECT COUNT(order_id) FROM orders),2) AS ratio
FROM orders
GROUP BY product_id
ORDER BY product_id ASC;
