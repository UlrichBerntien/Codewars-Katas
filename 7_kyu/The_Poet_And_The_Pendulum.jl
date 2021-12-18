function pendulum(numbers)
    sorted = sort(numbers)
    result = similar(sorted)
    destination = (1+lastindex(result))÷2
    step = 1
    for v in sorted
        result[destination] = v
        destination += step
        step = step < 0 ? -step+1 : -step-1
    end
    result
end