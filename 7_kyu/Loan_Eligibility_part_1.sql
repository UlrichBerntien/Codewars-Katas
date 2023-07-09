WITH open_loans AS (
  SELECT customer_id AS id
  FROM loans
  WHERE loan_status = 'unpaid'
  GROUP BY customer_id
)
SELECT
  id AS customer_id,
  CASE
    WHEN age BETWEEN 18 AND 65 AND id NOT IN (SELECT id FROM open_loans) THEN 'loan can be given'
    ELSE 'loan cannot be given' END
    AS loan_eligibility
FROM customers
WHERE id BETWEEN 1 AND 10
ORDER BY id DESC;
