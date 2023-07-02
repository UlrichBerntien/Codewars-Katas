SELECT
  n,
  CASE WHEN n>0 THEN ceil(sqrt(2.0*n+0.25)+0.5)::Integer ELSE 0 END AS res
FROM participants;
