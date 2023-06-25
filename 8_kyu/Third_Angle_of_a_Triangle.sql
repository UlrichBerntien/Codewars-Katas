-- Generates table
--    a,b = the given two angles [degree] of the triangle
--    res = the calculated third angle [degree] of the triangle
SELECT
  a,
  b,
  180-a-b AS res
FROM otherangle;
