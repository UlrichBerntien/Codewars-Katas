package kata


// An indexer converts the group number and the index number
// into an x,y coordinate in the array.
type indexerType func(group,index int) (int,int)


func validate(m [][]int, indexer indexerType) bool {
    // check all groups (= row, column or cell)
    for group := 0; group < 9; group++ {
        // count the digits in the group
        var digits [10]int
        for index := 0; index < 9; index++ {
            x,y := indexer(group,index)
            digits[m[x][y]]++
        }
        // the count of each digit must be 1
        for index := 1; index < 10; index++ {
            if digits[index] != 1 {
                return false
            }
        }
    }
    // No check failed, all groups are ok.
    return true 
}


func rowIndexer(group,index int) (int,int) {
    return group,index
}


func columnIndexer(group,index int) (int,int) {
    return index,group
}


func cellIndexer(group,index int) (int,int) {
    return 3*(group/3) + index/3, 3*(group%3) + index%3
}


func ValidateSolution(m [][]int) bool {
    return validate(m,rowIndexer) &&
           validate(m,columnIndexer) &&
           validate(m,cellIndexer)
}
