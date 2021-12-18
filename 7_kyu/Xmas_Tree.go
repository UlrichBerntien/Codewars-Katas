package kata

import "strings"

// generates a drawer function to draw one row
func makeDrawer (height int) func (level int) string {
    // create the material strings only one time
    wood := strings.Repeat( "#", height*2 )
    free := strings.Repeat( "_", height )
    // level must be in range 0..height-1
    return func (level int) string {
        return free[:height-1-level] + wood[:level*2+1] + free[:height-1-level]
    }
}

func XMasTree(height int) []string {
    canvas := make( []string, height+2 )
    drawRow := makeDrawer( height )
    for i := 0; i < height; i++ {
        canvas[i] = drawRow(i)
    }
    // stem has height 2
    canvas[height] = drawRow(0)
    canvas[height+1] = canvas[height]
    return canvas
}
