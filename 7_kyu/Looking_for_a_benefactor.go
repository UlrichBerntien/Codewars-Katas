package kata

func NewAvg(arr []float64, navg float64) int64 {
    var delta float64
    for _,v := range arr { delta += navg - v }
    delta += navg
    if delta < 0 {
        return -1
     } else {
         return int64(delta+0.5)
     }
}