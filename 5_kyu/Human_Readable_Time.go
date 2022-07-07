package kata

import "fmt"

// Format seconds in "hours:minutes:seconds".
func HumanReadableTime(seconds int) string {
  minutes := seconds / 60
  hours := minutes / 60
  seconds %= 60
  minutes %= 60
  return fmt.Sprintf("%02d:%02d:%02d",hours,minutes,seconds)
}
