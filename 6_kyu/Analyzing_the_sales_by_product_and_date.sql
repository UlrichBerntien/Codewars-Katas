WITH
  sales_total AS (
    SELECT product_id, date, sum(sales_details.count) AS count
    FROM sales
    JOIN sales_details ON sales.id = sales_details.sale_id
    GROUP BY product_id, date ),
  sales_per_day AS (    
    SELECT    
      products.id AS product_id,
      products.name AS product_name,
      date_part('year', sales_total.date)::int AS year,
      date_part('month', sales_total.date)::int AS month,
      date_part('day', sales_total.date)::int AS day,
      products.price * sales_total.count AS total
    FROM products
    JOIN sales_total ON sales_total.product_id = products.id ),
  sales_per_month AS (    
    SELECT
      product_id,
      product_name,
      year,
      month,
      NULL::int AS day,
      sum(total) AS total
    FROM sales_per_day
    GROUP BY product_id, product_name, year, month ),
  sales_per_year AS (
    SELECT
      product_id,
      product_name,
      year,
      NULL::int AS month,
      NULL::int AS day,
      sum(total) AS total
    FROM sales_per_month
    GROUP BY product_id, product_name, year ),
  sales_all AS (
    SELECT
      product_id,
      product_name,
      NULL::int AS year,
      NULL::int AS month,
      NULL::int AS day,
      sum(total) AS total
    FROM sales_per_year
    GROUP BY product_id, product_name )
SELECT
  product_name,
  year,
  month,
  day,
  total
FROM (SELECT * FROM sales_all
      UNION SELECT * FROM sales_per_year
      UNION SELECT * FROM sales_per_month
      UNION SELECT * FROM sales_per_day) AS dy
ORDER BY product_name, year, month, day
