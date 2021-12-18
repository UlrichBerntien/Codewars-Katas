# game item names
ROCK = "rock"
PAPER = "paper"
SCISSOR = "scissors"

# winner combinations
WINNERS = ((SCISSOR,PAPER), (PAPER,ROCK), (ROCK,SCISSOR))

def rps(p1: str, p2: str) -> str:
    if p1 == p2:
        return "Draw!"
    elif (p1,p2) in WINNERS:
        return "Player 1 won!"
    else:
        return "Player 2 won!"
