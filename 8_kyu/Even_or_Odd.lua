local kata = {}

-- Returns "Even" if number is even, else returns "Odd".
function kata.even_or_odd(number)
  if number and number % 2 == 0 then
    return "Even"
  else
    return "Odd"
  end
end

return kata