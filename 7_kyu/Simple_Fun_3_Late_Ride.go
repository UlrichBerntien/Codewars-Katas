package kata

func LateRide(totalMinutes int) int {
    hours := totalMinutes / 60
    minutes := totalMinutes % 60
    digitX000 := hours / 10
    digit0X00 := hours % 10
    digit00X0 := ( minutes / 10 ) % 10
    digit000X := minutes % 10
    return digitX000+digit0X00+digit00X0+digit000X
}