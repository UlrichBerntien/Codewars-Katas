# Returns sorted list of tuples from the dictionary
def sort_dict(d):
    l = list(d.items())
    l.sort( key=lambda it: -it[1] )
    return l
