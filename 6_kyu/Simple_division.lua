simplediv = {}
function simplediv.solve(a,b)
    local i = 2
    while i <= b and i <= a do
      if b % i == 0 then
          if a % i > 0 then
              return false
          end
          repeat
              b = b // i
          until b % i > 0
          repeat
              a = a // i
          until a % i > 0
      end
      i = i + 1
    end
    return b == 1
end
return simplediv