def chromosome_check(chromosome: str) -> str:
    if "Y" in chromosome:
        return "Congratulations! You're going to have a son."
    else:
        return "Congratulations! You're going to have a daughter."        
