local solution = {}

-- Returns true if the number is narcissistic, false otherwise.
-- https://en.wikipedia.org/wiki/Narcissistic_number
function solution.narcissistic(value)
  -- split value into decimal digits
  local digits = {}
  local remain = value
  while remain > 0 do
    table.insert(digits, remain % 10)
    remain = remain // 10
  end
  local n = #digits
  -- Calculate delta between value and sum of digits^n
  local delta = value
  for _,d in ipairs(digits) do
    delta = delta - d^n
    -- fast exit if delta goes below 0
    if delta < 0 then return false end
  end
  return delta == 0
end

return solution
