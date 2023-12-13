import re

def change(s: str, prog: str, version: str) -> str:
    """
    Match and Substituting.
    s -- input data string, format "name: value" pairs separated by newline.
    prog -- Program name
    version -- Version code if version is not "2.0"
    return -- changes data set in string format "name: value" pairs separated by space.
    """
    # scan the data s into a dictionary
    dataset = dict( namevalue(line) for line in s.split("\n") )
    print(dataset)
    if (not "Version" in dataset or
        not VERSION_PATTERN.fullmatch(dataset["Version"]) or
        not "Phone" in dataset or
        not PHONE_PATTERN.fullmatch(dataset["Phone"])):
        return "ERROR: VERSION or PHONE"
    if dataset["Version"] != "2.0":
        dataset["Version"] = version
    return f"Program: {prog} Author: {AUTHOR} Phone: {PHONE} Date: {DATE} Version: {dataset['Version']}"


def namevalue(nv: str) -> tuple[str,str]:
    """
    Splits a "name : value" string into name and value string.
    """
    splits = [s.strip() for s in nv.split(":",2)]
    return splits[0], splits[-1]


# Fixed contens
AUTHOR = "g964"
DATE = "2019-01-01"
PHONE = "+1-503-555-0090"

# Pattern for valid data strings
VERSION_PATTERN = re.compile(r"\d+\.\d+")
PHONE_PATTERN = re.compile(r"\+1-\d{3}-\d{3}-\d{4}")
