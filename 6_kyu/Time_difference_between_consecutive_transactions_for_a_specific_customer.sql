-- Time difference between consecutive transactions for a customers.
-- TAble for custemer IDs 1 and 2
SELECT
  rental_id,
  customer_id,
  rental_date::TEXT,
  rental_date - LAG(rental_date) OVER (PARTITION BY customer_id ORDER BY rental_date) AS time_since_previous_rental
FROM rental
WHERE customer_id BETWEEN 1 AND 2
ORDER BY customer_id, rental_date;
