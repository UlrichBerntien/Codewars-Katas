function getsum(a::Int, b::Int)::Int
    if a == b
        a
    else
        start,stop = minmax(a,b)
        N = stop-start+1
        (N*(N-1))÷2 + N*start
    end
end