def even_last(numbers):
    if not numbers:
        return 0
    return sum(numbers[::2]) * numbers[-1]