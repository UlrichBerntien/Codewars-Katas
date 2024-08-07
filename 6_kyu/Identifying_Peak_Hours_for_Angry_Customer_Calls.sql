-- Selects the peak hours with angry customers detected.
SELECT
    EXTRACT(HOUR FROM timestamp) AS call_hour,
    COUNT(*) AS angry_call_count
FROM
    calls
INNER JOIN
    transcriptions USING(call_id)
WHERE
    status = 'transferred_to_rep'
    AND content ~* '(\mf-word\M.*){3}'
GROUP BY
    EXTRACT(HOUR FROM timestamp)
ORDER BY
    angry_call_count DESC,
    call_hour ASC;
