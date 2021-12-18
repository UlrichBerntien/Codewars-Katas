package kata

func GetGrade(a,b,c int) rune {
    mean := (a+b+c)/3
    switch {
    case mean >= 90:
        return 'A'
    case mean >= 80:
        return 'B'
    case mean >= 70:
        return 'C'
    case mean >= 60:
        return 'D'
    default:
        return 'F'
    }
}