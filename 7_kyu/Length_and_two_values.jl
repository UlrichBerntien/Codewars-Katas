# Returns an array of length n with elements first, second, first, ...
function alternate(n::Integer, first, second)
  result = repeat([first,second],outer=(n+1)÷2)
  if n%2 > 0
    pop!(result)
  end
  result
end
