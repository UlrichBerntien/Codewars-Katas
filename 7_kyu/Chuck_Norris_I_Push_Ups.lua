local solution = {}

-- Scana strings for binary numbers, return maximal value.
-- Ignores all non 0,1 characters in the input string.
-- Returns funny messages on no string or 0 value.
function solution.chuck_push_ups(st)
  if type(st) ~= "string" then
    return "FAIL!!"
  end
  local accu = 0
  for number in st:gsub("[^01%s]+",""):gmatch("%g+") do
    accu = math.max(accu, tonumber(number,2))
  end
  if accu == 0 then
    return "CHUCK SMASH!!"
  end
  return accu
end

return solution
