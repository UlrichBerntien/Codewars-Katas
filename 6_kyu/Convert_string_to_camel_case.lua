-- Formats string in camel case.
-- Removes separators "_- " and forces CamelCase.
-- Separator at any position (e.g. first,last) are removed.
return function(str)
  if type(str) ~= 'string' or #str == 0 then
    -- Invalid argument
    return ""
  end
  local strLower = str:lower()
  local strUpper = str:upper()
  -- first letter unchanged case; but could be a separator
  local c = str:sub(1,1)
  local result = ""
  -- rest of string camel casing
  local src = 1
  while src <= #str do
    -- skip all separators
    while src <= #str and (c == "_" or c == "-" or c == " ") do
      src = src + 1
      -- only after separator uppercase
      c = strUpper:sub(src,src)
    end
    if src <= #str then
      result = result .. c
      src = src + 1
      c = strLower:sub(src,src)
    end
  end
  return result
end
