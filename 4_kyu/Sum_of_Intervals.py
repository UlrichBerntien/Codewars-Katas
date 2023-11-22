def sum_of_intervals(intervals: list[list[int,int]]) -> int:
    """
    Calculate sum of interval lengths.
    Does not add overlapping intervals twice.
    """
    # Preparation step:
    #   Store start and end points in a sorted list.
    #   Store start point as (coordinate,+1) amd end point as (coordinate,-1)
    points = []
    for i in intervals:
        points.append((i[0],+1))
        points.append((i[1],-1))
    points.sort( key=lambda cf: cf[0] )
    # Calculate the sum of all interval lengths
    sum = 0 # sum of all closed intervals so far
    deep = 0 # number of current overlapping intervals
    start = 0 # start coordinate of current interval
    for p in points:
        if deep == 0 and p[1] == 1:
            # start of a new interval
            start = p[0]
        elif deep == 1 and p[1] == -1:
            # end of the current interval
            sum += p[0] - start
        deep += p[1]
    return sum
