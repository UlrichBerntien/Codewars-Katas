# Tupel of vowels
VOWELS = ('a', 'e', 'i', 'o', 'u')

# Count the number of vwels in order.
def get_the_vowels(word: str) -> int:
    counter = 0
    vowel_index = 0
    for c in word:
        if c == VOWELS[vowel_index]:
            counter += 1
            vowel_index += 1
            if vowel_index == len(VOWELS): vowel_index = 0
    return counter
