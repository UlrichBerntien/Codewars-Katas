local solution = {}

-- π approximation by Leibniz formula for π
-- Argument
--    delta to π to terminate the sum
-- Return
--    {number of iterations, approximation for π}
function solution.iterPi(epsilon)
  -- https://en.wikipedia.org/wiki/Leibniz_formula_for_%CF%80
  local approx = 0
  local i = 1
  local v = 4
  while math.abs(math.pi-approx) > epsilon do
    approx = approx + v/i
    i = i + 2
    v = -v
  end
  return {i//2, approx}
end
  
return solution
