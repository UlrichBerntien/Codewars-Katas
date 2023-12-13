import datetime

def is_today(dt: datetime.datetime) -> bool:
    """
    Returns true if dt is at the day today.
    """
    return dt.date() == datetime.date.today()
