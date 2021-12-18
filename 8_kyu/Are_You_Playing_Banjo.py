def areYouPlayingBanjo(name: str) -> str:
    return name + (" plays banjo" if name.startswith(("R","r")) else " does not play banjo")