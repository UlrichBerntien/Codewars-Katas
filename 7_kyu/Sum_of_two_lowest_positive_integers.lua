-- Sums the two smallest positive numbers.
-- Sums only positive numbers > 0, only the 2 smallest.
function sum_two_smallest_numbers(array)
  local lowest_positive = {}
  local l_index = 0
  local a_index = 1
  -- fill with first two positive numbers
  while l_index < 2 and a_index <= #array do
    if array[a_index] > 0 then
      l_index = l_index + 1
      lowest_positive[l_index] = array[a_index]
    end
    a_index = a_index + 1
  end
  if l_index < 2 then
    -- not two positive numbers in the array
    return lowest_positive[0] or 0
  end
  -- sort
  if lowest_positive[2] < lowest_positive[1] then
    lowest_positive[1], lowest_positive[2] = lowest_positive[2], lowest_positive[1]
  end
  -- check the rest of the array
  while a_index <= #array do
    if array[a_index] > 0 and array[a_index] < lowest_positive[2] then
      if array[a_index] < lowest_positive[1] then
        lowest_positive[1], lowest_positive[2] = array[a_index], lowest_positive[1]
      else
        lowest_positive[2] = array[a_index]
      end
    end
    a_index = a_index + 1
  end
  -- return sum of two lowest positive integers
  return lowest_positive[1]+lowest_positive[2]
end

return sum_two_smallest_numbers
