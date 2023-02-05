# The if function.
# Calls func1 if cond is True else calls func2.
def _if(cond, func1, func2):
    return func1() if cond else func2()