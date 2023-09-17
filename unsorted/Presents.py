def presents(a):
    out = [0]*len(a)
    for index,value in enumerate(a):
        out[value-1] = index+1
    return out