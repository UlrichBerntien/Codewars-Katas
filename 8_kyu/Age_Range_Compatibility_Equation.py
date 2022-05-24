def dating_range(age) -> str:
    if age > 14:
        min = age/2+7
        max = (age-7)*2
    else:
        min = age * 0.9
        max = age * 1.1
    return f"{int(min)}-{int(max)}"
