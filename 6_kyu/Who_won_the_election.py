from collections import Counter
from collections.abc import Iterable

# Returns the absolute majority name in ballots.
# Returns None if no name has absolute majority.
def get_winner(ballots: Iterable[str]) -> str:
    c = Counter(ballots)
    candidate, n = c.most_common(1)[0]
    return candidate if n > c.total()/2 else None