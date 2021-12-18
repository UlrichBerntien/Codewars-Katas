import re
from collections import Counter
from typing import List

# Regex matches a word "letters plus one or more apostrophes"
# A least one letter in the word.
WORD_REGEX = re.compile(r"'*[A-Za-z][A-Za-z']*")

def top_3_words(text: str) -> List[str]:
    counts = Counter(it.group(0).lower() for it in WORD_REGEX.finditer(text))
    return [it[0] for it in counts.most_common(3)]
