local solution = {}

function solution.crusoe(n, d, ang, distmult, angmult)
  -- Angle ang is given in degree but needed in rad for calculation:
  ang = math.rad(ang)
  -- current position cartesian coordinates
  local x, y
  x = 0.0
  y = 0.0
  for i = 1,n do
    -- step length d and angle ang to X axis
    x = x + d * math.cos(ang)
    y = y + d * math.sin(ang)
    -- next angle and distance
    ang = ang * angmult
    d = d * distmult
  end
  return {x, y}
end
  
return solution