fn lovefunc(flower1: u16, flower2: u16) -> bool {
    (flower1 ^ flower2) & 1 > 0
}