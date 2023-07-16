-- Select students to expel.
--    selects students without courses
--    or with rating less than 60 in at least 3 courses
SELECT id AS student_id, name, reason FROM
  (SELECT
      s.id, s.name,
      'quit studying' AS reason
  FROM students AS s
  LEFT JOIN courses AS c ON s.id = c.student_id
  WHERE c.id IS NULL
UNION ALL
  SELECT
      s.id, s.name,
      'failed in ' || STRING_AGG(c.course_name||'('||c.score||')',', ' ORDER BY c.course_name) AS reason
  FROM students AS s
  INNER JOIN courses AS c ON s.id = c.student_id
  WHERE c.score < 60
  GROUP BY s.id
  HAVING COUNT(c.id) > 2) AS SUB
ORDER BY student_id;
