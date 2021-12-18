package kata

func WordsToMarks(s string) (sum int) {
    for _,v := range s { sum += int(v) }
    sum -= len(s) * (int('a') - 1)
    return
}