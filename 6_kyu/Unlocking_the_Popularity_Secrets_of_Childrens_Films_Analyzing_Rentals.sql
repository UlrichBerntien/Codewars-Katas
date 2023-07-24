-- Generates table of children's films populary.
-- Popularity is measured by number of customers rent the film.

WITH

rental_count_table AS
  (SELECT
    film_id,
    COUNT(DISTINCT customer_id) AS rental_count
  FROM film_category
  INNER JOIN inventory USING(film_id)
  INNER JOIN rental USING(inventory_id)
  WHERE category_id IN (SELECT category_id FROM category WHERE name='Children')
  GROUP BY film_id)

SELECT
  film_id,
  title ||
    CASE WHEN rental_count <= 5 THEN ' is not popular'
         WHEN rental_count <= 15 THEN ' is slightly popular'
         WHEN rental_count <= 30 THEN ' is moderately popular'
         ELSE ' is very popular' END
      AS popularity,
  rental_count
FROM rental_count_table
INNER JOIN film USING(film_id)
ORDER BY rental_count DESC, title ASC;
