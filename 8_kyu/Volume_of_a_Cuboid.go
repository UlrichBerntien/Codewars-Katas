package kata


// Volume of a cuboid.
func GetVolumeOfCuboid(length, width, height float64) float64 {
  if length < 0 || width < 0 || height < 0 {
    panic("a negative edge length")
  }
  return length * width * height
}