-- Table of sales and return quantity per product id and date.
-- NULL quantity indicates no return/sales of the product at the date.
SELECT
  product_id,
  s.quantity AS sale_qty,
  r.quantity AS return_qty,
  COALESCE(s.date,r.date) AS date
FROM table_sales AS s
FULL JOIN table_returns AS r USING (product_id, date)
ORDER BY product_id ASC, date ASC;
