local solution = {}

function solution.billboard(name, price)
  price = price or 30
  local sum = 0
  for i = 1,#name do sum = sum + price end
  return sum
end

return solution