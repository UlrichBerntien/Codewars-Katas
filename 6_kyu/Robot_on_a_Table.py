def robot(Y: int, X: int, s: str) -> tuple[int,int]:
    """
    Finds start coordinate of the robot to stay as longest on the table.
    
    Arguments
    -- Y: last Y coordinate on the table.
    -- X: last X coordinate on the table.
    -- s: movements of the robot
    """
    # Coordinate system used here:
    # 0,0 start position
    # +x = right direction, +y = down direction
    x,y = 0,0           # current robot position relative to start position
    minx,miny = 0,0     # minimal coordinates reached relative to start position
    maxx,maxy = 0,0     # maximal coordinates reached relative to start position
    # go until the table range is reached or the path end is reached
    for c in s:
        if c == 'R' :
            x+=1
            if x > maxx:
                if x-minx >= X: break
                maxx=x
        elif c == 'L':
            x-=1
            if x < minx:
                if maxx-x >= X: break
                minx=x
        elif c == 'D':
            y+=1
            if y > maxy:
                if y-miny >= Y: break
                maxy=y
        elif c == 'U':
            y-=1
            if y < miny:
                if maxy-y >= Y: break
                miny=y
    # minimal possible start coordinates
    return 1-miny, 1-minx
