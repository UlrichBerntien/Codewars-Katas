return function(n)
    ones = {1,1,1,1,1}
    while #ones < n do
        ones = table.pack(table.unpack(ones),table.unpack(ones))
    end
    pyramid = {}
    for i = 1,n do
        table.insert(pyramid, table.pack(table.unpack(ones,1,i)))
        pyramid[i]["n"] = nil
    end
    return pyramid
end