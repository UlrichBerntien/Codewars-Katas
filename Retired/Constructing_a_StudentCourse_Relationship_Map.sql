-- Cross table of all students and all courses.
-- Table includes only all active students and active courses.
-- Field is_exists = 1 if student is enrolled in course, else is_exists = 0.
SELECT
    stu.name AS student,
    cou.name AS course,
    (enr.course_id IS NOT NULL)::INT AS is_exists
FROM
    (SELECT DISTINCT ON(student_id)
        student_id,
        name||' ('||student_id||')' AS name
    FROM students
    JOIN enrollments USING (student_id)) AS stu
CROSS JOIN
    (SELECT DISTINCT ON(course_id)
        course_id,
        course_name||' ('||course_id||')' AS name
    FROM courses
    JOIN enrollments USING (course_id)) AS cou
LEFT JOIN
    enrollments AS enr USING(student_id, course_id)
ORDER BY student_id, course_id;
