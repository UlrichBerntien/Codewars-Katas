"""
  Returns array of digits formated as phone number string.
"""
function createphonenumber(numbers::Array{<:Integer,1})::String
  map( c -> '0' ≤ c  ≤ '9' ? Char(numbers[1+(9+Int(c)-Int('0'))%10]+Int('0')) : c, NUMBER_PATTERN )
end

"""
  Pattern to convert array to phone number.
  A decimal digit is the index 0..9 in the array.
  All other characters are copied to the destination.
"""
const NUMBER_PATTERN = "(123) 456-7890"
