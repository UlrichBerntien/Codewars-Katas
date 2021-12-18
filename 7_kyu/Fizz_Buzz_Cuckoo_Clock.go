package kata
import (
    "strings"
    "strconv"
    )

func FizzBuzzCuckooClock(time string) string {
    hourMinute := strings.Split(time,":")
    if len(hourMinute) != 2 { panic("invalid time format") }
    minute, err := strconv.Atoi(hourMinute[1])
    if err != nil { panic(err) }
    switch {
    case minute == 0:
        hour, err := strconv.Atoi(hourMinute[0])
        if err != nil { panic(err) }
        return strings.Repeat("Cuckoo ",(hour+11) % 12) + "Cuckoo"
    case minute == 30:
        return "Cuckoo"
    case minute % 15 == 0:
        return "Fizz Buzz"
    case minute % 5 == 0:
        return "Buzz"
    case minute % 3 == 0:
        return "Fizz"
    default:
        return "tick"
    }
}
