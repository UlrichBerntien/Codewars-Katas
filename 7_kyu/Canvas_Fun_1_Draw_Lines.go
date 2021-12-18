package kata

import (
    "image/color"
)

func DrawLines(points [][]int) string {
  canvas := NewCanvas(100,100)
  canvas.Clear(color.RGBA{255,255,255,255})
  canvas.PenColor=color.RGBA{255,0,0,255}
  
  //don't change code above this line
  
  if len(points) > 0 {
    canvas.MoveTo(points[0][0],points[0][1]) 
    for _,point := range points[1:] {
      canvas.LineTo(point[0],point[1])
    }
  }

  //don't change code below this line
  return canvas.EncodeString()
}