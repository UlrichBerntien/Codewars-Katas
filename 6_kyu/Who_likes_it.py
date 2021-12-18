def likes(names):
    l=len(names)
    if l is 0:
        return "no one likes this"
    elif l is 1:      
        return f"{names[0]} likes this"
    elif l is 2:
        return f"{names[0]} and {names[1]} like this"
    elif l is 3:
        return f"{names[0]}, {names[1]} and {names[2]} like this"
    else:
        return f"{names[0]}, {names[1]} and {len(names)-2} others like this"
