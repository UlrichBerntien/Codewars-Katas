local solution = {}

-- Encode a number in the given variable length binary code.
-- Length of the prefix "0...01" gives the number of bits.
-- Prefix is followed by the binary coded number.
local function encode(x)
  x = tonumber(x)
  assert(x and x>=0, "argument must be a non-negative number")
  local prefix = ""
  local value = ""
  repeat
    value = x%2 .. value
    x = x // 2
    if x > 0 then
      prefix = prefix .. "0"
    else
      prefix = prefix .. "1"
    end
  until x == 0 
  return prefix .. value
end

-- Generates code table character byte -> code string.
-- Generates codes only for digits "0" .. "9".
local function generate_encode_table()
  local table = {}
  for i = 0,9 do
    table[tostring(i):byte()] = encode(i)
  end
  return table
end

-- Generates decode tree from encode table.
local function generate_decode_tree(encode_table)
  decode_tree = {}
  for plain,code in pairs(encode_table) do
    -- plain text must be converted into string
    plain = string.char(plain)
    -- add the encoded string into the decode tree
    local ptr = decode_tree
    for i = 1,#code-1 do
      local c = code:sub(i,i):byte()
      if not ptr[c] then
        -- expand the tree, add next node
        ptr[c] = {}
      end
      ptr = ptr[c]
    end
    -- last item is the plain text string    
    assert(not ptr[code:sub(-1)], "code used twice")
    ptr[code:sub(-1):byte()] = plain
  end
  return decode_tree
end

-- Encode table character byte -> encoded string
-- Index is the code of the character to encode.
-- Value is the encoded string.
local encode_table = generate_encode_table()

-- Decode tree encoded string -> decoded string
-- Index is the next encoded character as byte value (not as string).
-- Value is the decoded string, if end of code word is reached
-- or value is the next node (table) in the decode tree.
local decode_tree = generate_decode_tree(encode_table)

-- Encode string of digits.
function solution.code(s)
  assert(type(s)=="string", "argument must be a string")
  local encoded = ""
  for c in s:gmatch(".") do
    local code = encode_table[c:byte()]
    if code then
      encoded = encoded .. code
    end
    -- else: ignore characters not in the code table
  end
  return encoded
end

-- Decodes into string of digits.
function solution.decode(str)
  assert(type(str)=="string", "argument must be a string")
  local decoded = ""
  local tree_pointer = decode_tree
  for c in str:gmatch(".") do
    tree_pointer = tree_pointer[c:byte()]
    if not tree_pointer then
      -- invalid code, reset decoder
      tree_pointer = decode_tree
    elseif type(tree_pointer) == "string" then
      -- reached encoded string
      decoded = decoded .. tree_pointer
      tree_pointer = decode_tree
    end
  end
  return decoded
end

return solution
