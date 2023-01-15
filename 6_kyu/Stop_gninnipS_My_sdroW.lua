local solution = {}

-- Reverses all words with 5 or letters,
-- Argument:
--    sentence - String of word separated by space.
-- Return:
--    Copy of the string, all 5 or more letter words reversed.
function solution.spin_words(sentence)
  if type(sentence) == "string" then
    return sentence:gsub("%S%S%S%S%S+",string.reverse)
  else
    -- ignores invalid argument
    return ""
  end
end

return solution
