return function(n)
    local ones = {1,1,1,1,1}
    while #ones < n do
        ones = table.pack(table.unpack(ones),table.unpack(ones))
    end
    local pyramid = {}
    for i = 1,n do
        pyramid[i] = table.pack(table.unpack(ones,1,i))
        pyramid[i]["n"] = nil
    end
    return pyramid
end