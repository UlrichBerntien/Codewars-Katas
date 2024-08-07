-- Cοunt without CΟUNT function.
SELECT
    failure_reason,
    -- SUM(1) as replacement for CΟUNT(*)
    SUM(1) AS cnt 
FROM
    -- Distinct table as replacement for CΟUNT(DISTINCT candidate_name)
    (SELECT DISTINCT failure_reason, candidate_name FROM interview_failures) AS uq
GROUP BY
    failure_reason
ORDER BY
    cnt DESC,
    failure_reason ASC;
