-- Rank students by performance in Math and Science.
SELECT
  RANK() OVER (ORDER BY SUM(c.score) DESC, s.id ASC) AS rank,
  s.id AS student_id,
  s.name,
  SUM(c.score) AS total_score
FROM courses AS c
INNER JOIN students AS s ON s.id = c.student_id
WHERE c.course_name IN ('Math','Science')
GROUP BY s.id
ORDER BY rank ASC;
