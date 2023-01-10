local solution = {}

-- Funny string transformation.
-- Returns the argument string s modified:
-- - Replaces each char x by 'Xxx', number of chars are the index in the string.
-- - Separates each char sequence by a dash.
function solution.accum(s)
  if type(s) ~= "string" or #s == 0 then
    return ""
  end
  local u = s:upper()
  local l = s:lower()
  local result = ""
  for i = 1,#s do
    result = result .. u:sub(i,i) .. l:sub(i,i):rep(i-1) .. "-"
  end
  return result:sub(1,-2)
end
  
return solution
