-- Cummulative sum with defined operations.
--  operation add    -> add the amount
--  operation remove -> subtract the amount
--  other operation  -> no change of cumsum
SELECT
    *,
    SUM(
        CASE
          WHEN operation = 'add' THEN amount
          WHEN operation = 'remove' THEN -amount
          ELSE 0
        END
    ) OVER (ORDER BY date, id) AS flexible_sum
FROM transactions
ORDER BY date, id;
