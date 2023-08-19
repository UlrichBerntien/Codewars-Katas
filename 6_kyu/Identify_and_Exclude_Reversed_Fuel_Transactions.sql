WITH

transaction_pairs AS
  -- All pairs of reverse and normal fuel transactions.
  -- If fuel quantity and type do not result in a unique pair,
  -- then pair the transactions with closest timestamp.
  -- (It is not guaranteed that transaction IDs and timestamps are in the same order).
  (SELECT DISTINCT
        r.transaction_id AS rev_id,
        FIRST_VALUE(n.transaction_id) OVER
            (PARTITION BY r.transaction_id
            ORDER BY r.transaction_datetime - n.transaction_datetime)
            AS norm_id
    FROM fuel_transactions AS r
    JOIN fuel_transactions AS n
        ON n.is_reversal = 'N'
        AND n.transaction_datetime < r.transaction_datetime
        AND n.quantity = -r.quantity
        AND n.fuel_type = r.fuel_type
    WHERE r.is_reversal = 'Y')

-- The fuel transactions without the reversed ones.
SELECT
    transaction_id,
    transaction_datetime::TEXT,
    quantity,
    fuel_type,
    is_reversal
FROM fuel_transactions
WHERE transaction_id NOT IN (SELECT rev_id FROM transaction_pairs)
      AND transaction_id NOT IN (SELECT norm_id FROM transaction_pairs)
ORDER BY transaction_datetime ASC;
