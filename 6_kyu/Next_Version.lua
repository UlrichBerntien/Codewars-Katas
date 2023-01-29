local kata = {}

---@param str string
function kata.nextVersion(str)
    local tail = ""
    while true do
        local i = string.find(str,"%.9$")
        if not i then break end
        str = string.sub(str,1,i-1)
        tail = ".0" .. tail
    end
    local head = ""
    while true do
        local m = string.match(str,"%d*%.")
        if not m then break end
        head = head .. m
        str = string.sub(str,#m+1)
    end
    return head .. tostring(tonumber(str)+1) .. tail
end

return kata