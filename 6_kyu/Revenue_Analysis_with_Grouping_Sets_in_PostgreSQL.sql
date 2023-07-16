-- Sum amount grouped by year, month and film category.
SELECT
  EXTRACT(YEAR FROM payment_date)::INT AS year,
  EXTRACT(MONTH FROM payment_date)::INT AS month,
  name AS category,
  FLOOR(SUM(amount))::INT AS revenue
FROM payment
INNER JOIN rental USING (rental_id)
INNER JOIN inventory USING (inventory_id)
INNER JOIN film_category USING (film_id)
INNER JOIN category USING (category_id)
WHERE payment_date BETWEEN '2007-01-01' AND '2007-12-31'
GROUP BY GROUPING SETS (
  (year, month, name),
  (year, month),
  (year)
)
ORDER BY YEAR DESC, MONTH ASC, revenue DESC, category ASC;
