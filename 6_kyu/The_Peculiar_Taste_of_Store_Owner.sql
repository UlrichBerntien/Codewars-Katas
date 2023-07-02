-- Creates a table with all actors whose first names begin with 'J'
--    inserts the most recent film title into the table
--    and sorts by actor_id
SELECT
DISTINCT ON (actor_id)
  actor_id,
  first_name || ' ' || last_name AS full_name,
  FIRST_VALUE(title) OVER (PARTITION BY actor_id ORDER BY film_id DESC) AS film_title
FROM actor
INNER JOIN film_actor AS fa USING(actor_id)
INNER JOIN film AS f USING(film_id)
WHERE first_name LIKE 'J%'
ORDER BY actor_id ASC;
