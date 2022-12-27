local kata = {}

-- Count all vowels (aeiou) in the str.
function kata.vowelCount(str)
  return #str:gsub("[^aeiouAEIOU]","")
end

return kata