# Searchs the maximmum in all ratings.
def triple_crown(receivers):
    # Search in the list of names
    names = list(receivers.keys())
    # The ratings for each name
    ratings = list(receivers[names[0]].keys())
    # Split the names into best of first rating and the other names
    best = max(names,key=lambda name: receivers[name][ratings[0]])
    names.remove(best)
    # Check that the best is the only best in each rating
    for r in ratings:
        best_value = receivers[best][r]
        for n in names:
            if receivers[n][r] >= best_value:
                return "None of them"
    return best
