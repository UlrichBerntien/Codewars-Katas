package kata

import (
    "strings"
    "strconv"
)


func Points(games []string) int {
    points := 0
    for _,game := range games {
        xy := strings.SplitN( game, ":", 2 )
        x, err := strconv.Atoi(xy[0])
        if err != nil { panic(err) }
        y, err := strconv.Atoi(xy[1])
        if err != nil { panic(err) }
        switch {
          case x > y:
              points += 3
          case x == y:
              points += 1
        }
    }
    return points
}