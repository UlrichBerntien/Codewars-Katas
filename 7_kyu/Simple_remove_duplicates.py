def solve(arr): 
    known = set()
    def is_new(x): new = x not in known; known.add(x); return new
    lst = [x for x in reversed(arr) if is_new(x)]
    lst.reverse()
    return lst