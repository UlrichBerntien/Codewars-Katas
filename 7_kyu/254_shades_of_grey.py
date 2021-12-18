def shades_of_grey(n):
    return ["#"+f"{i:02x}"*3 for i in range(1,min(n+1,255))]