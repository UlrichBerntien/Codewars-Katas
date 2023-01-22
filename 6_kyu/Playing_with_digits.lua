-- Returns array with decimal digits of x.
-- Index 1 = lowest significant digit
local function digits(x)
  local d = {}
  while x > 0 do
    table.insert(d, x % 10)
    x = x // 10
  end
  return d
end

return {
  dig_pow = function(n,pow)
    local d = digits(n)
    local sum = 0
    for i = 1,#d do
      sum = sum + d[i] ^ (#d+pow-i)
    end
    local div = sum / n
    if div % 1 == 0 then
      return div
    else
      return -1
    end
  end
  }
