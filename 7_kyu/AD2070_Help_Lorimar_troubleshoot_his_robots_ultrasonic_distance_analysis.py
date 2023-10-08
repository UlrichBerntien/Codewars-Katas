import itertools
import statistics

def sensor_analysis(sensor_data):
    """
    Calculates the mean and standard deviation of all floats found in the sensor data.
    Returns tuple mean, std rounded to 4 digits.
    """
    all = [x for x in itertools.chain.from_iterable(sensor_data) if isinstance(x,float)]
    m = statistics.mean(all)
    std = statistics.stdev(all,m)
    return round(m,4), round(std,4)
