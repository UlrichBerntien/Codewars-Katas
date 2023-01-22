local solution = {}

-- Returns the greatest common divisor.
-- Arguments must be positive numbers.
local function gcd(a,b)
  assert(a >= 0, "argument #1 is not positive")
  assert(b >= 0, "argument #2 is not positive")
  -- https://en.wikipedia.org/wiki/Euclidean_algorithm
  while b > 0 do
    a, b = b, a % b
  end
  return a
end

-- Returns the least common multiple.
-- Arguments must be positive numbers.
local function lcm(a, b) 
  assert(a >= 0, "argument #1 is not positive")
  assert(b >= 0, "argument #2 is not positive")
  return (a*b)/gcd(a,b)
end

-- Returns greatest common devisor of abs(a) and abs(b).
function solution.gcdi(a,b)
  assert(tonumber(a), "argument #1 is not a number")
  assert(tonumber(b), "argument #2 is not a number")
  return gcd(math.abs(a),math.abs(b))
end

-- Returns least common multiple of abs(a) and abs(b).
function solution.lcmu(a, b) 
  assert(tonumber(a), "argument #1 is not a number")
  assert(tonumber(b), "argument #2 is not a number")
  return lcm(math.abs(a),math.abs(b))
end

-- Returns sum of a and b.
function solution.som(a, b) 
  assert(tonumber(a), "argument #1 is not a number")
  assert(tonumber(b), "argument #2 is not a number")
  return a+b
end

-- Returns maximum of a and b.
solution.maxi = math.max

-- Returns minimum of a and b
solution.mini = math.min

-- Reduce function
-- Arguments:
--    fct - function of two numbers return a number
--    arr - Calls fct on this array, a table of numbers
--    init - Initial value
-- Returns:
--    Array x[i] = fct(arr[i],x[i-1]) with x[0] = init
function solution.operArray(fct, arr, init)
  assert(type(fct) == "function", "argument #1 is not a number")
  assert(type(arr) == "table", "argument #2 is not a table")
  assert(tonumber(init), "argument #3 is not a number")
  local accu = {}
  local a = tonumber(init)
  for _,x in ipairs(arr) do
    a = fct(x,a)
    table.insert(accu,a)
  end
  return accu
end

return solution
