from typing import List, Tuple

# Options to walk from pixel to pixel
WALK_XY =[(1,0),(0,1),(-1,0),(0,-1),]

# Free space outside the office
OUTSIDE = " "

# Part inside the office
INSIDE = "."

def locate_entrance(office: List[str]) -> Tuple[int, int]:
    # expand the office map with the space around the office
    def get(x: int, y:int) -> str:
        if x < 0 or y < 0 or y >= len(office) or x >= len(office[y]):
            return OUTSIDE
        else :
            return office[y][x]
    # Search a part inside the office with walk option to space
    for y in range(len(office)):
        row = office[y]        
        for x in range(len(row)):
            if row[x] == INSIDE:
                # x,y is inside the office
                for deltax,deltay in WALK_XY:
                    if get(x+deltax,y+deltay) == OUTSIDE:
                        # here is a way to outside
                        return x,y
    # No way from inside to outside
    return -1, -1
