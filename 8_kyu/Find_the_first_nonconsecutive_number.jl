function firstnonconsecutive(arr::Array)
    # bisection search, more code but less runtime
    if sizeof(arr) < 2
        return nothing
    end
    a = firstindex(arr)
    b = lastindex(arr)
    offset = arr[a]-a
    if arr[b] == b+offset
        return nothing
    end
    while a < b
        c = (a+b)÷2
        if arr[c] == c+offset
            a = c+1
        else
            b = c
        end
    end
    arr[b]
end