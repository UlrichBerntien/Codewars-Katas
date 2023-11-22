def expression_matter(a, b, c):
    """
    Returns highest achievable result.
    """
    return max(
        a + b + c,
        a + b * c,
        (a + b) * c,
        a * b + c,
        a * (b + c),
        a * b * c )
