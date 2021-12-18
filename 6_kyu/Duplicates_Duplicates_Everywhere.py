def remove_duplicate_ids(obj):
    known_items = set()
    def is_first(x):
        first=not x in known_items
        known_items.add(x)
        return first
    for k in sorted(obj.keys(),key=int,reverse=True):
        obj[k] = [ x for x in obj[k] if is_first(x) ]
    return obj