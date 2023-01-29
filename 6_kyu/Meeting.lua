local solution = {}

-- Reformat list of names in strings.
-- Argument
--    List of names in a string with format "F1:L1;F2:L2;..".
-- Returns
--    List of names in a string with format "(LA, FA)(LA, FA).."
-- The returned names are sorted by lastname.
-- The returned names are all in upper case format.
function solution.meeting(s)
  assert(type(s)=="string", "argument must be a string")
  -- collect names in uppercase in an array
  local names = {}
  for firstname,lastname in s:upper():gmatch("([^:;]*):([^:;]*)") do
    table.insert(names,lastname .. ", " .. firstname)
  end
  -- sort names by lastname, firstname
  table.sort(names)
  -- return list in one string
  return "(" .. table.concat(names,")(") .. ")"
end
  
return solution
