import pandas as pd
import numpy as np
from typing import Callable

# Return dataframe filtered.
# Returns only rows where "func" returns false on "col" value.
def filter_dataframe(dataframe: pd.DataFrame, col: str, func: Callable) -> pd.DataFrame: 
    if col not in dataframe.columns:
        raise ValueError(f"Column '{col}' is not present in the DataFrame.")
    return dataframe[np.logical_not(dataframe[col].apply(func))]
