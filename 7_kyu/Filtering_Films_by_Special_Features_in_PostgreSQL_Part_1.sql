-- Selects film with 'Trailers' and 'Deleted Scenes'.
-- The features are stores in the array special_features.
SELECT
  film_id, title, special_features
FROM film
WHERE 'Trailers' = ANY(special_features) AND 'Deleted Scenes' = ANY(special_features)
ORDER BY title ASC, film_id ASC;
