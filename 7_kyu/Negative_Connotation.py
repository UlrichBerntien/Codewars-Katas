def connotation(strng: str) -> bool:
    take = True
    sum = 0
    for c in strng:
        if c.isspace():
            take = True
        elif take:
            sum += 1 if c.lower() < "n" else -1
            take = False
    return sum >= 0
