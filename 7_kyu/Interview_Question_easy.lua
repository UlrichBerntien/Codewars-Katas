return {
  getStrings = function (city)
    city_lower = string.lower(city)
    counter = {}
    -- count letters only
    for i = string.byte("a"),string.byte("z") do
      counter[string.char(i)] = 0
    end
    -- count
    for i = 1,string.len(city_lower) do
      c = string.sub(city_lower,i,i)
      if counter[c] then
        counter[c] = counter[c] + 1
      end
    end
    accu = ""
    -- combine the counts in the same order as the input string
    for i = 1,string.len(city_lower) do
      c = string.sub(city_lower,i,i)
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