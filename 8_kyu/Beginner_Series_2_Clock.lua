-- Converts hours, minutes, seconds into milliseconds.
return function(hours, minutes, seconds)
  -- also accept nil as 0
  hours = hours or 0
  minutes = minutes or 0
  seconds = seconds or 0
  -- convert into milliseconds
  return ((hours*60 + minutes)*60 + seconds)*1000
end
