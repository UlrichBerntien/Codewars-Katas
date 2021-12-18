# Color name to color ID.
COLOR2ID = {"R":0, "G":1, "B":2}

# Color ID to color name.
ID2COLOR = "RGB"

# Base color IDs to top color ID.
BASE2TOP = (0,2,1, 2,1,0, 1,0,2)

def triangle(row: str) -> str:
    line = list(map(lambda c: COLOR2ID[c],row))
    for n in range(len(line),1,-1):
        for idx in range(n-1):
            line[idx] = BASE2TOP[line[idx] + 3*line[idx+1]]
    return ID2COLOR[line[0]]