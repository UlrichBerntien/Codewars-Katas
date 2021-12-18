def period_is_late(last: date, today: date, cycle_length: int) -> bool:
    """Returns True if period is late, else False."""
    return (today - last).days > cycle_length