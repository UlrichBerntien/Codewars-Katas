def count_sheep(n: int) -> str:
    if n < 1:
        return ""
    SHEEP = " sheep..."
    return SHEEP.join(str(it) for it in range(1,n+1))+SHEEP
