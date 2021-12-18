def even_or_odd(s: str) -> str:
    delta = 0
    for c in s:
        n = ord(c)-ord('0')
        delta += n if n % 2 else -n
    if delta == 0:
        return "Even and Odd are the same"
    elif delta < 0:
        return "Even is greater than Odd"
    else:
        return "Odd is greater than Even"
