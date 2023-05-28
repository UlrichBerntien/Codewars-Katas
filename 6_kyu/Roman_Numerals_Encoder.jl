"""
  Translates positive integer in a Roman numeral.
"""
function encoderomannumeral(number::Integer)::String
  result = ""
  for (value,roman) in VALUE_TO_ROMAN
    while value <= number
      number -= value
      result *= roman
    end
  end
  result
end

# Tuple of all Pairs "value => Roman number".
# Special roman numbers like "IV" are included in this list.
# Descended sorted by value.
const VALUE_TO_ROMAN = (
  (1000 => "M"), 
  (900 => "CM"),
  (500 => "D"),
  (400 => "CD"),
  (100 => "C"), 
  (90 => "XC"),
  (50 => "L"),
  (40 => "XL"),
  (10 => "X"),
  (9 => "IX"),
  (5 => "V"),
  (4 => "IV"),
  (1 => "I"),
)
