package kata

func Well(x []string) string {
	countGoodVotes := 0
	for _, s := range x {
		if s == "good" {
			countGoodVotes++
			if countGoodVotes > 2 {
				break // Quick return
			}
		}
	}
	if countGoodVotes < 1 {
		return "Fail!"
	}
  if countGoodVotes > 2 {
		return "I smell a series!"
	}
  return "Publish!"
}
