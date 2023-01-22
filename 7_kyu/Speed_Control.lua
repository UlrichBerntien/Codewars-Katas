local solution = {}

-- Calculates maximal speed.
-- Arguments
--    s = time between two positions in seconds
--    xs = array of travelled distance at time 0s,1s,2s,...
-- Returns
--    maximal speed reached in one measured interval [distance unit/hour]
--    Speed rounded down to an integer value.
function solution.gps(s, xs)
  assert( s > 0, "argument #1 must be positive time" )
  assert( type(xs) == "table", "argument #2 must be array of positions")
  local maxspeed = 0
  -- 3600 seconds = 1 hour
  local div = s/3600
  for i = 2,#xs do
    maxspeed = math.max(maxspeed, (xs[i]-xs[i-1])//div )
  end
  return maxspeed
end

return solution
