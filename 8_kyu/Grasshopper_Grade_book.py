def get_grade(s1: int, s2: int, s3: int) -> str:
    """
    Returns the grade associated with the avrerage of the scores.
    """
    mean = (s1+s2+s3)/3
    for limit,grade in ((90,'A'),(80,'B'),(70,'C'),(60,'D'),(0,'F')):
        if mean >= limit:
            return grade
    # negative mean value of the scores
    return None
