local solution = {}

function solution.bonus(arr, s)
  local sum = 0
  for _,v in ipairs(arr) do
    sum = sum + 1/v
  end
  local k = s/sum
  local result = {}
  for i,v in ipairs(arr) do
    result[i] = math.floor(k/v+0.5)
  end
  return result
end
  
return solution
