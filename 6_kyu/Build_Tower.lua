function towerBuilder(nFloors)
    local wide = nFloors*2-1
    local stars = ("*"):rep(wide)
    local spaces = (" "):rep(wide)
    local tower = {}
    for level = 1,nFloors do
        local center = level*2-1
        local side = (wide-center)//2
        tower[level] = spaces:sub(1,side) .. stars:sub(1,center) .. spaces:sub(1,side)
    end
    return tower
end