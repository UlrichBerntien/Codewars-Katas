import statistics

def find_average(numbers):
    if numbers and len(numbers) > 0:
        return statistics.mean(numbers)
    else:
        return 0
