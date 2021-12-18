matchup = {}

function matchup.solve(a,b)
  local counter = {}
  for i,x in ipairs(b) do
    counter[x] = 0
  end
  for i,x in ipairs(a) do
    if counter[x] then counter[x] = counter[x] + 1 end
  end
  local result = {}
  for i,x in ipairs(b) do
    result[i] = counter[x]
  end
  return result
end

return matchup