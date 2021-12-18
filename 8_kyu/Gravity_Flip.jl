function flip(direction::Char, boxes::Array{Int})::Array{Int}
    sort!(boxes, rev=direction=='L')
end