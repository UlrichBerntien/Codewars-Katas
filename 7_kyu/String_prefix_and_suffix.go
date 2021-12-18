package kata

// Check two rune slices for equality.
// Return true if content of a and b are equal.
func equal(a,b []rune) bool {
    lenA := len(a)
    // the length must be equal
    if lenA != len(b) { return false }
    // loop over the equal part of the arrays
    it := 0
    for it < lenA && a[it] == b[it] { it++ }
    // true if and only if the whole arrays are equal
    return it == lenA
}

func Solve(s string) int {
    // split UTF-8 string into runes
    arr := []rune(s)
    len := len(arr)
    // only the half string could a prefix or a suffix
    half := len / 2
    // loop until prefix == suffix part found
    it := half
    for it > 0 && ! equal(arr[:it], arr[len-it:]) {
        it--
    }
    return it
}