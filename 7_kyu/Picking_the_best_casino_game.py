from typing import Iterable

# Search game with maximal expected value.
# (Typical also the maximal EV is negative.)
# Returns name of the game.
def find_best_game(games: Iterable[Game]) -> str:
    best = max( games, key=calculate_expected_value )
    return best.name

# Calculat expected value for a game.
# see: https://www.investopedia.com/terms/e/expected-value.asp
def calculate_expected_value(game: Game) -> float:
    return sum(p*v for (p,v) in game.outcomes)
