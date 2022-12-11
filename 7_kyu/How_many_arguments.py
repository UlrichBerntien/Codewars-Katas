# Returns count of passed arguments.
def args_count(*args,**kwargs) -> int:
    return len(args) + len(kwargs)
