def bmi(weight, height):
    index = float(weight)/height/height
    for limit, name in (
    (18.5,"Underweight"),
    (25.0,"Normal"),
    (30.0,"Overweight"),
    (None,"Obese")):
        if not limit or index <= limit:
            return name
