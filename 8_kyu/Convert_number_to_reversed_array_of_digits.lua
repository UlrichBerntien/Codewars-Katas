-- Converts number n into the decimal digits.
-- Returns the digits in an array, least significant digit at index 1.
function digitize(n)
  if n == 0 then
    return {0}
  end
  local digits = {}
  while n > 0 do
    table.insert(digits, n % 10)
    n = n // 10
  end
  return digits
end

return digitize
