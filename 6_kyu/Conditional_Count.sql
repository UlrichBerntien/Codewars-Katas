SELECT * FROM
  (SELECT EXTRACT(MONTH FROM payment_date) AS month,
   COUNT(*) AS total_count,
   SUM(amount) AS total_amount
      FROM payment GROUP BY month) AS total_table
NATURAL JOIN
  (SELECT EXTRACT(MONTH FROM payment_date) AS month,
   COUNT(*) AS mike_count,
   SUM(amount) AS mike_amount
      FROM payment WHERE staff_id = 1 GROUP BY month) AS mike_table
NATURAL JOIN
  (SELECT EXTRACT(MONTH FROM payment_date) AS month,
   COUNT(*) AS jon_count,
   SUM(amount) AS jon_amount
      FROM payment WHERE staff_id = 2 GROUP BY month) AS jon_table
ORDER BY month;