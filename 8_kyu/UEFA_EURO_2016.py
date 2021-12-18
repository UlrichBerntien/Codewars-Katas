def uefa_euro_2016(teams, scores):
    if scores[0] == scores[1]:
        return f"At match {teams[0]} - {teams[1]}, teams played draw."
    else:
        winner = teams[int(scores[1] > scores[0])]
        return f"At match {teams[0]} - {teams[1]}, {winner} won!"
