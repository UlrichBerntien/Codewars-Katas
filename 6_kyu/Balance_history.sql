-- Result table:
--    date = date of the balance ordered ascending
--    balance = sum of all amounts up to and including date of the row
SELECT
  DISTINCT ON (date)
  date(op.date) AS date,
  sum(amount) OVER (ORDER BY op.date ASC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS balance
FROM operations AS op
ORDER BY date ASC, op.date DESC
