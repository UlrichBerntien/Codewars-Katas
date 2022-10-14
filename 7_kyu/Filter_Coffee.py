from collections.abc import Iterable

# Generates ordered list of prices in the budget.
# Returns the list in a string, ordered ascending.
def search(budget: int, prices: Iterable[int]) -> str:
    in_budget = [p for p in prices if p <= budget]
    in_budget.sort()
    return ",".join(str(p) for p in in_budget)
