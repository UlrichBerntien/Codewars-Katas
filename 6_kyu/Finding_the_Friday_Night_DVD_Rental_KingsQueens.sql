-- Selects top Friday night customers.
-- Selects customers with the most rented films on Friday at 6:00 pm and later.
SELECT
  c.customer_id,
  c.first_name||' '||c.last_name AS customer_name,
  COUNT(*) AS friday_rentals,
  STRING_AGG(to_char(r.rental_date,'YYYY-MM-DD HH24:MI:SS'), ', ' ORDER BY r.rental_date DESC) AS rental_dates
FROM customer AS c
INNER JOIN rental AS r
        ON r.customer_id = c.customer_id
       AND EXTRACT(dow FROM r.rental_date) = 5
       AND EXTRACT(hour FROM r.rental_date) >= 18
GROUP BY (c.customer_id)
ORDER BY friday_rentals DESC, c.last_name ASC
LIMIT 50;
