package kata

import "strings"

func Scale(s string, k, n int ) string {
    runes := []rune(s)
    var accu strings.Builder
    // index of first rune in current word 
    first := 0
    // index in the current line
    index := 0
    for first < len(runes) {
        // repeat n times each line
        for nr_line := 0; nr_line < n; nr_line++ {
            index = first
            for index < len(runes) && runes[index] != '\n' {
                // repeat k times each rune
                for nr_rune := 0; nr_rune < k; nr_rune++ {
                    accu.WriteRune(runes[index])
                }
                index++
            }
            // separate lines by \n, but not at end of last line
            if index < len(runes) || nr_line+1 < n {
                accu.WriteRune('\n')
                index++
            }
        }
        // set first to start of next line
        first = index
    }
    return accu.String()
}