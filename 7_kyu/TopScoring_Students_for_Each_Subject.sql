WITH

-- Top score (mark rate) per subject.
max_rates AS
    (SELECT
        subject_id,
        MAX(mark_rate) AS mark_rate
    FROM marks
    GROUP BY subject_id),

-- All students reached the top score per subject.
top_students AS
    (SELECT
        subject_id,
        ARRAY_AGG(student_name ORDER BY student_id) AS student_names
    FROM max_rates
    JOIN marks USING(mark_rate, subject_id)
    JOIN students USING(student_id)
    GROUP BY subject_id)

-- Top scoring students for each subject, named output
SELECT
    student_names,
    subject_name,
    mark_rate
FROM top_students
JOIN subjects USING(subject_id)
JOIN max_rates USING(subject_id)
ORDER BY subject_id;
