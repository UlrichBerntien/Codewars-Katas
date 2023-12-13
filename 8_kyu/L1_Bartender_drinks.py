def get_drink_by_profession(role: str) -> str:
    return ROLE_DRINK_TABLE.get(role.lower(), "Beer")
    
ROLE_DRINK_TABLE = {
    "jabroni" : "Patron Tequila",
    "school counselor" : "Anything with Alcohol",
    "programmer" : "Hipster Craft Beer",
    "bike gang member" : "Moonshine",
    "politician" : "Your tax dollars",
    "rapper" : "Cristal" }
