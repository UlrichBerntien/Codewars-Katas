return {
  -- Removes all after "#" in the string.
  removeUrlAnchor = function(s)
    return s:match("[^#]*")
  end
}