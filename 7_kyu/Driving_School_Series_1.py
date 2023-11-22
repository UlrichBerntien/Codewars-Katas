import statistics

def passed(lst: list[int]) -> int|str:
    """
    Average value of the error points of all passed student.
    lst    -- List of error points per student.
    return -- Arithmetic mean of the points of all students who have passed.
              Returns an error message if no student has passed. 
    """
    lst_passed = [x for x in lst if x <= 18]
    if lst_passed:
        avg = statistics.mean(lst_passed)
        return int(round(avg))
    else:
        return 'No pass scores registered.'
