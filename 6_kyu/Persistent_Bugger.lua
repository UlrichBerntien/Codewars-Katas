local solution = {}

-- Calculates multiplicative persistence of positive integer n.
function solution.persistence(n)
  local counter = 0
  while n > 9 do
    counter = counter + 1
    local x = n
    n = 1
    while x > 1 do
      n = n * (x % 10)
      x = x // 10
    end
  end
  return counter
end

return solution
