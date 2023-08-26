WITH

-- Flop films are films that
--    not in inventory,
--    or not in rental,
--    or less then 7 times rented
flop_films AS
    (SELECT DISTINCT film_id
    FROM film
    LEFT JOIN inventory USING(film_id)
    LEFT JOIN rental USING(inventory_id)
    GROUP BY film_id
    HAVING COUNT(rental_id) < 7),

-- Successful film stars.
--    Stars in at least 20 films,
--    and never star in a flop film.
top_stars AS
    (SELECT
        actor_id,
        COUNT(DISTINCT film_id) AS film_count
    FROM film_actor
    LEFT JOIN flop_films AS flop USING(film_id)
    JOIN actor USING (actor_id)
    GROUP BY actor_id
    HAVING COUNT(DISTINCT film_id) >= 20 AND COUNT(flop.film_id) = 0)

-- Successful film stars with full names.
SELECT
    actor_id,
    first_name || ' ' || last_name AS full_name,
    film_count
FROM top_stars
JOIN actor USING (actor_id)
ORDER BY film_count DESC, actor_id;
