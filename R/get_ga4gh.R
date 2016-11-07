
#' @title GET an Object
#' @name get_ga4gh
#' @description GET an object from the GA4GH API
#' @param object An object to GET from. I.e. A ga4ghClient object, a url for the server or a list of either.
#' @param operation The name of the operation. Eg "datasets"
#' @param id The ID of the Object
#' @param port The port number
#' @param ... Arguments to pass to other methods
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#'
#' ## Use the client and get an object from the api
#' ref_client %>% get_ga4gh("datasets", "id")
#'
#' ## Or provide the API location as a string
#' get_ga4gh("http://1kgenomes.ga4gh.org", "datasets", "id")
#' }
#'
#' @importFrom httr GET
#' @export

get_ga4gh <- function(object, ...) {
  UseMethod("get_ga4gh", object)
}

#' @rdname get_ga4gh
#' @method get_ga4gh ga4ghClient
#' @export

get_ga4gh.ga4ghClient <- function(object, operation, id, ...) {
  url <- paste0(object$api_url, paste0("/", operation, "/"), id)
  if(object$log_level > 0) {
    print(paste("Retrieving", url))
  }
  GET(url)
}


#' @rdname get_ga4gh
#' @method get_ga4gh default
#' @export

get_ga4gh.default <- function(object, operation, id, port = NULL, ...) {
  client <- ga4gh_client(object, port, api_location = "")
  get_ga4gh(client, operation, id)
}


#' @rdname get_ga4gh
#' @method get_ga4gh list
#' @export

get_ga4gh.list <- function(object, operation, id, ...) {
  lapply(object, get_ga4gh, operation, id)
}
