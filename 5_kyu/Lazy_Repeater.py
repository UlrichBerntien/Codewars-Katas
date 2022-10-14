from itertools import cycle

# Returns cycle iterator function.
def make_looper(string):
    return cycle(string).__next__
