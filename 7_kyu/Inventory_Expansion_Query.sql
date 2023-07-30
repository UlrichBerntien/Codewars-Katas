-- Select expanded table.
-- Each product row is "quantity_in_stock"-times in the table.
SELECT
  product_id,
  product_name,
  quantity_in_stock
FROM
( SELECT
    product_id,
    product_name,
    quantity_in_stock,
    generate_series(1,quantity_in_stock,1) AS sub_id
  FROM products ) AS sub
ORDER BY product_id DESC;
