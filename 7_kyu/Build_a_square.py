def generate_shape(n: int) -> str:
    row = "+"*n
    return (row+"\n")*(n-1) + row