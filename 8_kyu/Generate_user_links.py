import urllib.parse

USER_ROOT_URL = 'http://www.codewars.com/users/'

def generate_link(user: str) -> str:
    return USER_ROOT_URL + urllib.parse.quote(user)
