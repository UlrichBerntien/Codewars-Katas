package kata

func Parse(data string) []int{
    var value int
    output := make([]int,0)
    for _,command := range data {
        switch command {
        case 'i' :
            value++
        case 'd' :
            value--
        case 's' :
            value *= value
        case 'o' :
            output = append(output,value)
        }
    }
    return output
}