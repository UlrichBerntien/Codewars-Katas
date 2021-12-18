import pandas as pd

def rename_columns(df, names):  
    return pd.DataFrame( df.values, columns=names )