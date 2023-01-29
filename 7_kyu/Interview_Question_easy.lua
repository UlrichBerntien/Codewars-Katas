return {
  getStrings = function (city)
    local city_lower = city:lower()
    -- count letters only
    local counter = {}
    for i = ("a"):byte(),("z"):byte() do
      counter[string.char(i)] = 0
    end
    -- count
    for i = 1,city_lower:len() do
      local c = city_lower:sub(i,i)
      if counter[c] then
        counter[c] = counter[c] + 1
      end
    end
    local accu = ""
    -- combine the counts in the same order as the input string
    for i = 1,city_lower:len() do
      local c = city_lower:sub(i,i)
      if counter[c] then
        if i > 1 then
          accu = accu .. ","
        end
        accu = accu .. c .. ":" .. string.rep("*",counter[c])
        counter[c] = nil
      end
    end
    return accu;
  end
}