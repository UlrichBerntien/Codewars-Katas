local solution = {}

-- Cache of Fibonacci numbers.
-- fibonacci_cache[i] is the i-th number.
solution.cache = {}

-- Expand the Fibonacci cache up to then n-th number.
function solution.fill_cache(n)
  -- start values if needed
  if #solution.cache < 3 then
    solution.cache = {1,1,2,3,5}
  end
  -- fast iterative summation
  local i = #solution.cache
  local s2 = solution.cache[i-1]
  local s1 = solution.cache[i]
  for i = #solution.cache+1,n do
    s2, s1 = s1, s1 + s2
    table.insert(solution.cache, s1)
  end
end

-- Returns the n-th Fibonacci number.
function solution.fibonacci(n)
  if n < 1 then
    return 0
  end
  if n > #solution.cache then
    solution.fill_cache(n)
  end
  return solution.cache[n]
end

return solution
