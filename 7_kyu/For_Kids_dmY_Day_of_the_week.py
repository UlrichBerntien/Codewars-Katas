from datetime import date

# Returns day of the week for the given date.
# Date format is "day/month/year", each item as decimal number.
# The returned week day is in the local language.
def day_of_week(date_string: str) -> str:
    try:
        day,month,year = [int(it) for it in date_string.split("/")]
        if not( 1 <= day <= 31 and 1 <= month <= 12 and 1 < year < 9999 ):
               raise ValueError
    except ValueError:
        return "invalid date format, " + date_string
    return date(year,month,day).strftime("%A")
