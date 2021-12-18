CREATE OR REPLACE VIEW members_approved_for_voucher
AS
WITH
    top_departments AS (
    SELECT departments.id AS id
    FROM departments
        JOIN sales ON departments.id = sales.department_id
        JOIN products ON sales.product_id = products.id
    GROUP BY departments.id
    HAVING SUM(products.price) > 10000 )
 SELECT
    members.id AS id,
    members.name AS name,
    members.email AS email,
    SUM(products.price) AS total_spending
FROM members
    JOIN sales ON members.id = sales.member_id
    JOIN products ON sales.product_id = products.id
    JOIN top_departments ON sales.department_id = top_departments.id
    GROUP BY members.id
    HAVING SUM(products.price) > 1000
ORDER BY members.id;


SELECT * FROM members_approved_for_voucher;
