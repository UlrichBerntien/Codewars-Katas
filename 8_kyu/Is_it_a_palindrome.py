def is_palindrome(s :str) -> bool:
    """Returns True if s is an palindrome."""
    s = s.lower()
    return s == s[::-1]
