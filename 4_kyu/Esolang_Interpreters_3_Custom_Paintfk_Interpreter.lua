-- Translate Painfuck program into Lua code.
-- Arguments:
--    code - Painfuck program code
--    iterations - maximal number of iterations to execute
--    width - width of the 2D bit data grid
--    height - height of the 2D bit data grid
-- Return:
--    Lua program source code.
local function paintfuck2lua(painfuckCode, iterations, width, height)
  local code = ""
  -- init 2D data grid
  code = code .. string.format( [[ local D = {}
    for i = 1,%d do
      table.insert(D,{})
      for j = 1,%d do
        table.insert(D[i],false)
      end
    end
  ]], height, width )
  -- current cell and remaining iteration count
  code = code .. "local r,c = 1,1\n"
  code = code .. string.format("local i = %d\n",iterations)
  -- the code
  stepCount = "if i==0 then return D else i=i-1 end\n"
  for c in painfuckCode:gmatch('.') do
    if c == "n" then
      -- Move data pointer north (up)
      code = code .. stepCount
      code = code .. string.format("if r==1 then r=%d else r=r-1 end\n",height);
    elseif c == "e" then
      -- Move data pointer east (right)
      code = code .. stepCount
      code = code .. string.format("if c==%d then c=1 else c=c+1 end\n",width);
    elseif c == "s" then
      -- Move data pointer south (down)
      code = code .. stepCount
      code = code .. string.format("if r==%d then r=1 else r=r+1 end\n",height);
    elseif c == "w" then
      -- Move data pointer west (left)
      code = code .. stepCount
      code = code .. string.format("if c==1 then c=%d else c=c-1 end\n",width);
    elseif c == "*" then
      -- Flip the bit at the current cell
      code = code .. stepCount
      code = code .. "D[r][c]=not D[r][c]\n"
    elseif c == "[" then
      -- Jump past matching ] if bit under current pointer is 0
      code = code .. stepCount
      code = code .. "while D[r][c]==true do\n"
    elseif c == "]" then
      -- Jump back to the matching [ (if bit under current pointer is nonzero) 
      code = code .. stepCount
      code = code .. "end\n"
    end
    -- else: ignore all other characters
  end
  -- return 2D data grid
  code = code .. "return D\n\n"
  return code
end

  
-- Translates 2D boolean grid into string.
-- Argument:
--    grid - 2D boolean grid (1. index row, 2. index column)
-- Return:
--    String "row\r\nrow\r\n...row" with 1 or 1 in each cell in the row.
local function grid2string(grid)
  local result = ""
  for _,row in ipairs(grid) do
    for _,cell in ipairs(row) do
      if cell == true then
        result = result .. "1"
      else
        result = result .. "0"
      end
    end
    result = result .. "\r\n"
  end
  -- remove the last \r\n
  return result:sub(1,#result-2)
end

  
-- Painfuck Interpreter via Lua Interpreter
-- Arguments:
--    code - Painfuck program code
--    iterations - maximal number of iterations to execute
--    width - width of the 2D bit data grid
--    height - height of the 2D bit data grid
-- Return:
--    2D data grid in a string.
function interpreter(code, iterations, width, height)
  local source = paintfuck2lua(code, iterations, width, height)
  local code = load(source)
  local result = code()
  return grid2string(result)
end

return interpreter
