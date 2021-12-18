kata = {}

-- Function returns the max and the sum of all digirs.
-- The argument n must be an integer
function maxAndSumDigits(n)
  if n < 0 then n = -1 end
  local max, sum = 0, 0
  while n > 0 do
    digit = n % 10
    n = (n-digit) // 10
    if digit > max then max = digit end
    sum = sum + digit
  end
  return max, sum
end

function kata.numbers(n)
  local value
  if n % 2 == 0 then
    value = math.ceil( math.pi * (n//3) ^ 3 )
  else
    value = math.floor( math.exp(2) * ((n+1)//2) ^ 2 )
  end
  local max, sum = maxAndSumDigits(value)
  return max .. ' ' .. sum
end

return kata