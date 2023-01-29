local codewars = {}


-- Create new empty board of size x size.
local function newBoard(size)
  assert(size>0, "board size must at least 1")
  local board = {}
  for y = 1,size do
    local row = {}
    for x = 1,size do
      row[x] = 0
    end
    board[y] = row
  end
  return board
end


-- Returns start position on the board.
local function startPosition()
  return {x=1,y=1}
end

-- Returns next position right.
-- Does not check board limits!
local function stepRight(position)
  return {x=position.x+1, y=position.y}
end

-- Returns next position left.
-- Does not check board limits!
local function stepLeft(position)
  return {x=position.x-1, y=position.y}
end

-- Returns next position down.
-- Does not check board limits!
local function stepDown(position)
  return {x=position.x, y=position.y+1}
end

-- Returns next position up.
-- Does not check board limits!
local function stepUp(position)
  return {x=position.x, y=position.y-1}
end


-- Returns the start direction, go to right.
local function startDirection()
  return stepRight
end


-- Retuns the next directio to go.
local function nextDirection(direction)
  if direction == stepRight then
    return stepDown
  elseif direction == stepDown then
    return stepLeft
  elseif direction == stepLeft then
    return stepUp
  elseif direction == stepUp then
    return stepRight
  end
  assert(false,"invalid direction function")
end


-- Checks if the position is free on the board.
-- Returns true if position is on the board and the cell is free (is 0).
local function free(board,position)
  if position.x < 1 or position.y < 1 then
    return false
  elseif position.x > #board or position.y > #board then
    return false
  end
  return board[position.y][position.x] == 0
end


-- Checks if the position is not filled.
-- Returns true if the position is NOT on the baord or the cell is not filled (is 0).
local function notFilled(board,position)
  if position.x < 1 or position.y < 1 then
    return true
  elseif position.x > #board or position.y > #board then
    return true
  end
  return board[position.y][position.x] == 0
end


-- Sets cell at position on the board to filled (1).
local function set(board,position)
  board[position.y][position.x] = 1
end


-- Returns a board with a spiral of size x size.
function codewars.spiralize(size)
  local board = newBoard(size)
  local position = startPosition()
  local step = startDirection()
  local steps = 0
  while true do
    set(board,position)
    if free(board,step(position)) and notFilled(board,step(step(position))) then
      position = step(position)
      steps = steps + 1
    else
      if steps < 2 then break end
      step = nextDirection(step)
      steps = 0
    end
  end
  return board
end

return codewars
