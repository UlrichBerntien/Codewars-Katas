local solution = {}

-- Calculates n-th Fibonacci number.
function solution.fibonacci(n)
  -- here a slow iterative implementation
  -- fast calculation see:
  -- https://www.nayuki.io/page/fast-fibonacci-algorithms
  local f0,f1 = 0, 1
  for i=1,n do
    f0,f1 = f1,f0+f1
  end
  return f0
end

return solution
