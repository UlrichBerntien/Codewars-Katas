local solution = {}

-- Calculates list of partial sums.
function solution.partsSums(ls)
  local sum = 0
  local sums = {}
  sums[#ls+1] = 0
  for i = #ls,1,-1 do
    sum = sum + ls[i]
    sums[i] = sum
  end
  return sums
end

return solution
