-- Replace all words/numbers in the sentence by "sex".
function toFreud(sentence)
  return sentence:gsub("%g+", "sex");
end

return toFreud
