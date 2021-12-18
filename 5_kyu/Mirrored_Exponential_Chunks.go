package kata

func MirroredExponentialChunks(arr []int) [][]int {
	if len(arr) < 1 {
		// error exit
		return [][]int{}
	}
	// odd array: 1 root array length 1
	// even array: 2 root arrays length 2
	nRoot := 2 - len(arr)&1
	// calculate maximum number element n of the chunks
	// calculate number of chunks lenChunk
	lenChunk := nRoot
	nMax := nRoot
	rest := len(arr) - nRoot*nRoot
	for rest > 0 {
		nMax <<= 1
		lenChunk += 2
		rest -= 2 * nMax
	}
	// get first half of the chunks
	chunk := make([][]int, lenChunk)
	lastChunk := lenChunk - 1
	chunk[0] = arr[:nMax+rest/2]
	n := nMax
	start := nMax + rest/2
	index := 1
	for n > nRoot {
		n >>= 1
		chunk[index] = arr[start : start+n]
		start += n
		index++
	}
	// get second half of the chunks
	n = 1
	for index < lastChunk {
		n <<= 1
		chunk[index] = arr[start : start+n]
		start += n
		index++
	}
	chunk[lastChunk] = arr[start:]
	return chunk
}