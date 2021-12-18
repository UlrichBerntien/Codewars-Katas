function towerBuilder(nFloors)
    wide = nFloors*2-1
    stars = string.rep("*",wide)
    spaces = string.rep(" ",wide)
    tower = {}
    for level = 1,nFloors do
        center = level*2-1
        side = (wide-center)//2
        table.insert(tower, string.sub(spaces,1,side) .. string.sub(stars,1,center) .. string.sub(spaces,1,side) )
    end
    return tower
end