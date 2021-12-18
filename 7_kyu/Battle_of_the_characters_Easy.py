def str_power(s: str) -> int:
    return sum( ord(c)-ord("A")+1 for c in s if "A" <= c <= "Z" )

def battle(x: str, y: str) -> str:
    xpower = str_power(x)
    ypower = str_power(y)
    if xpower == ypower:
        return "Tie!"
    elif xpower > ypower:
        return x
    else:
        return y