package kata
import "strconv"

func BonusTime(salary int, bonus bool) string {
    if bonus { salary *= 10 }
    return "£" + strconv.Itoa(salary)
}