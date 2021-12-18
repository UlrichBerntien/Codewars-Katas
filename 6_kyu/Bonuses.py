def bonus(arr, s):
    a = s / sum(1/n for n in arr)
    return [round(a/n) for n in arr]