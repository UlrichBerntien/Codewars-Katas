local NamedOne = {}

NamedOne.__call = NamedOne

-- Trim string, removes spaces around the text.
-- Returns empty string if str is no string.
local function trim(str)
  if type(str) == "string" then
    return str:match("^%s*(.-)%s*$")
  else
    return ""
  end
end

-- Returns new object with first name and last name.
function NamedOne:new(first, last)
  local obj = setmetatable({},NamedOne)
  -- handle invalid or nil arguments by empty string
  first = trim(first)
  last = trim(last)
  -- stores first and last name in private table
  rawset(obj, "private", {first=first, last=last})
  return obj
end

-- Returns name in different formats.
--    firstName -> the first name
--    lastName -> the last name
--    fullName -> "firstName lastName" combination
function NamedOne:__index(index)
  local private = rawget(self, "private")
  if index == "firstName" then
    return private.first
  elseif index == "lastName" then
    return private.last
  elseif index == "fullName" then
    -- returns full name,
    -- or one name part if the other part is missing, or empty string if name is missing
    return trim(private.first .. " " .. private.last)
  else
    -- fallback to standard behaviour
    return rawget(self, index)
  end
end

-- Sets full name or parts of the name
--    firstName -> changes only the first name
--    lastName -> changes only the last name
--    fullName -> value must be informat "first last",
--                sets first and last name, does nothing on invalid format
function NamedOne:__newindex(index, value)
  local private = rawget(self, "private")
  if index == "firstName" then
    -- relace invalid or nil argument by empty string
    private.first = trim(value)
  elseif index == "lastName" then
    -- relace invalid or nil argument by empty string
    private.last = trim(value)
  elseif index == "fullName" then
    local first, last = value:match("(%S+)%s+(%S+)")
    if first and last then
      private.first = first
      private.last = last
    end
  else
    -- fallback to standard behaviour
    rawset(self, index, value)
  end
end

return NamedOne
