local solution = {}

-- Calculates time B needs to catch A.
-- Arguments
--    v1 - speed [feet/hour] of A
--    v2 - speed [feet/hour] of B
--    g - lead [feet] of A
-- Returns
--    time for B catchs A in format (h, m, s)
--    returns {-1,-1,-1} if B is not faster than A
function solution.race(v1, v2, g)
  v1 = tonumber(v1)
  v2 = tonumber(v2)
  g = tonumber(g)
  assert(v1 and v1>=0,"argument #1 must be a non-negative number")
  assert(v2 and v2>=0,"argument #2 must be a non-negative number")
  assert(g and g>=0,"argument #3 must be a non-negative number")
  if v2 <= v1 then
    -- B can not catch A
    return {-1,-1,-1}
  end
  local t = 3600*g//(v2-v1)
  local s = t % 60
  t = t // 60
  local m = t % 60
  h = t // 60
  return {h,m,s}
end

return solution
