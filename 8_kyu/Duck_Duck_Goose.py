def duck_duck_goose(players: list, goose: int) -> str:
    return players[(goose-1)%len(players)].name
