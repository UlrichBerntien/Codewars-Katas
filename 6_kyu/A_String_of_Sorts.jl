function sortstring(str, ordering)
    order = Dict( map( reverse, enumerate(unique(ordering)) ) )
    N = length(order)+1
    specialorder = c -> haskey(order,c) ? order[c] : N
    join( sort([c for c in str], by=specialorder ) )
end