def multiple(x: int) -> str:
    for m,r in (15,"BangBoom"), (3,"Bang"), (5,"Boom"), (1,"Miss"):
        if x % m == 0:
            return r
