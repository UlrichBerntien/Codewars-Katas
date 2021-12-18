local kata = {}

kata.romanTable = {
  { 1000, "M" },
  { 900, "CM" },  { 500, "D" }, { 400, "CD" }, { 100, "C" },
  { 90, "XC" },   { 50, "L" },  { 40, "XL" },  { 10, "X" },
  { 9, "IX" },    { 5, "V" },   { 4, "IV" },   { 1, "I" }
}

kata.romanEncoder = function(number)
  local accu = ""
  for _,x in pairs(kata.romanTable) do
    local n,symbol = x[1], x[2]
    while n <= number do
      accu = accu .. symbol
      number = number - n
    end
  end
  return accu
end

return kata
