-- Summed transaction durations.
SELECT
    atm_id,
    -- time format is hh.mm
    (total_min/60)::TEXT||'.'||lpad((total_min%60)::TEXT,2,'0') AS total_duration_hours
FROM
    (SELECT
        atm_id,
        SUM(substring(transaction_duration, '^\d+')::INT*60 +
            substring(transaction_duration, '\d+$')::INT) AS total_min
    FROM
        atm_transactions
    GROUP BY
        atm_id) AS sub
ORDER BY
    total_min DESC,
    atm_id DESC;
