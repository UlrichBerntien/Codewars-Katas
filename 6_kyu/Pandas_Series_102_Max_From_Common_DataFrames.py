import pandas as pd
import numpy as np

def max_common(df_a :pd.DataFrame, df_b :pd.DataFrame) -> pd.DataFrame: 
    """
    Elementwise maximum on the two dataframes.
    """
    return (
        df_a
        .combine(df_b, func=np.maximum, overwrite=False)
        .loc[:,df_a.columns]
        )
