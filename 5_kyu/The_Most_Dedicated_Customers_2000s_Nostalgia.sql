WITH

-- Set of user with a film that was not returned.
-- 2005-08-01 used as current date.
user_with_expired_film AS
    (SELECT DISTINCT customer_id
    FROM rental
    JOIN inventory USING (inventory_id)
    JOIN film USING (film_id)
    WHERE return_date IS NULL AND rental_date::DATE + rental_duration < DATE '2005-08-01'),

-- List of customers with at least 10 films rented
--    only rentals in the range 2005-04-01 and 2005-07-31 are counted
--    users with a not returned film are excluded
top_customers AS
    (SELECT
        customer_id,
        COUNT(rental_id) AS num_rentals,
        STRING_AGG(title||': '||rental_date::DATE, ' || ' ORDER BY rental_date::DATE DESC, title) AS films_rented
    FROM rental
    JOIN inventory USING(inventory_id)
    JOIN film USING(film_id)
    WHERE rental_date::DATE BETWEEN DATE '2005-04-01' AND DATE '2005-07-31'
          AND customer_id NOT IN (SELECT customer_id FROM user_with_expired_film)
    GROUP BY customer_id
    HAVING COUNT(rental_id) >= 10)

-- List of customers with at least 10 films rented
--    with full names of the customers
SELECT
    customer_id,
    first_name||' '||last_name AS customer_name,
    num_rentals,
    films_rented
FROM top_customers
JOIN customer USING(customer_id)
ORDER BY num_rentals DESC, last_name;
