-- Table of useres which created 5 or more bad katas.
SELECT
    user_id,
    COUNT(*) AS bad_kata_count
FROM kata_authors
NATURAL JOIN
    (-- Table of bad katas.
    -- A kata is bad if average of vote is below 0.7.
    -- Katas with less than 3 votes are excluded.
    SELECT kata_id
    FROM kata_votes
    GROUP BY kata_id
    HAVING COUNT(*) >= 3 AND AVG(vote) < 0.7) AS bad_katas
GROUP BY user_id
HAVING COUNT(*) >= 5
ORDER BY
    bad_kata_count DESC,
    user_id DESC;
