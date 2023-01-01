local solution = {}

-- Returns the str which all dots replaced by dashes.
function solution.replace_dots(str)
  return str:gsub("%.", "-")
end

return solution
