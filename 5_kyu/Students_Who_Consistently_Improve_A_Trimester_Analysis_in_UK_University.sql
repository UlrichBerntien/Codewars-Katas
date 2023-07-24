-- Selects students who continuously improve.
-- Their average score of all courses per trimester must increase.
WITH

trimester_scores AS
(SELECT
  student_id,
  AVG(score) AS avg_score,
  EXTRACT('QUARTER' from course_date) AS trimester
     -- 1st quarter = Lent
     -- 2nd quarter = Summer
     -- 4th quarter = Michaelmas
FROM courses
GROUP BY student_id, trimester)

SELECT
  s.id AS student_id,
  s.name,
  'Michaelmas ('||ROUND(mic.avg_score,2)||'), Lent ('||ROUND(len.avg_score,2)||'), Summer ('||ROUND(sum.avg_score,2)||')' AS trimesters_avg_scores,
  mic.avg_score < len.avg_score AND len.avg_score < sum.avg_score AS consistent_improvement
FROM students AS s
JOIN trimester_scores AS mic ON mic.student_id = s.id AND mic.trimester = 4
JOIN trimester_scores AS len ON len.student_id = s.id AND len.trimester = 1
JOIN trimester_scores AS sum ON sum.student_id = s.id AND sum.trimester = 2
ORDER BY student_id DESC;
