from collections.abc import Iterable

# Converts match result into points.
# Argument
#   String in format "home:other" with the scores.
# Return
#   Points 0, 1 or 3 reached by the home team.
def match_points(result: str) -> int:
    home, other = result.split(":",3)
    delta = int(home)-int(other)
    if delta == 0:
        return 1 # tie
    elif delta < 0:
        return 0 # loss
    else:
        return 3 # win

# Calculates the point sum of all matches.
# Argument
#   Sequence of match results "home:other"
# Return
#   Sum of all points reached in the matches
def points(games: Iterable[str]) -> int:
	return sum(match_points(match_result) for match_result in games)
