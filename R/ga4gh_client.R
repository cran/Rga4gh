#' @title GA4GH Client
#' @name ga4gh_client
#' @description `ga4gh_client` creates an object with class ga4gh_client that you can use to call the
#'  API specified by the arguments in the function. This is so you can query an API multiple times without
#'  having to worry about where it is every time. You can also set some defaults for the client to determine
#'  how responses from the client typically behave. Creating these objects also makes it easier to query multiple
#'  servers with similar requests.
#' @param server The URL of the GA4GH server
#' @param port The port number the GA4GH server is running on
#' @param api_location A string to suffix to the server giving the location of the API on the server. By default this is "/ga4gh"
#'  i.e. the API is at http(s)://IP_ADDRESS/ga4gh
#' @param log_level The amount of debugging information to log
#' @param authentication_key The authentication key provided by the server after logging in
#' @param page_size The default number of results for the client to return for paged responses
#'
#' @return An object with class ga4ghClient
#'
#' @examples
#' ## Create a client for the reference server at http://1kgenomes.ga4gh.org
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' ## Use this client as the first argument in the high-level API functions
#'
#' ## Search for datasets in this server
#' library(magrittr)
#' datasets <- ref_client %>% search_datasets() %>% content()
#'
#' ## or specify the api location in the search function
#' search_datasets("http://1kgenomes.ga4gh.org")
#' }
#'
#' @export

ga4gh_client <- function(server, port = NULL, api_location = "/ga4gh", log_level = 0, authentication_key = "", page_size = 10) {
  api_url <- server
  if(!is.null(port)) {
    api_url <- paste0(api_url, ":", port)
  }
  api_url <- paste0(api_url, api_location)

  obj <- list(api_url = api_url, log_level = log_level, authentication_key = authentication_key, page_size = page_size)
  class(obj) <- "ga4ghClient"
  return(obj)
}
