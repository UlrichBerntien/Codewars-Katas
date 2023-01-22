local solution = {}

-- Calculates 4 * sum of the first n+1 fibonacci numbers.
function solution.perimeter(n)
  assert( n >= 0, "argument must be a non negative number")
  local f0, f1, s = 1, 1, 1
  for i = 1,n do
    f0, f1, s = f1, f0+f1, s+f1
  end
  return 4 * s
end

return solution
