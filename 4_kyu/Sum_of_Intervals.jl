function sumofintervals(a::Array{Tuple{T,T}})::T where {T<:Number}
    # (x,false) = start point at x, (x,true) = end point at x
    points = reduce( append!, map( p -> [(p[1],false),(p[2],true)], a ), init=Tuple{T,Bool}[] )
    sort!( points )
    sum = 0
    in_interval = 0
    start_interval = 0
    for p in points
        if p[2] # true = end point
            in_interval -= 1
            if in_interval == 0
                sum += p[1] - start_interval
            end
        else # false = start point
            in_interval += 1
            if in_interval == 1
                start_interval = p[1]
            end 
        end
    end        
    sum
end