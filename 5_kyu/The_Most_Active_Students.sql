WITH

-- Table of all courses in the Michaelma 2022.
michaelma AS
    (SELECT *
     FROM courses
     WHERE course_date BETWEEN DATE '2022-10-01' AND '2022-12-31'),

-- Table of students activity.
students_activity AS
(SELECT
    student_id,
    COUNT(id) AS num_courses, -- number of courses
    MAX(score) AS highest_score, -- highest score in a course
        (SELECT course_name
         FROM michaelma
         WHERE student_id=c.student_id AND score = MAX(c.score)
         ORDER BY course_date DESC, course_name ASC
         LIMIT 1)
    AS highest_scored_course, -- name of course with highest score
    STRING_AGG(course_name||' ('||course_date||' - '||score||')',', ' ORDER BY course_date, course_name) AS course_list -- list of all courses
FROM michaelma AS c
GROUP BY student_id)

-- Table of top 20 active students.
SELECT
    student_id,
    name,
    num_courses,
    highest_scored_course||' ('||highest_score||')' AS highest_scored_course,
    course_list
FROM students_activity
JOIN students ON students.id = students_activity.student_id
ORDER BY
    num_courses DESC,
    highest_score DESC,
    student_id ASC
LIMIT 20;
