function pipefix(numbers::Vector{Int64})::Vector{Int64}
  min,max = extrema(numbers)
  range(min, stop=max)
end