WITH
films_not_rented_last_but_10 AS (
  SELECT
    film_id,
    MAX(rental_date) AS last_rental_date,
    COUNT(rental_date) AS rental_count
  FROM rental
  INNER JOIN inventory USING(inventory_id)
  GROUP BY film_id
  HAVING MAX(rental_date) <= CURRENT_DATE - INTERVAL '1 month'
     AND COUNT(rental_date) >= 10
)
SELECT
  film_id,
  title || ' ('  || rating || ')' AS film_title,
  rental_count,
  to_char(last_rental_date,'FMMonth DD, YYYY') AS last_rental_date
FROM films_not_rented_last_but_10
INNER JOIN film USING(film_id)
ORDER BY rental_count DESC, last_rental_date DESC, film_title;
