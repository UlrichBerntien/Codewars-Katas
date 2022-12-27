-- Evaluates an equation.
-- The arguments and the return value are encoded by x times "."
-- Valid operators are +, -, * and //
return function(equation)
  local iter = equation:gmatch( "%g+" )
  local lhs = #iter()
  local op = iter()
  local rhs = #iter()
  local result = 0
  if op == "+" then
    result = lhs + rhs
  elseif op == "-" then
    result = lhs - rhs
  elseif op == "*" then
    result = lhs * rhs
  elseif op == "//" then
    result = lhs // rhs
  end
  return string.rep(".",result)
end
