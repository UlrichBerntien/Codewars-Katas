def leaderboard_sort(leaderboard, changes):
    for c in changes:
        name, steps = c.split()
        steps = int(steps)
        now_index = leaderboard.index(name)
        leaderboard.pop(now_index)
        leaderboard.insert(now_index - steps, name)
    return leaderboard