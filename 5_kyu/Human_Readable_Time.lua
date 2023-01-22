local solution = {}

-- Formats time seconds in "hh:mm:ss" with
-- ss = seconds, mm = minutes, hh = hours
-- seconds must be in range 0..99:59:59
function solution.make_readable(seconds)
  if seconds < 0 then
    return "ERR <0"
  elseif seconds >= 100*60*60 then
    return "ERR >100"
  end
  local h,m,s
  s = seconds % 60
  m = seconds // 60
  h = m // 60
  m = m % 60
  return string.format("%02d:%02d:%02d",h,m,s)
end

return solution
