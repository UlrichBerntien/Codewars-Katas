kata = {}

-- Checks the end or string s.
-- Returns true if s has the ending.
-- Returns true if no ending is given.
function kata.strEndsWith(s, ending)
  if ending == nil or #ending == 0 then
    return true
  end
  return s:sub(-#ending) == ending
end

return kata