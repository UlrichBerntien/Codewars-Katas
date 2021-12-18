package kata

func value(str string) (sum int) {
    for _,v := range str {
        if v != ' ' { sum += int(v) - 'a' + 1 }
    }
    return
}

func NameValue(my_list []string) []int {
    values := make([]int, len(my_list))
    for i,v := range my_list { values[i] = (i + 1) * value(v) }
    return values
}