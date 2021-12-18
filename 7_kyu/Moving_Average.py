def moving_average(values,n):
    if len(values) < n or n < 1:
        return None
    s = sum(values[0:n])
    result = [s/n]
    for i in range(n,len(values)):
        s -= values[i-n]
        s += values[i]
        result.append(s/n)
    return result