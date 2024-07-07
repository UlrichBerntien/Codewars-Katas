-- Uncovering ABC Kata Solutions' Most Extravagant Departmental Expenses
SELECT
  department_name,
  total_questionable_expenses
FROM
    (SELECT
      department_id,
      SUM(amount)::money AS total_questionable_expenses
    FROM
      expenses
    WHERE
      (description ~* 'confetti|glitter|golden toilet|massage chair|video game|karaoke')
      OR
      (EXTRACT(DAY FROM date) = 1 AND EXTRACT(MONTH FROM date) = 4)
      OR
      (EXTRACT(DAY FROM date) = 21 AND EXTRACT(MONTH FROM date) = 5)
    GROUP BY
      department_id
    ) AS questionable_expenses
LEFT JOIN
  departments USING (department_id)
ORDER BY
  total_questionable_expenses DESC,
  department_name DESC
LIMIT 5;
