"""
  Returns english names of integers 0,1,..,9.
  Returns decimal number for other numbers.
"""
function switchitup(number::Real)::String
  isinteger(number) && 0 ≤ number < length(ENGLISH_NUMBER_NAMES) ? ENGLISH_NUMBER_NAMES[number+1] : string(number)
end

const ENGLISH_NUMBER_NAMES = ("Zero", "One", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine")
