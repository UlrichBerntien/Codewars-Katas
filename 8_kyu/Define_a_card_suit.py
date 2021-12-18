SUIT = {'C': 'clubs',
        'D': 'diamonds',
        'H': 'hearts',
        'S': 'spades' }

def define_suit(card: str) -> str:
    return SUIT.get(card[-1], card)