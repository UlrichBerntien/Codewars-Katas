local solution = {}


-- Checks Banker's Plan
--    f0 - deposit at begin
--    p  - Percentage interest rate per year on the deposit
--    c0 - withdraw at begin
--    i  - Percentage rate per year on the withdraw
--    n  - Number of years to cover with the initial deposit
-- Return:
--    True if the deposit if sufficient for all withdraws.
function solution.fortune(f0, p, c0, n, i)
  local f = f0 -- deposit
  local c = c0 -- withdraw per year
  local rate_f = 1+p/100 -- deposit factor per year
  local rate_c = 1+i/100 -- withdraw factor per year
  for y = 2,n do
    f = math.floor( rate_f*f - c )
    c = math.floor( rate_c*c )
    -- now f and c are the values end of year y
    if f < 0 then
      -- fast exit, deposit will never become positive again
      return false
    end
  end
  -- deposit was positive also end of year n
  return true
end

return solution