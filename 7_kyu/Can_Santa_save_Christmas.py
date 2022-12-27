from collections.abc import Iterable

# Determines sum of all durations is less or equal 24 hours.
# Argument:
#      arr - iterable of string, time duration in format "hh:mm:ss"
# Return:
#      True if sum of durations is less or equal 24 hours.
def determine_time(arr: Iterable[str]) -> bool:
    sum = [0,0,0]
    for duration in arr:
        splitts = duration.split(":")
        if len(splitts) == 3:
            for i,s in enumerate(splitts):
                sum[i] += int(s)
    seconds = (sum[0]*60+sum[1])*60+sum[2]
    return seconds <= 24*60*60
