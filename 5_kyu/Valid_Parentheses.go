package kata

func ValidParentheses(parens string) bool {
    var open = 0
    for _,c := range parens {
        switch c {
            case '(' :
                open++
            case ')' :
                open--
                if open < 0 { return false }
            default:
                return false
        }
    }
    return open == 0
}