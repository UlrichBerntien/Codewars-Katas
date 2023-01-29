local solution = {}

-- Returns "Car dead" if string n contains 15 or more characters other than "_" else returns "Woohoo!".
function solution.bumps(n)
  if #n:gsub("_","") > 15 then
    return "Car Dead"
  else
    return "Woohoo!"
  end
end

return solution