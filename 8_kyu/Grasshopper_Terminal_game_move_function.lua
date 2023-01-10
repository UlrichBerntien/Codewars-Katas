kata = {}

-- Execute game move.
-- Arguments:
--    pos - current position
--    roll - dice result
-- Return:
--    new position, roll is used 2 times
function kata.move(pos, roll)
  return pos + 2 * roll
end

return kata
