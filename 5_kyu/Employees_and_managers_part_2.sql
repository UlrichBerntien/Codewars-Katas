WITH

RECURSIVE employee_with_managers AS
-- Table of manager and super managers.
-- Limit to 100 levels to break cycles.
(
    SELECT
        id AS employee_id,
        manager_id,
        100 AS level
     FROM employees
  UNION
    SELECT
        em.employee_id,
        ee.manager_id,
        em.level-1 AS level
    FROM employee_with_managers AS em
    JOIN employees AS ee ON ee.id = em.manager_id AND ee.manager_id IS NOT NULL
    WHERE em.level > 0
)

-- Table of all employees with management chain above.
SELECT
    em.employee_id AS id,
    (SELECT name FROM employees WHERE id=em.employee_id LIMIT 1) AS name,
    STRING_AGG(
        CASE WHEN em.manager_id IS NULL THEN ''
        ELSE
            FORMAT('%s (%s)',
                  (SELECT name FROM employees WHERE id=em.manager_id LIMIT 1),
                  em.manager_id)
        END,
        ' -> ' ORDER BY em.level)
    AS management_chain
FROM employee_with_managers AS em
GROUP BY em.employee_id
ORDER BY em.employee_id;
