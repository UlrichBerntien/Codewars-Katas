SELECT DISTINCT
  cat.name AS category_name,
  fil.rating AS film_rating,
  ROUND(100.0*(COUNT(*) OVER (PARTITION BY cat.name, fil.rating))/(COUNT(*) OVER (PARTITION BY cat.name)),3) AS percentage
FROM film AS fil
INNER JOIN film_category AS fca USING (film_id)
INNER JOIN category AS cat USING (category_id)
ORDER BY category_name ASC, percentage DESC;
