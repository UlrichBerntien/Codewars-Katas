function stripcomments(input, markers)
    function popspace!(arr)
        while !isempty(arr) && isspace(arr[end])
            pop!(arr)
        end
    end    
    markers = join(markers)
    output = Char[]
    incomment = false
    for c ∈ input
        if c == '\n'
            incomment = false
            popspace!(output)
            append!(output,c)
        elseif incomment
        elseif c ∈ markers
            incomment = true
        else
            append!(output,c)
        end
    end
    popspace!(output)
    String(output)
end