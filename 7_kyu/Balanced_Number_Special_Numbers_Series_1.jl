const results = ["Balanced","Not Balanced"]

function balancednum(number)
  if number < 100
    # one and two digits are balanced
    return results[1]
  end
  d = digits(number)
  m = (length(d)-1) ÷ 2
  n = (length(d)+4) ÷ 2
  return results[sum(d[1:m]) == sum(d[n:end]) ? 1 : 2]
end