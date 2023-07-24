-- Generates list of all single supplier transactions.
-- Ouput is "Several" if more than one supplier is in a transaction.

WITH

-- Collect the suppliers per transaction ID.
-- Only one row per transaction ID - supplier pair.
transaction_supplier_map AS
(SELECT DISTINCT
  transaction_id,
  supplier
FROM transaction_content)

SELECT
  transaction_id,
  date,
  CASE
    WHEN COUNT(supplier) > 1 THEN 'Several'
    ELSE MIN(supplier)
  END AS supplier
FROM transaction
INNER JOIN transaction_supplier_map USING (transaction_id)
GROUP BY transaction_id
ORDER BY transaction_id ASC;
