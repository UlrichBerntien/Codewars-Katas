-- Swaps the two words in the string.
-- Argument:
--    A string in format "wordA wordB"
-- Return:
--    String swaped, format "wordB wordA"
function nameShuffler(str)
  return str:gsub("(%S+)%s+(%S*)","%2 %1")
end

return nameShuffler
