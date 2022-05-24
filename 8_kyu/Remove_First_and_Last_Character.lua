local kata={}
function kata.remove_chars(s)
  return string.sub(s,2,-2)
end

return kata