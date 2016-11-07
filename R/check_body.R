
## As we make the client and request definitions more complex, some checks should be done to
## the request body before sending to the API.
## At the moment, just remove any empty element and set the default pageSize

check_body <- function(client, operation, body) {
  ## remove NULLs from the body list (since this may interfere with field defaults)
  if(length(body) > 0) {
    body <- body[sapply(body, function(x) !(is.null(unlist(x))))]
  }
  ## use the client default pageSize if not set
  if(is.null(body$pageSize)) {
    body$pageSize <- client$page_size
  }
  return(body)
}
