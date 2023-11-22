import re

def range_parser(s: str) -> list[int]:
    """
    Parses positve integer range description.
    Appends all ranges, does not remove doubled items.
    s -- Ranges "a-b:c" separated by comma. With b and c optional. End b is included. Default end b is a, default step c is 1.
    return -- List of all integers in the range.
    """
    combined = []
    for m in RANGE_PATTERN.finditer(s):
        if m.lastgroup == 'value':
            start,stop,step = m.group(2),m.group(3),m.group(4)
            # Remark: no syntax check here, e.g. "1:2" is accepted as range "1-2"
            if not stop:
                combined.append(int(start))
            elif not step:
                combined.extend( range(int(start),int(stop[1:])+1) )
            else:
                combined.extend( range(int(start),int(stop[1:])+1,int(step[1:])) )
    return combined

# Pattern matching ranges and separators.
RANGE_PATTERN = re.compile(r"(?P<value>(\d+)(-\d+)?(:\d+)?)|(?P<sep>,\s*)")
