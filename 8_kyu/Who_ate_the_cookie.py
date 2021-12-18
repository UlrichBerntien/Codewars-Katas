def cookie(x) -> str:
    t = type(x)
    if t == str:
        name = "Zach"
    elif t in (float,int):
        name = "Monica"
    else:
        name = "the dog"
    return f"Who ate the last cookie? It was {name}!"