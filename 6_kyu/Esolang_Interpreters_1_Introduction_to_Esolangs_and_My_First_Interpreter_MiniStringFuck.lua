-- MiniStringFuck interpreter.
--    https://esolangs.org/wiki/MiniStringFuck
-- Argument:
--    Code to execute.
--    Chars could be + (increment action) or . (print action).
--    All other chars in the string are ignored.
-- Return:
--    Printed characters in a string.
function myFirstInterpreter(code)
  local accu = ""
  local cell = 0
  for plusdot in code:gmatch("%+*%.?") do
    if plusdot:sub(-1) == '.' then
      cell = (cell+#plusdot-1) % 256
      accu = accu .. string.char(cell)
    else
      cell = (cell+#plusdot) % 256
    end 
  end
	return accu
end

return myFirstInterpreter
