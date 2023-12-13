def find_slope(points: list[int,int,int,int]) -> str:
    if not points or len(points) != 4:
        raise ValueError("argument must a list of x1,y1,x2,y2")
    dx = points[2] - points[0]
    dy = points[3] - points[1]
    return str(dy//dx) if abs(dx) > 1e-3 else "undefined"
