def hero( bullets :int, dragons :int) -> bool:
    """
    Calculates if hero survies.
    bullests -- number of available bullets
    dragons -- number of dragons to kill with 2 bullets each
    return -- True if the hero survive
    """
    return dragons <= bullets // 2
