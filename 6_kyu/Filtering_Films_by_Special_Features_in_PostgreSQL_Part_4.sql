WITH

-- The top special feature.
-- This is the most frequent special feature in all films.
top AS
    (SELECT
        UNNEST(special_features) AS special_feature
    FROM film
    GROUP BY special_feature
    ORDER BY COUNT(*) DESC
    LIMIT 1)

-- All films with the top special feature.
SELECT
    film_id,
    title,
    special_features
FROM film
WHERE special_features @> ARRAY[(SELECT special_feature FROM top)]
ORDER BY title, film_id;
