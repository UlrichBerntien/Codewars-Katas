SELECT*,RANK()OVER(w ORDER BY-points),COALESCE(LAG(points)OVER w-points,0)AS next_behind,MAX(points)OVER w-points AS total_behind,points-AVG(points)OVER w AS diff_from_avg
FROM results
WINDOW w AS(PARTITION BY competition_id)ORDER BY 1,4