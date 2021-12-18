function sumdigits(number)
    rest = abs(number)
    sum = 0
    while rest > 0
      sum += rest % 10
      rest = rest ÷ 10
    end
    return sum
end