local solution = {}

-- Table of letters to change.
local CHANGETABLE = {["a"]="b",["b"]="a",["A"]="B",["B"]="A"}

-- Pattern set of all characters to change.
local CHANGEPATTERN = "[abAB]"

-- Changes letter "a/b" to "b/a" in string s.
-- Returns changed string.
function solution.switcheroo(s)
  assert( type(s) == "string", "argument must be a string")
  return s:gsub(CHANGEPATTERN, CHANGETABLE)
end

return solution
