-- Table number of new customers per day.
WITH

-- Date of first purchase per customer.
customer_first AS
  (SELECT
    customer_id,
    MIN(date) AS first_date
  FROM customer_purchases
  GROUP BY customer_id)

SELECT
  first_date AS date,
  COUNT(customer_id) AS num_new_customers
FROM customer_first
GROUP BY first_date
ORDER BY date ASC;
