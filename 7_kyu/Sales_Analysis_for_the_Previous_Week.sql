WITH

-- The previous week
previous AS
  (SELECT
      -- monday of the previous week
      DATE_TRUNC('week',CURRENT_DATE) - INTERVAL '7 days' AS monday,
      -- previous sunday
      DATE_TRUNC('week',CURRENT_DATE) - INTERVAL '1 days' AS sunday),

-- The sales in the previous week summarized per category ID.
previous_sales AS
  (SELECT
      category_id,
      COUNT(sale_id) AS total_products_sold,
      SUM(amount) AS total_sales_amount
  FROM previous
  JOIN sales ON sale_date BETWEEN previous.monday AND previous.sunday
  JOIN products USING(product_id)
  GROUP BY category_id)

-- The sales in the previous week with category name
SELECT
    category_name,
    total_products_sold,
    total_sales_amount
FROM previous_sales
JOIN categories USING (category_id)
ORDER BY
    total_products_sold DESC,
    total_sales_amount DESC,
    category_name ASC;
