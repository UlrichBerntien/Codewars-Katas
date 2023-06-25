-- Generates table
--    flower1 = number of petals at flower 1
--    flower2 = number of petals at flower 2
--    res = True iff one number of petals is odd and one number is even.
SELECT
  flower1,
  flower2,
  flower1 % 2 != flower2 % 2 AS res
FROM love;
