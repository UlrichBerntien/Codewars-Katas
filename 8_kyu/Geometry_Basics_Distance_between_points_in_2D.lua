local solution = {}

-- Calculates euclidean distance between to points.
function solution.distance_between_points(a, b)
  local dx = a.x - b.x
  local dy = a.y - b.y
  return math.sqrt( dx*dx + dy*dy )
end

return solution
