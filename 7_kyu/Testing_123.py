def number(lines):
    return ["{0}: {1}".format(*ns) for ns in enumerate(lines,start=1)]