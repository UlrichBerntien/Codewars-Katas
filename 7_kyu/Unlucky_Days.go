package kata

import "time"

func UnluckyDays(year int) int {
	unluckyDays := 0
	for m := time.January; m <= time.December; m++ {
		d := time.Date(year, m, 13, 10, 0, 0, 0, time.UTC)
		if d.Weekday() == time.Friday {
			unluckyDays++
		}
	}
	return unluckyDays
}
