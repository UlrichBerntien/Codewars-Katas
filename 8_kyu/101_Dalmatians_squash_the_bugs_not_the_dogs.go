package kata

func HowManyDalmatians (number int) string {
    dogs := []string {
        "Hardly any",
        "More than a handful!",
        "Woah that's a lot of dogs!",
        "101 DALMATIONS!!!" }
    switch {
        case number <= 10:
            return dogs[0]
        case number <= 50:
            return dogs[1]
        case number == 101:
            return dogs[3]
        default:
            return dogs[2]
    }
}