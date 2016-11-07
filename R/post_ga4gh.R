#' @title POST to a GA4GH Server
#' @name post_ga4gh
#' @description Use this to POST a request to an operation.
#'  The operations should simply be specified as a path in the API i.e. "/datasets/search" to search datasets.
#'  The body can be json or an R list.
#'  Use the search_* functions for a simpler interface.
#' @param client A ga4gh_client object
#' @param operation The API operation to POST to as a string. Eg "/datasets/search"
#' @param body The body of the POST either as JSON or a list (which will be converted to json by httr)
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "", log_level = 1)
#'
#' ## A request body as a list
#' body_list <- list(pageSize = 2)
#'
#' \dontrun{
#' ## Post to the /datasets/search operation
#' datasets_list <- ref_client %>% post_ga4gh("/datasets/search", body_list) %>% content
#' datasets_list
#'
#' }
#'
#' @export
#' @importFrom httr POST content_type_json
#' @importFrom jsonlite toJSON

post_ga4gh <- function(client, operation, body) {
  url <- paste0(client$api_url, operation)
  ## Example of logging if client's log_level set
  if(client$log_level > 0) {
    print(paste("Sending", toJSON(body), "to", url))
  }
  POST(url, body = body, content_type_json(), encode = "json")
}
