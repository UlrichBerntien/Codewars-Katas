SELECT film_id, title, special_features
FROM film
WHERE ( ('Deleted Scenes' = ANY(special_features)) <> ('Behind the Scenes' = ANY(special_features)) )
      AND 'Commentaries' <> ALL(special_features)
ORDER BY title ASC, film_id ASC;
