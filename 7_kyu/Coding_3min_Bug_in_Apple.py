def sc(a):
    for x,r in enumerate(a):
        for y,c in enumerate(r):
            if c=="B": return [x,y]