-- Generate table of all students with more points in scince than in math.
--    student_ID = ID of the student
--    score_difference = score science - score math.
SELECT
  s.id AS student_id,
  s.name,
  science.score - math.score AS score_difference
FROM students AS s
INNER JOIN
  courses AS math ON math.student_id = s.id AND math.course_name = 'Math'
INNER JOIN
  courses AS science ON science.student_id = s.id AND science.course_name = 'Science'
WHERE math.score < science.score
ORDER BY score_difference DESC, student_id ASC
