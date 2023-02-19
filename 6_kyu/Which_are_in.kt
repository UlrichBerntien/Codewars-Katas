/**
 * Select substrings by occurence in string list.
 *
 * @param subStrings Array of sub strings to check.
 * @param fullString Array of full strings to select the substrings.
 * @return Sorted array of all subStrings which are in a string of fullStrings.
 */
fun inArray(subStrings: Array<String>, fullStrings: Array<String>) =
    subStrings
        .filter { sub -> fullStrings.any { full -> full.contains(sub) } }
        .toSortedSet()
        .toTypedArray()
