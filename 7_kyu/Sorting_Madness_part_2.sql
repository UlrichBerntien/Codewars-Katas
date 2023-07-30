WITH

-- Generate for all products:
--    smallest order_id of the product
--    flag to indicate if product_id duplicates exist.
dupliate_info AS 
  (SELECT
    product_id,
    MIN(order_id) AS min_order_id,
    COUNT(order_id) = 1 AS no_duplicate
  FROM orders
  GROUP BY product_id)

-- Orders sorted by order_id, but
--    table starts with products with duplicates
--    product duplicates are sorted directly after the first product
SELECT
  o.order_id,
  o.product_id
FROM orders AS o
JOIN dupliate_info AS dup USING(product_id)
ORDER BY dup.no_duplicate, dup.min_order_id, o.order_id;
