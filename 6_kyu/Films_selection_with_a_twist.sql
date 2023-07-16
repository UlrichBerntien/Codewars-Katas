SELECT
  film_id, title, length
FROM film
WHERE length < (SELECT MIN(length) FROM film WHERE rating='R')
   OR length > (SELECT percentile_disc(0.5) within group (order by length) FROM film WHERE rating='PG-13')
ORDER BY length ASC, title ASC, film_id ASC;
