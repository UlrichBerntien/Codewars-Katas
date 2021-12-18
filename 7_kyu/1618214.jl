function add(num1, num2)
    N = max(ndigits(num1), ndigits(num2))
    sumup(x,accu) = accu * (x >= 10 ? 100 : 10) + x
    foldr(sumup, digits(num1,pad=N)+digits(num2,pad=N))
end