"""
  Returns the one or two characters in the string middle.
"""
function getmiddle(s::String)::String
  if length(s) < 2
    # Special case: empty string.
    # Also: 1 byte strings fast exit.
    return s
  end
  # Converts a string of bytes, UTF-8 encoded, into an array of characters.
  chars = collect(s)
  len = length(chars)
  String(chars[(len+1)÷2:1+len÷2])
end
