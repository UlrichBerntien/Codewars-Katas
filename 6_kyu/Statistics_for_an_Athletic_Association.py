import statistics


def stat(strg: str) -> str:
    """
    Calculates a statiscs for the runner time results.
    strg -- times in format "h|m|s" separated by comma.
    return -- "Range: hh|mm|ss Average: hh|mm|ss Median: hh|mm|ss"
    """
    if len(strg) == 0:
        # Quick exit: no results -> no statistic
        return strg
    times = parse_results(strg)
    rng = max(times) - min(times)
    average = statistics.mean(times)
    median = statistics.median(times)
    return f"Range: {format_time(rng)} Average: {format_time(average)} Median: {format_time(median)}"


def parse_results(strg: str) -> list[int]:
    """
    Parses string of runners times.
    strg -- Times separated by comma
    return -- List of times in seconds
    """
    return [parse_time(s) for s in strg.split(",")]


def parse_time(s: str) -> int:
    """
    Parses a runners time
    s - runners time format "h|m|s"
    return - time in seconds
    """
    h, m, s = s.split("|", 3)
    return ((int(h) * 60) + int(m)) * 60 + int(s)


def format_time(t: float) -> str:
    """
    Formats a time value as runner time
    t - time in second unit
    return - runner time "hh|mm|ss", seconds truncated to integer value
    """
    s = int(t % 60)
    t /= 60
    m = int(t % 60)
    h = int(t / 60)
    return f"{h:02}|{m:02}|{s:02}"
