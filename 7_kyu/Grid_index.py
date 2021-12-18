from typing import List

def grid_index(grid: List[List[int]], indexes: List[int]) -> str:
    n = len(grid)
    def index2char(index: int) -> str:
        row,col = divmod(index-1,n)
        return grid[row][col]
    return ''.join(map(index2char,indexes))
