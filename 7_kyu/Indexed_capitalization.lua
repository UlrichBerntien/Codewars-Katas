local indexcap = {}

function cut(str,index)
  -- cut string at given index
  -- returns part before index, char at index, part after index
  return str:sub(1,index-1),
         str:sub(index,index),
         str:sub(index+1)
end

function indexcap.capitalize(str,indices)
  -- WARNING: values in indices are 0 based indices into string str.
  local rest = str       -- rest of the string to process
  local restindex = 1    -- index of first char in rest
  local accu = ""        -- already processed part of the string
  table.sort(indices)
  for _,index in ipairs(indices) do
    local ra,rb,rc = cut(rest,index-restindex+2)
    accu = accu .. ra .. rb:upper()
    rest = rc
    restindex = index+2
  end
  accu = accu .. rest
  return accu
end 

return indexcap