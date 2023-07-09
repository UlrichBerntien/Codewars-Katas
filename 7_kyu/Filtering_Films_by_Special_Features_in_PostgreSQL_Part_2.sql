-- Selects film with special features are exact 'Trailers' and 'Deleted Scenes'.
-- The features are stored in the array special_features.
SELECT film_id, title, special_features
FROM film
WHERE special_features = ARRAY['Trailers','Deleted Scenes'] OR special_features = ARRAY['Deleted Scenes','Trailers']
ORDER BY title, film_id;
