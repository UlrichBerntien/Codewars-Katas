def grader(score: float) -> str:
    "Translated scores into grade code letter."
    TRANSLATE = ((0.9,"A"), (0.8,"B"), (0.7,"C"), (0.6,"D"))
    if score > 1 or score < 0:
        # Error case, score out of range
        return 'F'
    for limit,code in TRANSLATE:
        if score >= limit:
            return code
    return 'F'
