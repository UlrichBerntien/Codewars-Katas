return {
  -- Check the walk plan.
  -- The walk plan is an array of steps in the direction n,s,w or e.
  -- The walk must contain exact 10 steps.
  -- The walk must return to the start point.
  is_valid_walk = function(walk)
    if walk == nil or #walk ~= 10 then
      -- Walk has not correct length of 10 steps.
      return false
    end
    local counter = {n=0, s=0,e=0,w=0}
    for _,direction in pairs(walk) do
      if counter[direction] == nul then
        -- Invalid direction code in the walk plan
        return false
      end
      counter[direction] = counter[direction] + 1
    end
    -- the walk must return to the start point.
    return counter.s == counter.n and counter.e == counter.w
  end
}
