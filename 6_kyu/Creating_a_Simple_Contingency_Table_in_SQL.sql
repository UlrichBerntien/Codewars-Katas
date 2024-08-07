-- Contingency table
-- shows the number of right-handed and left-handed individuals, broken down by sex.
SELECT
    COALESCE(sex,'Total') AS "Sex/Handedness",
    right_handed AS "Right-handed",
    left_handed AS "Left-handed",
    right_handed+left_handed AS "Total"
FROM
    (SELECT
        sex,
        -- customer order
        CASE WHEN sex = 'Male' THEN 1
             WHEN sex = 'Female' THEN 2
             ELSE 3 END AS rank,
        SUM((handedness ILIKE '%right%')::INT) AS right_handed,
        SUM((handedness ILIKE '%left%')::INT) AS left_handed
    FROM
        survey_data
    GROUP BY
      ROLLUP (sex)) AS sub
ORDER BY
  rank;
