from datetime import datetime, date

# Returns nice formated the number of days up to d.
def count_days(d: datetime) -> str:
    delta = d - datetime.now()
    days = delta.days
    if delta.seconds > 60*60*12:
        days += 1
    if days < 0:
        return "The day is in the past!"
    if days == 0:
        return "Today is the day!"
    return f"{days} days"
