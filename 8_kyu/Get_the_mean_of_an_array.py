import statistics

def get_average(marks: list[int]) -> int:
    """
    Returns rounded mean value of all numbers in the list marks.
    Rounds down.
    """
    return int(statistics.mean(marks))
