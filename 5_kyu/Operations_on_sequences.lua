local solution = {}

-- Solves product(a[i]²+a[i+1]²) = A² + B².
-- Returns table {A,B} with non-negative A and B.
function solution.solve(arr)
  if type(arr) ~= 'table' or #arr < 2 or #arr % 2 ~= 0 then
    -- invalid argument
    return 
  end
  local A, B = arr[1], arr[2]
  for i = 3,#arr,2 do
    -- Brahmagupta identity
    -- https://en.wikipedia.org/wiki/Brahmagupta%27s_identity
    A,B = math.abs(A*arr[i]+B*arr[i+1]), math.abs(A*arr[i+1]-B*arr[i])
  end
  return {A, B}
end

return solution
