return function(a, b, c)
  return math.max( a*(b+c), a*b*c, a+b+c, (a+b)*c )
end