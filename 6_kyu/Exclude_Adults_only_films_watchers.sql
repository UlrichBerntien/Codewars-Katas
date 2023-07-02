-- Generates table of top 5 customers
--    top customers are customers with maximal total rental count
--    customers rented 'NC-17' rated films are excluded
--    full_name = first and last name of the customer
SELECT
  c.customer_id,
  c.first_name || ' ' || c.last_name AS full_name,
  COUNT(*) AS total_rentals
FROM rental AS r
JOIN customer AS c USING (customer_id)
JOIN inventory AS i USING (inventory_id)
JOIN film as f USING (film_id)
GROUP BY c.customer_id
HAVING bool_and(f.rating != 'NC-17')
ORDER BY total_rentals DESC, c.last_name ASC
LIMIT 5;
