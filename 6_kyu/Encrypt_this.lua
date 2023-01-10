local solution = {}

-- Encrypts text of words.
function solution.encrypt_this(text)
  local encrypted = ""
  for word in text:gmatch("%w+") do
    -- first character as ASCII value decimal number
    encrypted = encrypted .. word:sub(1,1):byte()
    if #word > 2 then
      -- swaped characters: last character, middle characters, second character
      encrypted = encrypted .. word:sub(-1,-1) .. word:sub(3,-2) .. word:sub(2,2) .. " "
    else
      -- only 1 or 2 character word
      encrypted = encrypted .. word:sub(2) .. " "
    end
  end
  -- Remove last separator character (a space)
  return encrypted:sub(1,-2)
end

return solution
