package kata

func TwiceAsOld(dadYearsOld, sonYearsOld int) int { 
  // calculate years ago
  delta := 2 * sonYearsOld - dadYearsOld
  if delta < 0 {
    // return years in the future also as positive number
    delta = -delta
  }
  return delta
}