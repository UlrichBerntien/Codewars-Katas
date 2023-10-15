import typing as typ

def check_dates(records :typ.Iterable[str]) -> list[int,int,int]:
    """
    Checks all records (start, end) and count:
        0 - correct and no other interpretation possibe
        1 - recoverable by fixing one or both dates
        2 - uncertain, several interpretations are possible
    Date format is "year-month-day" with second interpretation option "year-day-month"
    """
    counter = [0,0,0]
    for start_end in records:
        # start_end is a list of start date, end date
        if len(start_end) != 2:
            break
        # Parse the dates with all possible interpretations of the date format
        starts = parse_date(start_end[0])
        ends = parse_date(start_end[1])
        # List all possible durations
        options = [(start,end) for start in starts for end in ends if start != () and end != () and start <= end]
        if len(options) > 1:
            # uncertain, different interpretations are possible
            counter[2] += 1
        elif len(options) == 1:
            if options[0][0] == starts[0] and options[0][1] == ends[0]:
                # correct format of both dates
                counter[0] += 1
            else:
                # date format can be fixed
                counter[1] += 1
    return counter

def parse_date(dt :str) -> list[tuple[int,int,int]]:
    """
    Parses a string "year-month-day" or "year-day-month".
    Returns a list of the two interpretations in tupels (year,month,day,format).
    Returns an empty tuple if interpretation is not a valid date.
    ATTENTION: Day check is sufficient and fast but not perfect: accepts 1..31 for all month.
    """
    interpretations = [(),()]
    if len(dt) != 10 or dt[4] != '-' or dt[7] != '-':
        # invalid date format
        return interpretations
    try:
        year = int(dt[:4])
        month_day = int(dt[5:7])
        day_month = int(dt[8:])
    except ValueError:
        # no decimal numbers
        return interpretations
    if 1 <= month_day <= 12 and 1 <= day_month <= 31:
        # one possible interpretation
        interpretations[0] = (year,month_day,day_month)
    if day_month != month_day and 1 <= day_month <= 12 and 1 <= month_day <= 31:
        # a second, different, possible interpretation
        interpretations[1] = (year,day_month,month_day)
    return interpretations
