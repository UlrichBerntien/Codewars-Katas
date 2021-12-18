package kata

//
// Sketch:
//
// Start with a grid of the options to build a skyscraper on a field.
// The clues reduces the options for skysrapers on a field.
// Start a trial & error backtrack algorithm
// - The rule for one height per row and column could reduces the options on a field.
// - The clue could reduced the options if some fields in the row/column are reduced.
//
// Optimize the runtime by pre-calculated lookup tables.
// Invest in source code size and memory size to reduce runtime.
//
// No multi-core/-thread optimization. Code uses one thread only.
//

import "fmt"

// ----------------------- Constants and Types ----------------------

// Options for a skyscraper.
// One bit as opton for skyscraper.
type skyscraperOptions int8

const (
	rowSize             int               = 6
	colSize             int               = rowSize
	maxClue             int               = rowSize
	gridSize            int               = rowSize * rowSize
	skyscraperOption1   skyscraperOptions = 1
	skyscraperOption2   skyscraperOptions = 2
	skyscraperOption3   skyscraperOptions = 4
	skyscraperOption4   skyscraperOptions = 8
	skyscraperOption5   skyscraperOptions = 16
	skyscraperOption6   skyscraperOptions = 32
	skyscraperOptionAll skyscraperOptions = 1 + 2 + 4 + 8 + 16 + 32
)

// A row of fields with options for skyscrapers.
type skyscraperRow [rowSize]skyscraperOptions

// One dimension array to store all fields of the grid.
// Store row 1, row 2, .. row 4.
type skyscraperGrid [gridSize]skyscraperOptions

// Number of options for skyscrapters on a field.
// Index: options
// Value: Number of options = number of bits.
// The vales were generated before final source code version by function
// printOptions2count.
var options2count = [64]int8{0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5, 2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6}

// The highest option of an option set.
// Index is the combination of options.
// Value is the highest option in the combination.
// The values were generated before final source code version by function
// printHiLoOption
var highestOption = [64]skyscraperOptions{0, 1, 2, 2, 4, 4, 4, 4, 8, 8, 8, 8, 8, 8, 8, 8, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 16, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32, 32}

// The lowest option of an option set.
// Index is the combination of options.
// Value is the lowest option in the combination.
// The values were generated before final source code version by function
// printHiLoOption
var lowestOption = [64]skyscraperOptions{0, 1, 2, 1, 4, 1, 2, 1, 8, 1, 2, 1, 4, 1, 2, 1, 16, 1, 2, 1, 4, 1, 2, 1, 8, 1, 2, 1, 4, 1, 2, 1, 32, 1, 2, 1, 4, 1, 2, 1, 8, 1, 2, 1, 4, 1, 2, 1, 16, 1, 2, 1, 4, 1, 2, 1, 8, 1, 2, 1, 4, 1, 2, 1}

// Map from cell to all other cells in same row and column.
// Index is the index of a cell in the grid.
// Value is an array with index to all cells in the row and the column.
// The vales were generated before final source code version by function
// printCell2neighbors
var cell2neighbors = [36][10]int{
	{1, 2, 3, 4, 5, 6, 12, 18, 24, 30},
	{0, 2, 3, 4, 5, 7, 13, 19, 25, 31},
	{0, 1, 3, 4, 5, 8, 14, 20, 26, 32},
	{0, 1, 2, 4, 5, 9, 15, 21, 27, 33},
	{0, 1, 2, 3, 5, 10, 16, 22, 28, 34},
	{0, 1, 2, 3, 4, 11, 17, 23, 29, 35},
	{7, 8, 9, 10, 11, 0, 12, 18, 24, 30},
	{6, 8, 9, 10, 11, 1, 13, 19, 25, 31},
	{6, 7, 9, 10, 11, 2, 14, 20, 26, 32},
	{6, 7, 8, 10, 11, 3, 15, 21, 27, 33},
	{6, 7, 8, 9, 11, 4, 16, 22, 28, 34},
	{6, 7, 8, 9, 10, 5, 17, 23, 29, 35},
	{13, 14, 15, 16, 17, 0, 6, 18, 24, 30},
	{12, 14, 15, 16, 17, 1, 7, 19, 25, 31},
	{12, 13, 15, 16, 17, 2, 8, 20, 26, 32},
	{12, 13, 14, 16, 17, 3, 9, 21, 27, 33},
	{12, 13, 14, 15, 17, 4, 10, 22, 28, 34},
	{12, 13, 14, 15, 16, 5, 11, 23, 29, 35},
	{19, 20, 21, 22, 23, 0, 6, 12, 24, 30},
	{18, 20, 21, 22, 23, 1, 7, 13, 25, 31},
	{18, 19, 21, 22, 23, 2, 8, 14, 26, 32},
	{18, 19, 20, 22, 23, 3, 9, 15, 27, 33},
	{18, 19, 20, 21, 23, 4, 10, 16, 28, 34},
	{18, 19, 20, 21, 22, 5, 11, 17, 29, 35},
	{25, 26, 27, 28, 29, 0, 6, 12, 18, 30},
	{24, 26, 27, 28, 29, 1, 7, 13, 19, 31},
	{24, 25, 27, 28, 29, 2, 8, 14, 20, 32},
	{24, 25, 26, 28, 29, 3, 9, 15, 21, 33},
	{24, 25, 26, 27, 29, 4, 10, 16, 22, 34},
	{24, 25, 26, 27, 28, 5, 11, 17, 23, 35},
	{31, 32, 33, 34, 35, 0, 6, 12, 18, 24},
	{30, 32, 33, 34, 35, 1, 7, 13, 19, 25},
	{30, 31, 33, 34, 35, 2, 8, 14, 20, 26},
	{30, 31, 32, 34, 35, 3, 9, 15, 21, 27},
	{30, 31, 32, 33, 35, 4, 10, 16, 22, 28},
	{30, 31, 32, 33, 34, 5, 11, 17, 23, 29}}

// Options for a given clue
// The vales were generated before final source code version by function
// printClue2row
var clue2row = [7]skyscraperRow{
	{63, 63, 63, 63, 63, 63},
	{32, 31, 31, 31, 31, 31},
	{31, 47, 63, 63, 63, 63},
	{15, 31, 63, 63, 63, 63},
	{7, 15, 31, 63, 63, 63},
	{3, 7, 15, 31, 63, 63},
	{1, 2, 4, 8, 16, 32}}

// Information to use the clue
type clueInfo struct {
	offset    int // Offset in skyscraperGrid
	increment int // increment in the grid
}

// Start index and index increment of the clues.
// Index in the clue array is the index in this table.
// Value is the start index and index increment in the skyscraperGrid.
// The vales were generated before final source code version by function
// printClueIndex2info
var clueIndex2info = [24]clueInfo{
	{offset: 0, increment: 6},
	{offset: 1, increment: 6},
	{offset: 2, increment: 6},
	{offset: 3, increment: 6},
	{offset: 4, increment: 6},
	{offset: 5, increment: 6},
	{offset: 5, increment: -1},
	{offset: 11, increment: -1},
	{offset: 17, increment: -1},
	{offset: 23, increment: -1},
	{offset: 29, increment: -1},
	{offset: 35, increment: -1},
	{offset: 35, increment: -6},
	{offset: 34, increment: -6},
	{offset: 33, increment: -6},
	{offset: 32, increment: -6},
	{offset: 31, increment: -6},
	{offset: 30, increment: -6},
	{offset: 30, increment: 1},
	{offset: 24, increment: 1},
	{offset: 18, increment: 1},
	{offset: 12, increment: 1},
	{offset: 6, increment: 1},
	{offset: 0, increment: 1}}

// Status of the grid during the trial & error backtrack algorithm.
type gridStatus int8

const (
	statusSolvable gridStatus = iota
	statusSolved   gridStatus = iota
	statusFaulty   gridStatus = iota
)

// ----------------------- Source code generators -------------------

// Number of 1 bits.
// Only for not-negative numbers.
func ones(x int) int {
	var counter int = 0
	for x > 0 {
		counter += x & 1
		x >>= 1
	}
	return counter
}

// Generate and print the table options to option-count.
// Output is used to initize options2count.
func printOptions2count() {
	var options2count [skyscraperOptionAll + 1]int8
	for i := range options2count {
		// Each option is a 1 bit
		options2count[i] = int8(ones(i))
	}
	fmt.Printf("options2count = %#v\n", options2count)
}

// Generate and print the tables highestOption and lowestOption.
// Generate table of highest skyscraper in an option set and
// table of lowest skyscraper in an option set.
func printHiLoOption() {
	var highestOption [skyscraperOptionAll + 1]skyscraperOptions
	var lowestOption [skyscraperOptionAll + 1]skyscraperOptions
	h := skyscraperOption1
	for optionSet := skyscraperOption1; optionSet <= skyscraperOptionAll; optionSet++ {
		l := skyscraperOptionAll
		for opt := skyscraperOption1; opt < skyscraperOptionAll; opt <<= 1 {
			if opt&optionSet > 0 {
				if h < opt {
					h = opt
				}
				if l > opt {
					l = opt
				}
			}
		}
		highestOption[optionSet] = h
		lowestOption[optionSet] = l
	}
	fmt.Printf("highestOption = %#v\n", highestOption)
	fmt.Printf("lowestOption = %#v\n", lowestOption)
}

// Calculate the clue of a row.
// The clue value is the number of visible skyscrapers in the row.
func clue(row skyscraperRow) int8 {
	var sum int8 = 0
	var max skyscraperOptions = 0
	for _, v := range row {
		if v > max {
			sum++
			max = v
		}
	}
	return sum
}

// Generate and print the table clue to skyscraper options row.
// A most clue values can be realized by several skyscraper rows.
// The function calculates the options for skyscraper in the cells
// for each clue value.
// Output is used to initize clue2row.
func printClue2row() {
	var clue2row [maxClue + 1]skyscraperRow
	// Generate all permutations and calculate the clue for each
	// possible row of skyscrapers.
	var row skyscraperRow
	for i := range row {
		row[i] = 1 << uint(i)
	}
	var permutate func(dst int)
	permutate = func(dst int) {
		if dst > rowSize {
			// row is one permutation.
			// Calculates the clue value for this permutation.
			c := clue(row)
			// include the permutation in the table
			for index := 0; index < rowSize; index++ {
				clue2row[c][index] |= row[index]
			}
			return
		}
		permutate(dst + 1)
		for src := dst + 1; src < rowSize; src++ {
			row[dst], row[src] = row[src], row[dst]
			permutate(dst + 1)
			row[dst], row[src] = row[src], row[dst]
		}
	}
	permutate(0)
	// Special case: clue 0 gives no information.
	// All skyscrapers in each cell is possible.
	for i := 0; i < rowSize; i++ {
		clue2row[0][i] = skyscraperOptionAll
	}
	fmt.Printf("clue2row = %#v\n", clue2row)
}

// Generate and print the table from clue index to clue info struct.
// The clue info contains the info needed to use the clue value.
// The info struct contains the index of the first cell in the grid
// and the increment to the next index.
func printClueIndex2info() {
	var clueIndex2info [2*rowSize + 2*colSize]clueInfo
	dst := 0
	gridIndex := 0
	// The clue values are given around the grid.
	// 1) row above the grid
	for i := 0; i < rowSize; i++ {
		clueIndex2info[dst].offset = gridIndex
		gridIndex++
		clueIndex2info[dst].increment = +rowSize
		dst++
	}
	// 2) column right of the grid
	// Same first field in the grid
	gridIndex--
	for i := 0; i < colSize; i++ {
		clueIndex2info[dst].offset = gridIndex
		gridIndex += rowSize
		clueIndex2info[dst].increment = -1
		dst++
	}
	// 3) row below the grid
	// Same first field in the grid
	gridIndex -= rowSize
	for i := 0; i < rowSize; i++ {
		clueIndex2info[dst].offset = gridIndex
		gridIndex--
		clueIndex2info[dst].increment = -rowSize
		dst++
	}
	// 4) column left of the grind
	// Same first field in the grid
	gridIndex++
	for i := 0; i < colSize; i++ {
		clueIndex2info[dst].offset = gridIndex
		gridIndex -= rowSize
		clueIndex2info[dst].increment = +1
		dst++
	}
	fmt.Printf("clueIndex2info = %#v\n", clueIndex2info)
}

// Generate the map neighbors.
// The index in the array is a grid array.
// The value is an array of index values in the grid.
// This allows fast scanning of all cells in the same row and column.
func printCell2neighbors() {
	var cell2neighbors [gridSize][rowSize + colSize - 2]int
	for gridIndex := range cell2neighbors {
		row := gridIndex / rowSize
		col := gridIndex % rowSize
		neighbors := &cell2neighbors[gridIndex]
		neighborsIndex := 0
		for r := 0; r < rowSize; r++ {
			g := r + row*rowSize
			if g != gridIndex {
				neighbors[neighborsIndex] = g
				neighborsIndex++
			}
		}
		for c := 0; c < colSize; c++ {
			g := col + c*rowSize
			if g != gridIndex {
				neighbors[neighborsIndex] = g
				neighborsIndex++
			}
		}
	}
	fmt.Printf("cell2neighbors = %#v\n", cell2neighbors)
}

// Calculate and print the constances used by the algorithm.
// The constant arrays are calculated before compile and runtime,
// therefore the time is not part of the runtime of the solution.
func printSourceCodeConstants() {
	printOptions2count()
	printHiLoOption()
	printCell2neighbors()
	printClue2row()
	printClueIndex2info()
}

// ----------------------- Format converter -------------------------

// Convert a single option to the selected height.
func option2height(option skyscraperOptions) int {
	switch option {
	case skyscraperOption1:
		return 1
	case skyscraperOption2:
		return 2
	case skyscraperOption3:
		return 3
	case skyscraperOption4:
		return 4
	case skyscraperOption5:
		return 5
	case skyscraperOption6:
		return 6
	default:
		// error case
		return -1
	}
}

// Generate the solution array out of a solved grid.
func solvedGrid2solution(grid *skyscraperGrid) [][]int {
	solution := make([][]int, colSize)
	for i := range solution {
		solution[i] = make([]int, rowSize)
	}
	for i, opt := range grid {
		solution[i/rowSize][i%rowSize] = option2height(opt)
	}
	return solution
}

// ----------------------- Puzzle solver ----------------------------

// Calculates the options for the skyscraper heights based on the clues.
func calculateOptions(clues []int) skyscraperGrid {
	// init the grid with all skyscraper heights possible on each cell.
	var grid skyscraperGrid
	for i := range grid {
		grid[i] = skyscraperOptionAll
	}
	// reduce the options according to each clue
	for clueIndex, clue := range clues {
		gridIndex := clueIndex2info[clueIndex].offset
		gridIncrement := clueIndex2info[clueIndex].increment
		for _, opt := range clue2row[clue] {
			grid[gridIndex] &= opt
			gridIndex += gridIncrement
		}
	}
	return grid
}

// Reduce the options by the rules.
func reduceOptions(grid *skyscraperGrid) {
	createdNewOneOption := true
	for createdNewOneOption {
		createdNewOneOption = false
		// Only one skyscraper height per row and column.
		// -> If a skyscraper with height H is the only option for one field,
		// than no other H skyscraper is allowed in the row and column.
		for index, opt := range grid {
			if options2count[opt] == 1 {
				noOpt := ^opt
				for _, neighbor := range cell2neighbors[index] {
					old := grid[neighbor]
					new := old & noOpt
					grid[neighbor] = new
					if new == 0 {
						// no solution is possible, dead end of the search
						return
					}
					if new != old && options2count[new] == 1 {
						createdNewOneOption = true
					}
				}
			}
		}
	}
	// Other reductions are possible but the reduction needs
	// more time than the reduction reduce in the other steps.
}

// Reduce the options by the rules after setting one skyscrapper.
// Returns true if an option is reduced to one skyscrapper.
// On a true return more reduce steps could be usefull.
func reduceOptionsAfterTrial(grid *skyscraperGrid, index int) bool {
	createdNewOneOption := false
	noOpt := ^grid[index]
	for _, neighbor := range cell2neighbors[index] {
		old := grid[neighbor]
		new := old & noOpt
		grid[neighbor] = new
		if new != old && options2count[new] == 1 {
			createdNewOneOption = true
		}
	}
	return createdNewOneOption
}

// Calculate the minimal and maximal possible clue value.
func clueRange(grid *skyscraperGrid, info clueInfo) (minClue, maxClue int) {
	var lowestMark skyscraperOptions = 0
	var highestMark skyscraperOptions = 0
	gridIndex := info.offset
	for i := 0; i < rowSize; i++ {
		opt := grid[gridIndex]
		highestNow := highestOption[opt]
		lowestNow := lowestOption[opt]
		if lowestNow > highestMark {
			minClue++
		}
		if highestNow > lowestMark {
			maxClue++
		}
		// Update the markers of lowest and highest skyscraper so far
		if lowestNow > lowestMark {
			lowestMark = lowestNow
		}
		if highestNow > highestMark {
			highestMark = highestNow
		}
		// to next grid cell in the row
		gridIndex += info.increment
	}
	return
}

// Determin the status of the grid.
func checkStatus(grid *skyscraperGrid, clues []int) gridStatus {
	// check if at least one option is possible in any cell
	for _, opt := range grid {
		if opt == 0 {
			// A cell with no option for a skyscraper:
			// it is a grid in a dead end of the search tree
			return statusFaulty
		}
	}
	// check if all clues could be fullfild with the options
	for clueIndex, clue := range clues {
		if clue > 0 {
			// Check only the "real" clues with a value > 0.
			// Clue value == 0 means, no clue is given in this view direction
			minClue, maxClue := clueRange(grid, clueIndex2info[clueIndex])
			if clue < minClue || maxClue < clue {
				// the options are inconsistent to the clue -> faulty
				return statusFaulty
			}
		}
	}
	// Summary after the two checks:
	// the grid is consistent to all rules and to all clues.
	// Check if all cells have exact one option.
	for _, opt := range grid {
		if options2count[opt] != 1 {
			// More than 1 option for this field.
			// -> go deeper in the search tree.
			return statusSolvable
		}
	}
	// Results:
	// 	All clues are fullfild.
	//	Exact 1 option in all grid cells
	// Hence the puzzle is solved.
	return statusSolved
}

// Determin index of the field best for the trial step.
// Criterion: number of options small as possible (but above 1).
func bestTrialField(grid *skyscraperGrid) int {
	// any cell has a value below this initial value
	minValue := options2count[skyscraperOptionAll] + 1
	minIndex := -1
	for i, opt := range grid {
		c := options2count[opt]
		if 1 < c && c < minValue {
			minValue = c
			minIndex = i
		}
	}
	if minIndex < 0 {
		// Runs in this case if the program is buggy.
		panic("no trial grid cell found")
	}
	return minIndex
}

// Try to find a solution by placing a skyscrapper.
// The index of the last skyscraper set is trialIndex.
// If no skyscrapper was set pass -1
// Returns nil if no solution is possible.
func trial(grid skyscraperGrid, clues []int, trialIndex int) *skyscraperGrid {
	if trialIndex >= 0 && reduceOptionsAfterTrial(&grid, trialIndex) {
		reduceOptions(&grid)
	}
	switch checkStatus(&grid, clues) {
	case statusSolved:
		return &grid
	case statusFaulty:
		return nil
	case statusSolvable:
		index := bestTrialField(&grid)
		currentOptions := grid[index]
		for opt := skyscraperOption1; opt < skyscraperOptionAll; opt <<= 1 {
			if opt&currentOptions != 0 {
				grid[index] = opt
				solution := trial(grid, clues, index)
				if solution != nil {
					return solution
				}
			}
		}
		return nil
	}
	panic("invalid status code")
	return nil
}

func SolvePuzzle(clues []int) [][]int {
	if len(clues) != 4*rowSize {
		panic("clues array size invalid")
	}
	grid := calculateOptions(clues)
	reduceOptions(&grid)
	solution := trial(grid, clues, -1)
	if solution == nil {
		panic("no solution found")
	}
	return solvedGrid2solution(solution)
}
