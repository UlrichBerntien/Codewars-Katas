SELECT title
FROM film
WHERE film_id IN (
  SELECT film_id FROM film_actor WHERE actor_id = 105
  INTERSECT
  SELECT film_id FROM film_actor WHERE actor_id = 122 );
  