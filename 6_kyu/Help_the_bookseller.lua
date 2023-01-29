local solution = {}

-- Summary of the articles per group.
-- Arguments
--    artList - Array of articles, each article a string "code qty".
--              First char or the code is the article group ID.
--    firstLetters - Array of groups, each group a one-letter string, the group ID
-- Return
--    A string in the format "(ID : qty) - (ID: qty) ...".
--    A list of group IDs and total quantities.function solution.stockSummary(artList, firstLetters)
function solution.stockSummary(artList, firstLetters)
  -- check arguments
  assert(type(artList)=="table", "argument #1 must be array of articles")
  assert(type(firstLetters)=="table", "argument #2 must be array of group IDs")
  if #artList == 0 or #firstLetters == 0 then
    return ""
  end
  -- prepare a map Id letter to sum
  local sum = {}
  for _,id in ipairs(firstLetters) do
    sum[id] = 0
  end
  -- calculates the sums
  for _,art in ipairs(artList) do
    local id = art:sub(1,1)
    if sum[id] then
      local _,_,n = art:match("(.+)( +)(%d*)")
      sum[id] = sum[id] + n
    end
  end
  -- format the return string
  local result = {}
  for i,id in ipairs(firstLetters) do
    result[i] = string.format("(%s : %d)", id, sum[id])
  end
  return table.concat(result," - ")
end

return solution
