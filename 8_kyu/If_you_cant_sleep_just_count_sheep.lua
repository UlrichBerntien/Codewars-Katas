local solution = {}

-- Produces a string with n sheeps.
function solution.count_sheep(n)
  local accu = ""
  for i = 1,n do
    accu = string.format("%s%d sheep...",accu,i)
  end
  return accu
end

return solution