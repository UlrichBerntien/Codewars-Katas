SELECT id, name
    FROM departments
    WHERE EXISTS
        (SELECT *
         FROM sales
         WHERE sales.price > 98 AND departments.id = sales.department_id );