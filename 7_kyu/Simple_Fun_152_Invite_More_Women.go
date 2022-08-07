package kata

func inviteMoreWomen(L []int) bool {
	// Minimal number women needed
	minw := (len(L) + 1) / 2
	for _, it := range L {
		if it < 0 {
			if minw--; minw == 0 {
				// enough women, no need to read the rest of the list
				return false
			}
		}
	}
	// not enough women on the list
	return true
}
