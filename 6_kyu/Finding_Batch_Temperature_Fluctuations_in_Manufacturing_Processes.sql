-- Calculate the temperature fluctuation per batch.
SELECT
  process_id,
  batch_id,
  -- Fluctuation is defined as the range of the values.
  MAX(value)-MIN(value) AS temperature_fluctuation
FROM
    (SELECT
        process_id,
        value,
        -- Batches are marked by 'Start' in each process.
        -- The ids give the time order.
        SUM((event='Start')::INT) OVER (PARTITION BY process_id ORDER BY id) AS batch_id
    FROM
        assembly_log
    WHERE
        event != 'Ignore') as batched
GROUP BY
    process_id, batch_id
ORDER BY
    process_id ASC, batch_id ASC;
