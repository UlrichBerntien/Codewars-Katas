-- Selects top performing students
-- Students with score above course average in at least 3 courses.
WITH

courses_summary AS
(SELECT
  course_name,
  AVG(score) AS score
FROM courses
GROUP BY course_name)

SELECT
  s.id AS student_id,
  s.name AS name,
  STRING_AGG(c.course_name||' ('|| ROUND(100.*(c.score-a.score)/a.score,2) ||'%)',
             ', ' ORDER BY c.course_name ASC) AS outperformance
FROM students AS s
JOIN courses AS c ON c.student_id = s.id
JOIN courses_summary AS a ON c.course_name = a.course_name AND a.score < c.score
GROUP BY s.id
HAVING COUNT(*) >= 3
ORDER BY s.id ASC;
