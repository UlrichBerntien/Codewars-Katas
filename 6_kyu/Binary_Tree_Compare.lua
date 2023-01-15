local solution = {}

-- Compares two trees a and b.
-- Returns true if all values in both subtrees are equal.
function solution.compare(a, b)
  if a == b then
    -- a and b are identical tables -> a and b are equal
    -- a and b are both nil is part of this case
    return true
  end
  if type(a)~="table" or type(b)~="table" then
    -- One or both are not tree nodes -> a and b are not equal
    return false
  end
  if a.val ~= b.val then
    -- Values of a and b are not equal -> a and b are not equal
    return false
  end
  -- Now: node a and b are equal
  --      if both subtrees are equal, then the trees a and b are equal
  return solution.compare(a.left,b.left) and solution.compare(a.right,b.right)
end

return solution
