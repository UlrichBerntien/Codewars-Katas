function pattern(n::Integer)::String
  if n < 1
      return ""
  end
  output = Char[]
  sizehint!(output,n^2)
  # only convert one time the integers to strings
  numbers = Array{String}(undef,n)
  map!( string, numbers, 1:n )
  # generate the pattern
  for last = 1:n
      for idx = n:-1:last
          append!(output, numbers[idx] )
      end
      push!(output, '\n' )
  end
  # end-1 because no \n at the end
  String( output[1:end-1] )
end