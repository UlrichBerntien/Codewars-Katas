TargetGame = {}

function TargetGame.targetGame(vals)
  
  local function maxpoints(start)
    if start > #vals then
      -- no more targets
      return 0
    else
      -- option a: leave the current and get most of the rest
      local va = maxpoints(start+1)
      -- option b: take the current and get most of the rest after the first 2
      local vb = vals[start] + maxpoints(start+2)
      return math.max(va,vb)
    end
  end
    
  return maxpoints(1)
end

return TargetGame