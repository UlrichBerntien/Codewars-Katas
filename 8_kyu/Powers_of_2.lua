local solution = {}

-- Returns table of powers of 2: 2^0, 2^1 .. 2^n
function solution.powers_of_two(n)
  local result = {}
  local x = 1
  for i = 0,n do
    table.insert(result,x)
    x = x * 2
  end
  return result
end

return solution