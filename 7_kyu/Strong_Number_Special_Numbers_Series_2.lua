-- Generate table[i] = factorial of i up to n.
local function generateFactorials(n)
  local fac = {[0]=0,[1]=1}
  for i = 2,n do
    fac[i] = i * fac[i-1]
  end
  return fac
end

-- Iterator of digits
local function splitNumber(n)
  return function()
    local digit = n % 10
    n = (n-digit) / 10
    if digit > 0 then return digit end
  end
end

-- Table of all neeed factorials
local fac = generateFactorials(9)

-- Check if a number is a strong number
local function isStrongNumber(n)
  local sum = 0
  for digit in splitNumber(n) do
    sum = sum + fac[digit]
  end
  return sum == n
end

-- The function returns the defined strings. 
return function(n)
  if n and isStrongNumber(n) then
    return "STRONG!!!!"
  else
    return "Not Strong !!"
  end
end
