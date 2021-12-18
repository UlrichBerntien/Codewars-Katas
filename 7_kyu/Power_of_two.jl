function ispoweroftwo(n)
  if n > 1
    while n & 1 == 0
      n >>= 1
    end
  end
  n == 1
end