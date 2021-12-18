def solve(arr):
    def special_key(value):
        factor_count = [0,0,0,0]
        for prime in (2,3):
            count = 0
            while value > 0:
                d,m = divmod(value,prime)
                if m != 0:
                    break
                value = d
                count += 1
            factor_count[prime] = count
        return (-factor_count[3],factor_count[2])
    return sorted(arr,key=special_key)