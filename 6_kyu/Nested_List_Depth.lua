local solution = {}

-- Returns depth of a nested table.
function solution.list_depth(lst)
  if type(lst) == "table" then
    local child_depth = 0
    for _,it in ipairs(lst) do
      child_depth = math.max(child_depth,solution.list_depth(it))
    end
    return 1 + child_depth
  else
    return 0
  end
end

return solution
