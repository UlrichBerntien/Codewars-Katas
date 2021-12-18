package kata

func GetSize(w,h,d int) [2]int {
    area := ( w*h + h*d + w*d ) * 2
    volume := w*h*d
    return [2]int{ area, volume }
}