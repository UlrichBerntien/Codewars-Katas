def sayMeOperations(stringNumbers: str) -> str:
    numbers = [int(it) for it in stringNumbers.split()]
    ERROR = "?"
    if len(numbers) < 2:
        return ERROR
    a,b = numbers[0:2]
    names = []
    for c in numbers[2:]:
        if a+b == c:
            r = "addition"
        elif a-b == c:
            r = "subtraction"
        elif a*b == c:
            r = "multiplication"
        elif b != 0 and a//b == c:
            r = "division"
        else:
            r = ERROR
        names.append(r)
        a,b = b,c
    return ", ".join(names)
