local solution = {}

-- Finds maximal und minimal number,
-- Argument and result are decimal numbers in a string.
-- Limitation: Decimal numbers must be in integer range.
function solution.high_and_low(numberstrings)
  local max = nil
  local min = nil
  for s in numberstrings:gmatch("%g+") do
    local v = tonumber(s)
    max = math.max(max or v,v)
    min = math.min(min or v,v)
  end
  return max .. " " .. min
end

return solution
