local solution = {}

-- Converts number into IPv4 address dot-decimal notation.
-- Argument is 32-Bit address.
-- Returns the IPv4 address in a string.
function solution.int32_to_ip(n)
  local n = tonumber(n)
  assert(0<=n and n<=2^33-1, "argument out of range")
  local accu = ""
  for i = 1,4 do
    if i > 1 then
      accu = "." .. accu
    end
    accu = n%256 .. accu
    n = n // 256
  end
  return accu
end

return solution
