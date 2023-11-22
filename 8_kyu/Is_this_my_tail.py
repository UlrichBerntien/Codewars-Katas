def correct_tail(body :str, tail :str) -> bool:
    """
    Returns true if and only if last char in string body is the string tail.
    """
    return body and body[-1] == tail
