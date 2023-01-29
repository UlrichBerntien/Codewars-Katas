local solution = {}

-- Reaction time in s
local Tr = 1
-- Gravity acceleration in m/s²
local g = 9.81
-- Factor m/s -> km/h
local kmh = 3.6

-- Calculates total stopping distance.
-- Arguments
--    v - current speed in km/h
--    mu - coefficent of friction
-- Return
--    distance in meter to stop the car
function solution.dist(v, mu)
  assert(v>=0, "speed must be not negative")
  assert(0<mu and mu<=1, "friction must be in range >0 and <=1")
  local vms = v/kmh
  return vms^2/(2*mu*g) + vms*Tr
end

-- Calculates maximal possible speed to stop in distance d.
-- Arguments
--    d - distance in meter to stop the car
--    mu - coefficent of friction
-- Return
--    maximal speed in km/h
function solution.speed(d, mu)
  assert(d>=0, "distance must be not negative")
  assert(0<mu and mu<=1, "friction must be in range >0 and <=1")
  local mgt = mu*g*Tr
  local v = math.sqrt(2*mu*g*d + mgt^2) - mgt
  return v*kmh
end

return solution
