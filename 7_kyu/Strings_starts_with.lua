local s = {}

function s.startsWith(str, prefix)
  return str:sub(1,#prefix) == prefix
end

return s