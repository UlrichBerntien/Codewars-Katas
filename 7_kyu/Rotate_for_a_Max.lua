local solution = {}

-- Translates integer into array (table) of decimal digit.
-- Returns most significant digit at index 0.
local function int2digits(x)
  local n = math.tointeger(x)
  assert(n and n>0, "argument must be not-negative integer")
  if n<=0 then
    return {0}
  end
  local digits = {}
  while n > 0 do
    table.insert(digits,1,n%10)
    n = n // 10
  end
  return digits
end

-- Translates number in decimal digit array into number
local function digits2int(digits)
  local accu = 0
  for i = 1,#digits do
    accu = accu * 10 + digits[i]
  end
  return accu
end


-- Rotates digits to maximise number.
-- Rotates maximal one digit at each position.
-- Returns maximum after rotate operations.
function solution.maxRot(x)
  local digits = int2digits(x)
  local max = x
  for d = 2,#digits do
    table.insert(digits,digits[d-1])
    table.remove(digits,d-1)
    max = math.max(digits2int(digits),max)
  end
  return max
end

return solution
