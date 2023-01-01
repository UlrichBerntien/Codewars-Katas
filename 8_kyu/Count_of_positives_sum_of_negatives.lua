-- Count postive number and sum negative numbers.
-- Value 0 is not counted as positive number.
-- Returns array of count and sum.
function countPositivesSumNegatives(arr)
  -- handle missing argument
  if arr == nil or #arr == 0 then
    return {}
  end
  -- count and add
  local count_positive = 0
  local sum_negative = 0
  for _,a in ipairs(arr) do
    if a <= 0 then
      sum_negative = sum_negative + a
    else
      count_positive = count_positive + 1
    end
  end
  -- return results
  return {count_positive, sum_negative}
end

return countPositivesSumNegatives
