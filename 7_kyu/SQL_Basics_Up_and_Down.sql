SELECT
  CASE
    WHEN sum(numbers.number1 & 1) & 1 = 0
    THEN max(numbers.number1)
    ELSE min(numbers.number1)
  END AS number1,
  CASE
    WHEN sum(numbers.number2 & 1) & 1 = 0
    THEN max(numbers.number2)
    ELSE min(numbers.number2)
  END AS number2
FROM
  numbers;