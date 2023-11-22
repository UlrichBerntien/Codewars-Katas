def well(x: list[str]) -> str:
    """
    Searches string "good" in the list x.
    Returns a funny message if none, 1-2, or more than 2 were found.
    """
    # Search only the first 3 hits, no need to search the entire list.
    id = [-1,-1,-1]
    try:
        for i in range(3):
            id[i] = x.index("good",id[i-1]+1)
    except ValueError:
        pass
    if id[2] >= 0:
        return "I smell a series!"
    if id[0] >= 0:
        return "Publish!"
    return "Fail!"
