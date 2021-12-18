from typing import Union

def plural(n: Union[int,float]) -> bool:
    """Returns True if the plural version is needed for number n."""
    return not n == 1