-- Rank the items in the list.
-- Largest value has rank 1. Same values has same rank.
-- Return: list with item[i] is rank of list[i].
local function ranks(list)
  -- Count the number for each value
  local map = {}
  for k,v in pairs(list) do
    if map[v] == nil then
      map[v] = 1
    else
      map[v] = map[v] + 1
    end
  end
  -- Sort the values
  local sorted = {}
  for k,_ in pairs(map) do
    sorted[#sorted+1] = k
  end
  table.sort(sorted, function(a,b) return a > b end )
  -- Create map value -> rank
  local rank = 1
  for _,v in pairs(sorted) do
    map[v], rank = rank, rank + map[v]
  end
  -- Create list of ranks for each item in the list
  local ranked = {}  
  for k,v in pairs(list) do
    ranked[k] = map[v]
  end
  return ranked
end

return ranks
