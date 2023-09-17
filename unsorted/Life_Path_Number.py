def life_path_number(birthdate: str) -> int:
    x = int(birthdate.translate(str.maketrans("","","-")))
    while x > 9:
        d,m = divmod(x,10)
        x = d + m
    return x
