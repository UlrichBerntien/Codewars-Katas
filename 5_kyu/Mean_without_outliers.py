import math
import statistics as stat
import typing as ty

# Returns mean value of the sample.
# Calculate mean value only with samples around cutoff*stdev around the value.
def clean_mean(sample: ty.List[float], cutoff: float) -> float:
    s = sample
    m = stat.mean(s)
    # Limit the maximal number of iterations to prevent oscillations
    for i in range(10*len(sample)):
        limit = cutoff * math.sqrt(stat.pvariance(s,mu=m))
        ll, ul = m-limit, m+limit
        s = [x for x in sample if ll < x < ul]
        old_m = m
        m = stat.mean(s)
        if abs(old_m-m) < 1/100: break
    return round(m,2)
