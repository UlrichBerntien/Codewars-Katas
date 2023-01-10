local solution = {}

-- Class for the radix tree data structure
local RadixTree = {}

-- Creates an empty radix tree
function RadixTree:new()
  local tree = {}
  setmetatable(tree,self)
  self.__index = self
  return tree
end


-- Inserts string item into radix tree.
-- Does nothing if string is already in the tree.
-- Does nothing on empty string or non-string argument.
function RadixTree.insert(tree, item)
  print("insert", item)
  if type(item) ~= "string" or #item == 0 then
    -- nothing to insert
    return tree
  end
  local subtree = tree
  local tail = item
  while #tail > 0 do
    local match = RadixTree.searchPrefix(subtree, tail)
    if match then
      if match == tail:sub(1,#match) then
        -- match is a real prefix of tail -> go into subtree
        tail = tail:sub(#match+1)
        subtree = subtree[match]
      else
        -- only partly match -> split the node
        local old_subtree = subtree[match]
        local new_prefix, old_tail, new_tail = RadixTree.split(match, tail)
        subtree[match] = nil
        subtree[new_prefix] = {}
        subtree[new_prefix][old_tail]=old_subtree
        if #new_tail > 0 then
          subtree[new_prefix][new_tail]={}
        end
      end
    else
      -- no node with matching prefix -> create new node.
      subtree[tail] = {}
      tail = ""
    end
  end
  return tree
end


-- Search an existing prefix of item in the list.
-- Returns the key which is a prefix of item or key with same prefix as item
-- Returns nil if no prefix of tail is in the list.
function RadixTree.searchPrefix(list, item)
  -- empty string is never part of the list
  if not item or #item == 0 then
    return nil
  end
  -- search a node with matching prefix
  local first = item:sub(1,1)
  for key,_ in pairs(list) do
    if key:sub(1,1) == first then
      return key
    end
  end
  -- no matching node found
  return nil
end


-- Splits strings a and b into prefix|tail_a amd prefix|tail_b.
-- Splits into common prefix string and to different tails.
-- Returns prefix, tail_a, tail_B
function RadixTree.split(a, b)
  local prefix = ""
  local tail_a = a
  local tail_b = b
  while tail_a:sub(1,1) == tail_b:sub(1,1) do
    prefix = prefix .. tail_a:sub(1,1)
    tail_a = tail_a:sub(2)
    tail_b = tail_b:sub(2)
  end
  return prefix, tail_a, tail_b
end


-- Creates a radix tree out of the arguments.
-- Arguments: strings.
-- Return: Radix tree containing all argument strings.
function solution.radix_tree(...)
  local tree = RadixTree:new()
  for _,v in ipairs({...}) do
    tree = tree:insert(v)
  end
  return tree
end


return solution
