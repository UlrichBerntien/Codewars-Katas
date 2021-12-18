local kata = {}

kata.opposite = {
  ["NORTH"] = "SOUTH",
  ["SOUTH"] = "NORTH",
  ["WEST"] = "EAST",
  ["EAST"] = "WEST"
}

function kata.dirReduc(dir)
  local reduced = {}
  local last = 0
  for _,d in ipairs(dir) do
    if last > 0 and reduced[last] == kata.opposite[d] then
      table.remove(reduced,last)
      last = last - 1
    else
      last = last + 1
      reduced[last] = d
    end
  end
  return reduced
end

return kata
