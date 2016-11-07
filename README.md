# Overview
This package allows users to easily call the GA4GH API from R.

The functions are typically split into get_\* and search_\*. The get_\* functions retrive an
object from the API with a specified ID and the search_* functions post JSON to the API and
retrieve the results.

# Usage
The `ga4gh_client` function should be used to create a client to interact with the API.

```{r}
client <- ga4gh_client("http://localhost", 9001)
```

This can then be used in the get and search functions. The `%>%` function from magrittr
can simulate to some degree the client having methods, each method being one of the get
or search functions.
At the moment these functions return `response` objects from the httr package. Use `content()`
to extract the content of the response as a list.

```{r}
client %>% get_dataset("id") %>% content()

## find all the datasets in the Server
d <- client %>% search_datasets() %>% content()

## find all the variant sets in a dataset
var_sets <- client %>% search_variant_sets(d$datasets[[1]]$id) %>% content

## find the first 100 variants from a variant set in chromosome 1
variants <- client %>% search_variants(var_sets$variantSets[[1]]$id, reference_name = "1", page_size = 100) %>% content
```

Further work could include a way to parse these into a data.frame or similar R object that is easier to work with.
For example:

```{r}

vars_to_df <- function(vars) {
  
  l <- lapply(vars, function(x) c(unlist(x["referenceName"])[[1]], unlist(x["names"])[[1]], unlist(x["start"])[[1]], unlist(x["end"])[[1]],
                                  unlist(x["referenceBases"])[[1]], unlist(x["alternateBases"])[[1]]))
  
  df <- do.call(rbind, l) %>% data.frame(stringsAsFactors = FALSE)
  names(df) <- c("reference_name", "id", "start", "end", "reference_bases", "alternate_bases")
  df$start <- as.numeric(df$start)
  df$end <- as.numeric(df$end)
  df
}

```

This will turn the content of a search_variants response into a data.frame containing some of the fields.
Ideally this should be more general. Work could be done to formalise each of the response objects returned from the various get and search functions.
These are detailed in the interactive documentation on the GA4GH reference server http://1kgenomes.ga4gh.org/static/index.html


