local kata = {}

-- Calculate tge amount of points of the football team.
-- Argument is a table of strings. Each string in format "x:y" where x,y is one decimal digits.
-- Adds the points per game: 3 points for win, 1 point for tie, 0 point for lost.
function kata.points(games)
  local points = 0
  for _,game in pairs(games) do
    local delta = game:byte(1) - game:byte(-1)
    if delta > 0 then
      points = points + 3
    elseif delta == 0 then
      points = points + 1
    end
  end
  return points
end

return kata
