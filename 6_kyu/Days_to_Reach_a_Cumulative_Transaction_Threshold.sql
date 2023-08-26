WITH

-- Summed amounts.
summed AS
    (SELECT
        id,
        SUM(amount) OVER (ORDER BY id) AS sum_amount
    FROM transactions),

-- Last row to include, the first row above 15.
last AS
    (SELECT MIN(id) AS id
    FROM summed
    WHERE sum_amount >= 15)

-- Transaction until summed amount is at least 15.
SELECT
    id,
    date,
    amount,
    CASE
        WHEN id = (SELECT id FROM last)
        THEN date - (SELECT MIN(date) FROM transactions) END
        AS days_to_reach_threshold
FROM transactions
WHERE id <= (SELECT id FROM last)
ORDER BY id;
