import numpy as np

def avg_array(arrs):
    """
    Reaturns arithmetical mean over the 2D array along first axis.
    """
    return np.mean(np.array(arrs),axis=0)