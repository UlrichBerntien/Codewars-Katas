local solution = {}

-- Values of first/last character
-- Requires a character set like ASCII, all letters in a serie
local byte_A = string.byte("A")
local byte_Z = string.byte("Z")
local byte_a = string.byte("a")
local byte_z = string.byte("z")

-- Calculates the som value of a string.
-- Returns the sum of all letters ranks plus length of the string.
-- letter rank: a=1,A=1,b=2,B=2,...
local function som(name)
  assert(type(name) == "string", "argument must be a string")
  local accu = 0
  -- Sum "rank-1" of all letters in accu
  for i=1,#name do
    local c = name:sub(i,i):byte()
    if byte_A <= c and c <= byte_Z then
      accu = accu + c - byte_A
    elseif byte_a <= c and c <= byte_z then
      accu = accu + c - byte_a
    end
  end
  -- add #name to get the sum of letter rank and add #name to get the som
  return accu + 2 * #name
end

-- Splits a string, separator is comma.
local function split(str)
  assert(type(str)=="string", "argument must be a string")
  local accu = {}
  for s in str:gmatch("[^,]*") do
    table.insert(accu, s)
  end
  return accu
end

-- Less function between to objects with winning_number and name.
-- Sorted descending by winning_number.
-- Sorted ascending by name for same winning_number.
local function ranked_less(lhs, rhs)
  if lhs.winning_number > rhs.winning_number then
    return true
  elseif lhs.winning_number == rhs.winning_number and lhs.name < rhs.name then
    return true
  else
    return false
  end
end

-- Gets the name at index in the prize list.
function solution.rank(name_list, weights, index)
  assert( type(name_list) == "string", "argument #1 must be a strings")
  assert( type(weights) == "table", "argument #2 must be array of numbers")
  assert( tonumber(index), "argument #3 must be a number")
  assert( 1 <= index, "argument #3 must be an index")
  if #name_list == 0 then
    return "No participants"
  end
  if #weights < index then
    return "Not enough participants"
  end
  local names = split(name_list)
  assert(#names == #weights, "number names in the string must be equal to number of weights")
  local ranked = {}
  for i,name in ipairs(names) do
    table.insert(ranked, {name=name,winning_number=som(name)*weights[i]})
  end
  table.sort(ranked, ranked_less)
  return ranked[index].name
end

return solution
