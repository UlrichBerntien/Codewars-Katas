def doubles(source: str) -> str:
    """Returns the source without double characters."""
    destination = []
    for c in source:
        if destination and destination[-1] == c:
            destination.pop()
        else:
            destination.append(c)
    return ''.join(destination)