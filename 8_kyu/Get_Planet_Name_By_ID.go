package kata

var PlanetNames = [...]string{
  "Mercury", "Venus", "Earth",
  "Mars", "Jupiter", "Saturn",
  "Uranus", "Neptune", "Pluto" }

func GetPlanetName(id int) string {
    if id < 1 || id > len(PlanetNames) {
        id = len(PlanetNames) - 1
    } else {
        id = id - 1
    }
    return PlanetNames[id];
}