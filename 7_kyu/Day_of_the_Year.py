import time

def to_day_of_year(date :list[int]) -> int:
    """
    Returns day of the year.
    date -- list of day, month, year
    """
    return time.strptime(" ".join(map(str,date)), "%d %m %Y").tm_yday
