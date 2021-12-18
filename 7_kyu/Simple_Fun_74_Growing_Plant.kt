fun growingPlant(upSpeed: Int, downSpeed: Int, desiredHeight: Int): Int {
  val effSpeed = upSpeed - downSpeed
  // function does not handle: plant never reach desired height
  return Math.max(desiredHeight-upSpeed+effSpeed-1,0)/effSpeed + 1
}