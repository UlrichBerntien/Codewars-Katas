function solution(str::String)::Array{String}
    # unicode safe
    result = Array{String}(undef,(1+length(str))÷2)
    i = 0
    for c in str
        i += 1
        if isodd(i)
            result[i÷2+1] = String([c])
        else
            result[i÷2] *= String([c])
        end
    end
    if isodd(i)
        result[end] *= "_"
    end
    result
end