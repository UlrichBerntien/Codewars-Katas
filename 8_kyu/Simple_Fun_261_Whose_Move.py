def whose_move(last_player :str, win :bool) -> str:
    return "white" if (last_player == "white") == win else "black"
