local solution = {}

function solution.bonus_time(salary, bonus)
  local total = (bonus and 10 or 1) * salary
  return "$" .. total
end

return solution