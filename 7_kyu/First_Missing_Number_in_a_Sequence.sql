-- First missing number in a sequence of intergers.
SELECT d.num+1 AS missing_number
FROM data AS d
WHERE NOT EXISTS(SELECT 1 FROM data WHERE num = d.num+1)
ORDER BY num
LIMIT 1;