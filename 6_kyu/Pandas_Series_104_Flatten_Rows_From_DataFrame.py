import pandas as pd

def flatten(dataframe: pd.DataFrame, col: str) -> pd.DataFrame:
    """
    Flatts list-like values to rows and re-indexes the dataframe.
    dataframe -- DataFrame to be flatten.
    col -- Name of the column with list-like values to expand.
    Return -- dataframe with new rows: all elements from the lists in col combined with copies of the other items in the row.
    """
    return dataframe.explode(col).reset_index(drop=True)
