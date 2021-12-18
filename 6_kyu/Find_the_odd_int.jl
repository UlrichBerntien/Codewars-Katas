function findodd(ns::Array{T,1})::Int where T <: Any
    set = Dict{T,Int}()
    for i in ns
        set[i] = get(set,i,0) + 1
    end
    for (k,v) in set
        if isodd(v) return k end
    end
    return 0
end