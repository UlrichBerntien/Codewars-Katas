from typing import List

def loneliest(strng: str) -> List[str]:
    """Returns the list of loneliest characters."""
    chars = []
    distances = []
    count_spaces = 0
    for c in strng:
        if c.isspace():
            count_spaces += 1
        else:
            if distances: distances[-1] += count_spaces
            chars.append( c )
            distances.append( count_spaces )
            count_spaces = 0
    max_distance = max( distances )
    return [chars[it] for it in range(len(distances)) if distances[it] == max_distance]