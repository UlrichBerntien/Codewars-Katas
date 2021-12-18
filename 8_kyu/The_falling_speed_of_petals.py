from typing import Union

def sakura_fall(v: Union[int,float]) -> float:
    """Returns the time [s] for 400cm at speed v [cm/s]."""
    DISTANCE = 400 # cm
    return DISTANCE/float(v) if v > 0 else 0