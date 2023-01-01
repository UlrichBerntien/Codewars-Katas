local solution = {}

-- Checks if n is a square of an integer.
function solution.issquare(n)
  return math.sqrt(n) % 1 == 0
end

return solution
