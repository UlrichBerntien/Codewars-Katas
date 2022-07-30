# Replaces all items in the list by the mean value.
def redistribute_wealth(wealth: list) -> None:
    if not wealth or len(wealth) < 1:
        # Nothing to do
        return
    mean = sum(wealth)/len(wealth)
    for i in range(len(wealth)):
        wealth[i] = mean