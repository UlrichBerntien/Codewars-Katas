local solution = {}

-- Returns "odd" if the sum of the numbers in arr is odd, else returns "even".
function solution.odd_or_even(arr)
  local sum = 0
  for _,x in ipairs(arr) do
    sum = ( sum ~ x ) & 1
  end
  if sum ~= 0 then
    return "odd"
  else
    return "even"
  end
end

return solution