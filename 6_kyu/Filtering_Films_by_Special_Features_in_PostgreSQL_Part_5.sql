-- Table of films with unique special feature combination.
-- ASSUMPTION: No feature is listed twice in the special_features array.
SELECT
    film_id,
    title,
    special_features
FROM film AS f1
WHERE NOT EXISTS
    (SELECT 1
     FROM film AS f2
     WHERE f2.film_id != f1.film_id
     AND cardinality(f2.special_features) = cardinality(f1.special_features)
     AND f2.special_features <@ f1.special_features)
ORDER BY title;
