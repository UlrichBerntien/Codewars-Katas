function pattern(n::Int)::String
    output = IOBuffer()
    for i = 1:n
        str = string(i)
        for j = 1:i write(output,str) end
        if i<n println(output) end
    end
    return String(take!(output))
end