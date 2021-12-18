def zeros(n):
    def factor_count(f):
        sum = 0
        F = f
        while F < n:
            sum += n // F
            F *= f
        return sum         
    return min( factor_count(2), factor_count(5) )