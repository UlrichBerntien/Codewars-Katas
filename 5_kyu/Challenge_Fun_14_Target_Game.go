package kata

// Returns maximum of a and b.
func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

// Maximum number of points you can win in the target game.
// You can get maximal every second value
func TargetGame(values []int) int {
	// The maximum number of points possible if loaded or unloaded
	// (so far calculated)
	loaded := 0
	unloaded := 0
	// Calculate step by step with the knowlege of the end
	for i := len(values) - 1; i >= 0; i-- {
		// Never take a negative value
		a := max(0, values[i])
		// if unloaded: load and take the best of the rest
		// if loaded: take current and rest with unloaded OR take rest loaded
		unloaded, loaded = max(unloaded, loaded), max(a+unloaded, loaded)
	}
	return max(loaded, unloaded)
}
