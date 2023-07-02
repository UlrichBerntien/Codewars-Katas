WITH action_films AS (
  SELECT film_id
  FROM film_category
  JOIN category USING(category_id)
  WHERE name = 'Action'
),

top_action_films AS (
SELECT
  film_id,
  to_char(rental_date, 'DY') AS dow,
  COUNT(*) AS rentals
FROM rental
JOIN inventory USING(inventory_id)
JOIN action_films USING(film_id)
GROUP BY film_id, dow
),

top_day_action_films AS (
SELECT DISTINCT ON (film_id)
  film_id,
  dow AS most_popular_day_of_week
FROM top_action_films
ORDER BY film_id, rentals DESC, dow
)

SELECT
  film_id,
  title AS film_title,
  most_popular_day_of_week
FROM top_day_action_films
JOIN film USING(film_id)
ORDER BY title, film_id, most_popular_day_of_week
