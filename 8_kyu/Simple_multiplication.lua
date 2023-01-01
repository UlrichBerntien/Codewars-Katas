-- Returns the number
--    multiplied by 8 if number is even
--    multiplied by 9 else
function simpleMultiplication(number)
  return number * (8 + (number & 1))
end

return simpleMultiplication