local kata = {}

function kata.count_chars(s)
    local count = {}
    for i = 1,s:len() do
        c = s:sub(i,i)
        count[c] = 1 + (count[c] or 0)
    end
    return count
end

return kata