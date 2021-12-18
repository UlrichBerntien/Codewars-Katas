WITH
    special_sales AS
    (SELECT DISTINCT department_id FROM sales WHERE price > 90)
SELECT
    d.id,
    d.name
FROM departments AS d
INNER JOIN special_sales AS s ON s.department_id = d.id;        