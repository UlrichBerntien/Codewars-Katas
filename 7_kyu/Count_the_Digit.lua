local solution = {}

-- Counts digit d in the decimal number x
local function countDigit(x,d)
  if x == 0 and d == 0 then
    return 1
  end
  local count = 0
  while x > 0 do
    if x % 10 == d then
      count = count + 1
    end
    x = x // 10
  end
  return count
end

-- Counts the digit d in the decimal number 0,1²,2²,..,n².
function solution.nbDig(n, d)
  assert(tonumber(n),"argument #1 must be a number")
  assert(0<=d and d<=9, "argument #2 must be a number in range 0-9")
  local count = 0
  for i = 0,n do
    count = count + countDigit(i*i,d)
  end
  return count
end
  
return solution
