# Processes the input data s as defined.
# Returns the result as a single string in defined format.
change <- function(s, prog, version) {
  # Data record with default values and defined values.
  # Order of the items is the order in the result string.
  record <- c(Program = prog,
             Author = "g964",
             Phone = "+1-503-555-0090",
             Date = "2019-01-01",
             Version = version)
  if( !check_phone_in(s) ) {
    return("ERROR: VERSION or PHONE")
  }
  if( check_version_in(s) ) {
    if( is_version_in(s,"2.0") ) record$Version <- "2.0"
  } else {
    return("ERROR: VERSION or PHONE")
  }
  format_out(record)
}

# Format the data record into a string.
format_out <- function(record) paste(names(record),record,sep=": ",collapse=" ")

# Checks the phone number in the string s.
# Returns True if a phone number in valid format is in the string.
check_phone_in <- function(s) all( grepl("Phone:\\s+\\+1-\\d{3}-\\d{3}-\\d{4}\\s*\\n",s) )

# Checks the version number in the string s.
# Returns True if a version number in valid format is in the string.
check_version_in <- function(s) all( grepl("Version:\\s+\\d+\\.\\d+\\s*\\n",s) )

# Checks if the given version v is in the string s.
is_version_in <- function(s,v) all( grepl(paste0("Version: ",v,"\\n"),s) )
