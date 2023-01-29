local solution = {}

-- Counts the number of unique elements in lst.
local function count_unique(lst)
  assert(type(lst) == "table", "argument must an array (table)")
  local set = {}
  local count = 0
  for _,x in ipairs(lst) do
    if not set[x] then
      set[x] = true
      count = count + 1
    end
  end
  return count
end

-- Calculates the count of subsets of lst.
-- An empty subset is not counted.
-- Elements in a subset must be unique.
function solution.est_subsets(lst)
  local n = count_unique(lst)
  -- empty subset is not allowed: "-1" here
  return 2^n - 1
end

return solution
