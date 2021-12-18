local kata = {}

kata.braces = {
    { open = "(", close = ")" },
    { open = "{", close = "}" },
    { open = "[", close = "]" }
}

kata.validBraces = function(braces)
    local stack = {}
    for index = 1,braces:len() do
        local c = braces:sub(index,index)
        if #stack > 0 and stack[#stack].close == c then
            table.remove(stack)
        else
            local hit = nil
            local i = 1
            while hit == nil and i <= #kata.braces do
                if kata.braces[i].open == c then hit = kata.braces[i] end
                i = i + 1
            end
            if hit then
                table.insert(stack,hit)
            else
                return false
            end
        end
    end
    return #stack == 0
end

return kata
