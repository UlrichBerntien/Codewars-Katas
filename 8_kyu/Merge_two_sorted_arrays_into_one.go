package kata

// Determin the stepping information.
// Tha array must be sorted!
// A loop "for i:=first; i!=last; i+=step" will run upwards to the array.
// Attention: last is the index behind/before the last/first element.
func getStepping(arr []int) (first, last, step int) {
	// Try upward direction
	first, last, step = 0, len(arr), 1
	if last > 0 && arr[first] > arr[last-1] {
		// change to downward direction
		first, last, step = last-1, -1, -1
	}
	return
}

// Merge two sorted arrays into one array.
func MergeArrays(arr1, arr2 []int) []int {
	// Allocate buffer to maximal possible size. May be 2 times to big.
	result := make([]int, 0, len(arr1)+len(arr2))
	// Index values to do upwards to the arrays
	i1, last1, step1 := getStepping(arr1)
	i2, last2, step2 := getStepping(arr2)
	// Merge the content of the input arrays.
	// Break the merge if end of one array is reached.
	for i1 != last1 && i2 != last2 {
		a1, a2, min := arr1[i1], arr2[i2], 0
		if a1 < a2 {
			min = a1
			i1 += step1
		} else {
			min = a2
			i2 += step2
		}
		result = append(result, min)
		// Skip double values
		for i1 != last1 && min == arr1[i1] {
			i1 += step1
		}
		for i2 != last2 && min == arr2[i2] {
			i2 += step2
		}
	}
	// Copy the rest (without doubles) of one of the input arrays.
	for i1 != last1 {
		tmp := arr1[i1]
		result = append(result, tmp)
		i1 += step1
		for i1 != last1 && tmp == arr1[i1] {
			i1 += step1
		}
	}
	for i2 != last2 {
		tmp := arr2[i2]
		result = append(result, tmp)
		i2 += step2
		for i2 != last2 && tmp == arr2[i2] {
			i2 += step2
		}
	}
	return result
}
