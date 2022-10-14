from urllib.parse import urlparse

# Returns the domain name in the url.
# Returns an estimation of the second domain name without subdomain and toplevel domain.
def domain_name(url: str) -> str:
    hostname = urlparse(url).hostname
    if not hostname:
        # Special case: url is not a valid URI, it is only the hostname
        hostname = url
    parts = hostname.split(".") 
    # First part could be the domain name or "www"
    return parts[1] if len(parts) > 1 and parts[0] == "www" else parts[0]
