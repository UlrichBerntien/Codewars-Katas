# Returns maximum and minimum of the numbers.
# All values are stored in space separated decimal numbers.
function highandlow(numbers)
  minmax = extrema(map(it -> parse(Int,it),split(numbers)))
  "$(minmax[2]) $(minmax[1])"
end
