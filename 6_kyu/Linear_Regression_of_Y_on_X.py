import statistics as stat

def regressionLine(x, y):
    """ Return the intercept and slope of regression line 
        rounded to 4 digits.
    """
    slope, intercept = stat.linear_regression(x,y)
    return round(intercept,4), round(slope,4)
