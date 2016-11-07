
#' @title Search
#' @name search_ga4gh
#' @description Search the GA4GH API
#' @param object An object to POST to. I.e. A ga4ghClient object, a url for the server or a list of either.
#' @param operation The name of an operation. Eg "variantsets"
#' @param port The port number
#' @param ... Named fields for the JSON body
#' @export

search_ga4gh <- function(object, ...) {
  UseMethod("search_ga4gh", object)
}


#' @rdname search_ga4gh
#' @method search_ga4gh ga4ghClient
#' @export

search_ga4gh.ga4ghClient <- function(object, operation, ...) {
  body <- check_body(object, operation, list(...))
  post_ga4gh(object, paste0("/", operation, "/search"), body)
}


#' @rdname search_ga4gh
#' @method search_ga4gh default
#' @export

search_ga4gh.default <- function(object, port = NULL, operation, ...) {
  client <- ga4gh_client(object, port, api_location = "")
  search_ga4gh(client, operation, ...)
}


#' @rdname search_ga4gh
#' @method search_ga4gh list
#' @export

search_ga4gh.list <- function(object, operation, ...) {
  lapply(object, function(client) search_ga4gh(client, operation = operation, ...))
}
