local function enough(cap, on, wait)
  local overload = on + wait - cap
  return math.max(0,overload)
end

return enough