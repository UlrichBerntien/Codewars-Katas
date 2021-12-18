from typing import Iterable

def solve(arr: Iterable[str]) -> str:
    def to_minutes(s: str) -> int:
        """Converts string 'hh:mm' into minutes."""
        h,m = s.split(':')
        return int(m) + int(h)*60
    def to_string(t: int) -> str:
        """Converts minutes into string 'hh:mm'."""
        h,m = divmod(t,60)
        return f"{h:02}:{m:02}"
    times = [to_minutes(it) for it in arr]
    times.sort()
    times.append(times[0]+24*60)
    max_delta = max( times[i+1]-times[i] for i in range(0,len(times)-1) )
    return to_string(max_delta-1)