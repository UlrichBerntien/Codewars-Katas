SELECT
    min(score) AS min,
    percentile_cont(0.5) WITHIN GROUP (ORDER BY score) AS median,
    max(score) AS max
FROM student
INNER JOIN result ON result.student_id = student.id;