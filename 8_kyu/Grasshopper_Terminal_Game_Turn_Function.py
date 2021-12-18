def do_turn() -> None:
    """Do the turn."""
    roll_dice()
    move()
    combat()
    get_coins()
    buy_health()
    print_status()