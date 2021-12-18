def ptp_distance(x, y):
    """point to point distance"""
    return 5*max(abs(x[0]-y[0]),abs(x[1]-y[1]),abs(x[2]-y[2]))

def calc_distance(path):
    """path length"""
    total = 0
    if not path or len(path) < 2:
        return total
    now_position = path[0]
    for next_position in path[1:]:
        total += ptp_distance(now_position,next_position)
        now_position = next_position
    return total