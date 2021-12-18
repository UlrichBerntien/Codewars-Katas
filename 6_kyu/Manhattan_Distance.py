from math import fabs
from typing import List, Union

def manhattan_distance(pointA: List[Union[int,float]], pointB: List[Union[int,float]]) -> float:
    """"Returns Manhattan Distance of the two points"""
    return fabs(pointA[0]-pointB[0]) + fabs(pointA[1]-pointB[1])
