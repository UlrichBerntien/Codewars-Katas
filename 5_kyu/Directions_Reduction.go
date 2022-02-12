package kata

// Use IDs during processing to reduce memory and cpu usage.
type id byte

const (
	south id = 0
	north id = 1
	west  id = 2
	east  id = 3
)

// Oposition of the direction
var oposition = [4]id{north, south, east, west}

// Map string to ID
var string2id = map[string]id{"SOUTH": south, "NORTH": north, "WEST": west, "EAST": east}

// Map ID to string
var id2string = [4]string{"SOUTH", "NORTH", "WEST", "EAST"}

func DirReduc(arr []string) []string {
	// Work on a array of IDs
	buffer := make([]id, 0)
	// Last used entry in the array buffer
	last := -1
	for _, direction := range arr {
		directionId := string2id[direction]
		if last >= 0 && buffer[last] == oposition[directionId] {
			// Current direction reverses the step before
			last--
		} else {
			// Add the current direction to the buffer
			last++
			if last >= len(buffer) {
				buffer = append(buffer, directionId)
			} else {
				buffer[last] = directionId
			}
		}
	}
	// Translate IDs to strings
	result := make([]string, last+1)
	for i, direction := range buffer[:last+1] {
		result[i] = id2string[direction]
	}
	return result
}
