function points(games::AbstractArray{<:AbstractString})::Int
    function score(it::AbstractString)::Int
        it[1]  > it[3] && return 3
        it[1] == it[3] && return 1
        0
    end    
    sum(score, games)
end