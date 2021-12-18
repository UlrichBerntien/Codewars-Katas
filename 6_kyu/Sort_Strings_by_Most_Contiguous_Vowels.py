from typing import Iterable

# All vowels
VOWELS = "aeiouAEIOU"

def len_contiguous_vowels(text: str) -> int:
    """
    Length of the longest contiguous substring of vowels.
    """
    max_length = 0
    segment_length = 0
    for c in text:
        if c in VOWELS:
            segment_length += 1
            if max_length < segment_length:
                max_length = segment_length
        else:
            segment_length = 0
    return max_length

def sort_strings_by_vowels(seq: Iterable[str]) -> Iterable[str]: 
    """
    Return sorted by length of the longest contiguous substring of vowels.
    Stable sort, descending order.
    """
    return sorted(seq, key=len_contiguous_vowels, reverse=True)
