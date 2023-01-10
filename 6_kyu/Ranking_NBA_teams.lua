local solution = {}

-- Collect results of NBA team "toFind"
-- Arguments:
--    resultSheet - A string containing list of all matches separated by ",".
--    toFind - Name of the team to find
-- Return:
--    Results of the team.
function solution.nbaCup(resultSheet, toFind)
  if type(resultSheet) ~= "string" or type(toFind) ~= "string" then
    -- invalid arguments
    return
  end
  if #resultSheet == 0 or #toFind == 0 then
    -- empty arguments
    return ""
  end
  -- terminate all matches by a ','
  resultSheet = resultSheet .. ','
  -- scan for decimal point number error
  for err in resultSheet:gmatch("[^.,]+%d+%.%d+[^.,]*,") do
    return "Error(float number):" .. err:sub(1,-2)
  end
  -- collect the results of the team "toFind" in the local variables
  local matches_won = 0
  local matches_draws = 0
  local matches_lost = 0
  local points_scored = 0
  local points_conceded = 0
  local points = 0
  for t1,p1,t2,p2 in resultSheet:gmatch("%s*([%s%w]+)%s+(%d+)%s+([%w%s]+)%s+(%d+)%s*,") do
    if toFind == t2 then
      t1,t2 = t2,t1
      p1,p2 = p2,p1
    end
    if toFind == t1 then
      -- parse only details if this is the team to find
      p1 = tonumber(p1)
      p2 = tonumber(p2)
      if p1 > p2 then
        matches_won = matches_won + 1
        points = points + 3
      elseif p2 > p1 then
        matches_lost = matches_lost + 1
      else
        matches_draws = matches_draws + 1
        points = points + 1
      end
      points_scored = points_scored + p1
      points_conceded = points_conceded + p2
    end
  end
  -- Format result string
  if matches_won+matches_draws+matches_lost == 0 then
    return toFind .. ":This team didn't play!"
  else
    return string.format("%s:W=%d;D=%d;L=%d;Scored=%d;Conceded=%d;Points=%d",toFind,matches_won,matches_draws,matches_lost,points_scored,points_conceded,points)
  end
end

return solution
