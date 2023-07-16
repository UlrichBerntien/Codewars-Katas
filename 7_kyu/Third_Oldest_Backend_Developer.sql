WITH

-- Look only at the backend team.
backenders AS (
  SELECT *
  FROM employees
  WHERE team = 'backend'
),

-- Select the oldest in the backend team with out window function and l1m1t function.
oldest AS (
    SELECT e1.employee_id
    FROM backenders AS e1
    LEFT JOIN backenders AS e2 ON e1.birth_date > e2.birth_date
    WHERE e2.birth_date IS NULL ),

-- Strip the oldest from the backend team.
backenders_minus_oldest AS (
    SELECT * FROM backenders WHERE employee_id <> (SELECT * FROM oldest) ),

-- Select the oldest in the striped backend team with out window function and l1m1t function.
second_oldest AS (
    SELECT e1.employee_id
    FROM backenders_minus_oldest AS e1
    LEFT JOIN backenders_minus_oldest AS e2 ON e1.birth_date > e2.birth_date
    WHERE e2.birth_date IS NULL ),

-- This is the backend team with out oldest and second old member.
backenders_minus_second AS (
    SELECT * FROM backenders_minus_oldest WHERE employee_id <> (SELECT * FROM second_oldest) )

-- Select the third old in the backend team.
SELECT e1.*
FROM backenders_minus_second AS e1
LEFT JOIN backenders_minus_second AS e2 ON e1.birth_date > e2.birth_date
WHERE e2.birth_date IS NULL;
