function persistence(num)
    count = 0
    while num > 9
        num = reduce(*,digits(num))
        count += 1
    end
    count
end