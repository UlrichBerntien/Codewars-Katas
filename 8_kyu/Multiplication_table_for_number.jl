"""
  Generates multiplication table 1,2,..,10 times the number.
"""
function multitable(number::Number)::String
  join(["$i * $number = $(i*number)" for i in 1:10], '\n')
end
