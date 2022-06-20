# Check the walk plan.
# The walk plan is a list of same length segments in the diretions n,s,w or e.
# The walk plan must contain exact 10 steps.
# The walk must return to the start position.
def is_valid_walk(walk: list[str]) -> bool:
    if len(walk) != 10:
        # Invalid length
        return False
    # x, y are the coordinate of the current position
    x = 0
    y = 0
    for direction in walk:
        if direction == 'n':
            y += 1
        elif direction == 's':
            y -= 1
        elif direction == 'w':
            x += 1
        elif direction == 'e':
            x -= 1
        else:
            # Invalid direction in list
            return False
    # Walk must return to start point
    return x == 0 and y == 0
