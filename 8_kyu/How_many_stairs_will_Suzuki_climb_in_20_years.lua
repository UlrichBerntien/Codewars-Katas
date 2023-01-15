-- Returns extimation of stairs in 20 years.
-- Argument
--    Array of array containing number of stairs per day,
--    in sum number of stairs in one year.
-- Return
--    Estimated stairs = 20 * stairs in one year.
function stairsIn20Years(stairs)
  local sum = 0
  for _,weekday in ipairs(stairs) do
    for _,day in ipairs(weekday) do
      sum = sum + day
    end
  end
  return 20 * sum
end

return stairsIn20Years
