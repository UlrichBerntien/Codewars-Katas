package orderedcount

// Use the preloaded Tuple struct as return type
// type Tuple struct {
//	Char  rune
//	Count int
// }

func OrderedCount(text string) []Tuple {
    // the array to count the chars
    arr := []Tuple {}
    // fast access to the array items via map
    acc := make(map[rune] int)
    for _, char := range text {
        indexP1 := acc[char]
        if indexP1 == 0 {
            arr = append(arr, Tuple{Char: char, Count: 1})
            // index+1 in the map, so value 0 means char is not in the array
            acc[char] = len(arr)
        } else {
            arr[indexP1-1].Count++
        }
    }
    return arr
}