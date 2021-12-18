function sumofintervals(a::Array{Tuple{Int,Int}})
    # (x,-1) = start point at x, (x,+1) = end point at x
    points = collect(Iterators.flatten(map( p -> [(p[1],-1),(p[2],+1)], a )))
    sort!( points )
    sum = 0
    in_interval = 0
    start_interval = 0
    for p in points
        in_interval -= p[2]
        if p[2] < 0 && in_interval == 1
            start_interval = p[1]
        elseif p[2] > 0 && in_interval == 0
            sum += p[1] - start_interval
        end
    end
    sum
end