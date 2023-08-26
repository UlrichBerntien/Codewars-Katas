-- Number of bisections by maximal n perpendicular lines on the plane.
SELECT
    n,
    ((n+1)::INT/2)*(n::INT/2) AS res
FROM perpendicular;
