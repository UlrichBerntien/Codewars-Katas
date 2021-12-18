function menfromboys(arr)
    menfirst = (a,b) -> ( iseven(a) && !iseven(b) ) ||
                        ( iseven(a) == iseven(b) == (a < b) )
    result = sort(arr,lt=menfirst)
    unique!(result)
end