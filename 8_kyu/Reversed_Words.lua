return {
  -- Returns string with all words from str in reversed order.
  reverse_words = function(str)
      local accu = ""
      for word in str:gmatch("%S+") do
        accu = word .. " " .. accu
      end
      return accu:sub(1,-2)
    end
  }