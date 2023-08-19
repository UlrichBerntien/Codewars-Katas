WITH

-- The maximal mark_rates for each subject.
max_rates AS
    (SELECT
        subject_id,
        MAX(mark_rate) AS mark_rate
    FROM marks
    GROUP BY subject_id)

-- Students at top in every subject
SELECT
    student_id,
    student_name
FROM
    (-- Students at least top in one subject
    SELECT DISTINCT student_id
    FROM max_rates
    JOIN marks AS top ON top.subject_id = max_rates.subject_id AND top.mark_rate = max_rates.mark_rate
    EXCEPT
    -- Students not top in at least one subject
    SELECT DISTINCT student_id
    FROM max_rates
    -- Mark the lower rated students
    JOIN marks AS lower ON lower.subject_id = max_rates.subject_id AND lower.mark_rate < max_rates.mark_rate)
    AS all_top
JOIN students USING (student_id)
ORDER BY student_id DESC;
