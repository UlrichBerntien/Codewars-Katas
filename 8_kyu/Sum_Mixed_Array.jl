"Sums all items in the array as Int64 numbers."
summix(x) = sum(map(tonumber,x))

# Convert all to numbers, interpret strings as decimal numbers
tonumber(x::Number) = x
tonumber(x::AbstractString) = parse(Int64,x)
