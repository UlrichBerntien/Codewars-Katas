from datetime import date

def unlucky_days(year: int) -> int:
    return [date(year,month,13).weekday() for month in range(1,13)].count(4)
