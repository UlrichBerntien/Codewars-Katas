import statistics as stat

def better_than_average(class_points, your_points):
    """
    Compares your_points relative to arithmetic mean of class_points.
    Returns True if your_points is above the mean of class_points, else returns False.
    """
    return your_points > stat.mean(class_points)