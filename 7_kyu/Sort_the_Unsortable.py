def sort_it(lst):
    return sorted(lst,key=arg_or_first)

def arg_or_first(arg) -> int:
    if isinstance(arg,list):
        return arg[0]
    else:
        return arg
