package kata
import( "strings"; "strconv" )

func countSheep(num int) string {
    var accu strings.Builder
    for i := 1; i <= num; i++ {
        accu.WriteString( strconv.Itoa(i) )
        accu.WriteString( " sheep..." )
    }
    return accu.String()
}