local solution = {}

-- Checks if n is divisble by all following arguments.
function solution.isDivisible(n, ...)
  local args = {...}
  for _,d in ipairs(args) do
    if n % d ~= 0 then
      return false
    end
  end
  return true
end

return solution
