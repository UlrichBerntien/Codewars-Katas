def christmas_tree(height: int) -> str:
    stars = "*" * (height*2)
    whites = " " * height
    lines = ((w:=whites[:height-1-i])+stars[:1+i*2]+w for i in range(0,height))
    return "\n".join(lines)