from collections.abc import Iterable

# Checks if the cards are a flush.
# It is a flush if all cards are of the same suit.
# Argument:
#       The cards as strings "valueSuit", e.g. "3S" for 3 of Spades.
# Return:
#       True - if a flush else False.
def is_flush(cards: Iterable[str]) -> bool:
    if len(cards) < 1:
        raise ValueError("Invalid cards")
    suit = cards[0][-1]
    return all( card[-1] == suit for card in cards )
