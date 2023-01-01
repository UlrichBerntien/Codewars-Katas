local kata = {}

-- Calculates average of marks.
-- Returned average rounded down to integer.
function kata.average(marks)
  -- Handle invalid argument
  if marks == nil or #marks == 0 then
    return
  end
  local sum = 0
  for _,x in ipairs(marks) do
    sum = sum + x
  end
  return math.floor( sum / #marks )
end

return kata
