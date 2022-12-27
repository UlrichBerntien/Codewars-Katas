kata = {}

-- Returns string with all vowels (aeiou) removed.
function kata.disemvowel(s)
  return s:gsub("[aeiouAEIOU]","")
end

return kata
