local solution = {}

-- Return arithmetic mean value
function mean(x)
  if not x or #x == 0 then
    return nil
  end
  local sum = 0
  for _,v in pairs(x) do
    sum = sum + v
  end
  return sum/#x
end

-- Set all items to the mean value.
function solution.redistribute_wealth(wealth)
  if wealth and #wealth > 0 then
    local mean = mean(wealth)
    for k,_ in pairs(wealth) do
      wealth[k] = mean
    end
  end
end

return solution