-- Table of account transaction with date of last >100 transaction per account ID.
SELECT
  date,
  account_id,
  amount,
  MAX(CASE WHEN amount > 100 THEN date END)
      OVER (PARTITION BY account_id ORDER BY date ASC)
      AS last_over_hundred
FROM account_transactions
ORDER BY account_id DESC, date ASC;
