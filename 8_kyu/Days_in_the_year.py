def year_days(year: int) -> str:
    leap_year = year % 4 == 0 and (year % 400 == 0 or year % 100 != 0)
    days = 366 if leap_year else 365
    return f"{year} has {days} days"