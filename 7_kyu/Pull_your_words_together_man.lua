return {
  -- Form a sentence out of the given words (table of strings).
  -- Starts sentence with upper case letter and ends with a dot.
  sentencify = function(words)
    local sentence = table.concat(words, " ")
    sentence = sentence .. '.'
    sentence = sentence:sub(1,1):upper() .. sentence:sub(2)
    return sentence
  end
}
