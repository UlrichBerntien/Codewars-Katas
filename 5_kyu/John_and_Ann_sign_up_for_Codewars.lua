local solution = {}

-- Returns number of katas John solved at day 0,..,n-1.
function solution.john(n)
  if solution.cache.n < n then
    solution.expand(n)
  end
  return solution.slice(solution.cache.john,1,n)
end

-- Returns number of katas Ann solved at day 0,..,n-1.
function solution.ann(n)
  if solution.cache.n < n then
    solution.expand(n)
  end
  return solution.slice(solution.cache.ann,1,n)
end

-- Returns total number of katas John solved up to day n-1.
function solution.sumJohn(n)
  if solution.cache.n < n then
    solution.expand(n)
  end
  return solution.cache.sumJohn[n]
end

-- Returns total number of katas Ann solved up to day n-1.
function solution.sumAnn(n)
  if solution.cache.n < n then
    solution.expand(n)
  end
  return solution.cache.sumAnn[n]
end

-- Cache of already calculated values.
-- Index is "day+1", e.g. day 0 stored at index 1.
solution.cache = {
  n = 1,          -- up to day n are in the cache 
  ann = {1},      -- number of katas solved by Ann at the day i
  john = {0},     -- number of katas solved by John at the day i
  sumAnn = {1},   -- total number of katas solved by Ann up to the day i
  sumJohn = {0},  -- total number of katas solved by John up to day i
}

-- Expands the caached values up to day n.
function solution.expand(n)
  -- expand cached values in 100 items blocks
  n = ((n//100)+1)*100
  local c = solution.cache
  for i = c.n+1, n do
    table.insert(c.john, i-1-c.ann[1+c.john[i-1]])
    table.insert(c.ann, i-1-c.john[1+c.ann[i-1]])
    table.insert(c.sumAnn, c.sumAnn[i-1]+c.ann[i])
    table.insert(c.sumJohn, c.sumJohn[i-1]+c.john[i])
  end
  c.n = n
end

-- Gets slice array[first:last]
-- Arguments:
--    array - copies the items from this array.
--    first - index of first item to copy (cutted to 1)
--    last - index of last item to copy (cutted to #array)
-- Return
--    Copy of the array items
function solution.slice(array, first, last)
   local accu = {}
   for i = math.max(1,first), math.min(last,#array) do
      table.insert( accu, array[i] )
   end
   return accu
end  

return solution
