def maskify(cc: str) -> str:
    """Returns masked string."""
    keep = cc[-4:]
    return "#"*(len(cc)-len(keep)) + keep