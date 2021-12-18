function noboringzeros(n)
    while n ≠ 0 && n % 10 == 0
        n ÷= 10
    end
    return n
end