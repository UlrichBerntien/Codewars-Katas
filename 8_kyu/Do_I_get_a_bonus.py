def bonus_time(salary: float, bonus: bool) -> float:
    """
    Calculates the total salary.
    Salary -- normal salary without bonus.
    bonus -- if True, the salary is multiplied by 10. 
    return -- Total salary in string format preceded by "$".
    """
    return f"${salary * 10 if bonus else salary}"
