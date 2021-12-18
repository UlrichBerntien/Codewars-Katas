package kata

func IntervalInsert(r [][2]int, z [2]int) [][2]int {
	result := make([][2]int, 0, len(r)+1)
	toInsert := z
	isInserted := false
	for _, old := range r {
		switch {
		case old[0] <= toInsert[0] && old[1] >= toInsert[1]:
			// the new is a sub interval
			toInsert = old
		case old[0] <= toInsert[0] && toInsert[0] <= old[1]:
			// junction exists: fuse the old interval and the new one
			toInsert[0] = old[0]
		case old[0] <= toInsert[1] && toInsert[1] <= old[1]:
			// junction exists: fuse the old interval and the new one
			toInsert[1] = old[1]
		case old[0] >= toInsert[0] && old[1] <= toInsert[1]:
			// the old is a sub interval
		default:
			if !isInserted && old[0] > toInsert[0] {
				// position of the new interval is before this old one
				result = append(result, toInsert)
				isInserted = true
			}
			result = append(result, old)
		}
	}
	if !isInserted {
		// new interval is the last interval in the list
		result = append(result, toInsert)
	}
	return result
}
