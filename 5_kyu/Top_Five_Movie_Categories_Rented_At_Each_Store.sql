-- Top 5 Categories rented at each store.
WITH
rentals_by_store_and_cat AS (
  SELECT
    store_id,
    category_id,
    COUNT(*) AS num_rentals
  FROM rental
  INNER JOIN inventory USING(inventory_id)
  INNER JOIN film_category USING(film_id)
  GROUP BY store_id, category_id
),
rentals_by_store_and_cat_ranked AS (
  SELECT
    store_id,
    name AS category,
    category_id,
    num_rentals,
    row_number() OVER (PARTITION BY store_id ORDER BY num_rentals DESC, name ASC) AS rk
  FROM rentals_by_store_and_cat
  INNER JOIN category USING (category_id)
)
SELECT
    store_id,
    category,
    num_rentals
FROM rentals_by_store_and_cat_ranked
WHERE rk < 6
ORDER BY store_id ASC, num_rentals DESC
