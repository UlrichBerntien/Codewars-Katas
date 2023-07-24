-- Counts the rentals for each day between 2005-MAY-24 and 2005-June-2.
SELECT
  to_char(date,'YYYY-MM-DD') AS date,
  (SELECT COUNT(*) FROM rental WHERE rental_date BETWEEN date AND (date + '23:59:59')) AS rentals
FROM generate_series(TIMESTAMP '2005-MAY-24','2005-June-2','1 DAY') as date
ORDER BY date;
