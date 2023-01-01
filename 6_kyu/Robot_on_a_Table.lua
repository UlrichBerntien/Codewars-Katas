local solution = {}

-- Calculates optimal start position of the robot on the table.
-- Arguments:
--   table_y, table_x - number of cells in y, x direction.
--   s - Path of the robot, string with UDRL
-- Return:
--    y,x - Start position (1,1 is the left upper corner)
--    Minimal values to stay as long as possible on the board.
function solution.robot(table_y, table_x, s)
  -- handle invalid parameters
  if table_y < 1 or table_x < 1 or type(s) ~= 'string' then
    return
  end
  -- also allow lower case direction letters
  s = s:upper()
  -- Run on a unlimited board ...,-1,0,1,...
  local x,y = 0,0
  local min_x, max_x, min_y, max_y = 0,0,0,0
  for i = 0,#s do
    local step = s:sub(i,i)
    if step == 'U' then -- direction UP
      y = y - 1
      if max_y-y == table_y then
        -- y size of the board reached
        break
      end
      if y < min_y then
        min_y = y
      end
    elseif step == 'D' then -- direction DOWN
      y = y + 1
      if y-min_y == table_y then
        break
      end
      if y > max_y then
        max_y = y
      end
    elseif step == 'R' then -- direction RIGHT
      x = x + 1
      if x-min_x == table_x then
        break
      end
      if x > max_x then
        max_x = x
      end
    elseif step == 'L' then -- direction LEFT
      x = x - 1
      if max_x-x == table_x then
        break
      end
      if x < min_x then
        min_x = x
      end
    end
    -- ignore invalid letters
  end
  -- Calculate the start position for a board 1..table_x, 1..table_y
  return 1-min_y, 1-min_x
end

return solution
