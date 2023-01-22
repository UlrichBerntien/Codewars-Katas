local solution = {}

-- Returns next larger perfect square.
-- Returns -1 if sq is not an integer squarded,
--      else returns (sqrt(sq)+1)2
function solution.find_next_square(sq)
  local root = math.sqrt(sq)
  if math.fmod(root,1) ~= 0 then
    -- sq is not an integer squared
    return -1
  else
    -- next perfect square
    root = root + 1
    return root*root
  end
end

return solution
