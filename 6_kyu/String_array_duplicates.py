from typing import Iterable, List

def dup(arry: Iterable[str]) -> List[str]:
    """Removes direct duplicates in each string in arry."""
    def remove_dup(s: str) -> str:
        """Removes direct duplicates in the string."""
        return ''.join( c for i,c in enumerate(s) if i == 0 or s[i-1] != c )
    return list(map(remove_dup,arry))