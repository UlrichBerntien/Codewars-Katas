import numpy as np

# Color name to color ID.
COLOR2ID = np.zeros(256,np.byte)
COLOR2ID[ord("R")] = 1
COLOR2ID[ord("G")] = 2
COLOR2ID[ord("B")] = 4

# Color ID to color name.
ID2COLOR = "_RG_B"

# Base color IDs "or connected" to top color ID.
BASE2TOP = np.asarray((1,1,2,4,4,2,1,1), np.byte)

def triangle(row: str) -> str:
    if not(type(row) is str and len(row) > 1):
        return row
    line = COLOR2ID[np.frombuffer(row.encode(),dtype=np.byte)]
    while len(line) > 1:
        np.bitwise_or(line[:-1], line[1:], out=line[:-1])
        line = line[:-1]
        BASE2TOP.take(line, out=line)
    return ID2COLOR[line[0]]