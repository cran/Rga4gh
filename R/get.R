#' @title GET a Bio Sample
#' @name get_bio_sample
#' @description GET a Bio Sample
#' @param client A ga4gh_client object
#' @param bio_sample_id The ID of the BioSample
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' bio_sample <- ref_client %>% get_bio_sample("id")
#' }
#'
#' @export

get_bio_sample <- function(client, bio_sample_id) {
  get_ga4gh(client, operation = "biosamples", bio_sample_id)
}



#' @title GET a Call Set
#' @name get_call_set
#' @description GET a Call Set
#' @param client A ga4gh_client object
#' @param call_set_id The ID of the Call Set
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' call_set <- ref_client %>% get_call_set("id")
#' }
#'
#' @export

get_call_set <- function(client, call_set_id) {
  get_ga4gh(client, operation = "callsets", call_set_id)
}


#' @title GET a Dataset
#' @name get_dataset
#' @description GET a Dataset
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' dataset <- ref_client %>% get_dataset("id")
#' }
#'
#' @export

get_dataset <- function(client, dataset_id) {
  get_ga4gh(client, operation = "datasets", dataset_id)
}



#' @title GET an Expression Level
#' @name get_expression_level
#' @description GET an Expression Level
#' @param client A ga4gh_client object
#' @param expression_level_id The ID of the Expression Level
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' exp_level <- ref_client %>% get_expression_level("id")
#' }
#'
#' @export

get_expression_level <- function(client, expression_level_id) {
  get_ga4gh(client, operation = "expressionlevels", expression_level_id)
}




#' @title GET a Feature
#' @name get_feature
#' @description GET a Feature
#' @param client A ga4gh_client object
#' @param feature_id The ID of the Feature
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' feature <- ref_client %>% get_feature("id")
#' }
#'
#' @export

get_feature <- function(client, feature_id) {
  get_ga4gh(client, operation = "features", feature_id)
}




#' @title GET a Feature Set
#' @name get_feature_set
#' @description GET a Feature Set
#' @param client A ga4gh_client object
#' @param feature_set_id The ID of the Feature Set
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' feature_set <- ref_client %>% get_feature_set("id")
#' }
#'
#' @export

get_feature_set <- function(client, feature_set_id) {
  get_ga4gh(client, operation = "featuresets", feature_set_id)
}



#' @title GET an Individual
#' @name get_individual
#' @description GET an Individual
#' @param client A ga4gh_client object
#' @param individual_id The ID of the Individual
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' individual <- ref_client %>% get_individual("id")
#' }
#'
#' @export

get_individual <- function(client, individual_id) {
  get_ga4gh(client, operation = "individuals", individual_id)
}




#' @title GET a Read Group
#' @name get_read_group
#' @description GET a Read Group
#' @param client A ga4gh_client object
#' @param read_group_id The ID of the Read Group
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' read_group <- ref_client %>% get_read_group("id")
#' }
#'
#' @export

get_read_group <- function(client, read_group_id) {
  get_ga4gh(client, operation = "readgroups", read_group_id)
}




#' @title GET a Read Group Set
#' @name get_read_group_set
#' @description GET a Read Group Set
#' @param client A ga4gh_client object
#' @param read_group_set_id The ID of the Read Group Set
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' read_group_set <- ref_client %>% get_read_group_set("id")
#' }
#'
#' @export

get_read_group_set <- function(client, read_group_set_id) {
  get_ga4gh(client, operation = "readgroupsets", read_group_set_id)
}



#' @title GET a Reference
#' @name get_reference_id
#' @description GET a Reference
#' @param client A ga4gh_client object
#' @param reference_id The ID of the Reference
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' reference <- ref_client %>% get_reference("id")
#' }
#'
#' @export

get_reference <- function(client, reference_id) {
  get_ga4gh(client, operation = "references", reference_id)
}



#' @title GET a Reference Set
#' @name get_reference_set
#' @description GET a Reference Set
#' @param client A ga4gh_client object
#' @param reference_set_id The ID of the Reference Set
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' reference_set <- ref_client %>% get_reference_set("id")
#' }
#'
#' @export

get_reference_set <- function(client, reference_set_id) {
  get_ga4gh(client, operation = "referencesets", reference_set_id)
}



#' @title GET an RNA Quantification
#' @name get_rna_quantification
#' @description GET an RNA Quantification
#' @param client A ga4gh_client object
#' @param rna_quantification_id The ID of the RNA Quantification
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' rna_quantification <- ref_client %>% get_rna_quantification("id")
#' }
#'
#' @export

get_rna_quantification <- function(client, rna_quantification_id) {
  get_ga4gh(client, operation = "rnaquantifications", rna_quantification_id)
}



#' @title GET an RNA Quantification Set
#' @name get_rna_quantification_set
#' @description GET an RNA Quantification Set
#' @param client A ga4gh_client object
#' @param rna_quantification_set_id The ID of the RNA Quantification Set
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' rna_quantification_set <- ref_client %>% get_rna_quantification_set("id")
#' }
#'
#' @export

get_rna_quantification_set <- function(client, rna_quantification_set_id) {
  get_ga4gh(client, operation = "rnaquantificationsets", rna_quantification_set_id)
}



#' @title GET a Variant
#' @name get_variant
#' @description GET a Variant
#' @param client A ga4gh_client object
#' @param variant_id The ID of the Variant
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' variant <- ref_client %>% get_variant("id")
#' }
#'
#' @export

get_variant <- function(client, variant_id) {
  get_ga4gh(client, operation = "variants", variant_id)
}



#' @title GET a Variant Set
#' @name get_variant_set
#' @description GET a Variant Set
#' @param client A ga4gh_client object
#' @param variant_set_id The ID of the Variant Set
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' variant_set <- ref_client %>% get_variant_set("id")
#' }
#'
#' @export

get_variant_set <- function(client, variant_set_id) {
  get_ga4gh(client, operation = "variantsets", variant_set_id)
}



#' @title GET a Variant Annotation Set
#' @name get_variant_annotation_set
#' @description GET a Variant Annotation Set
#' @param client A ga4gh_client object
#' @param variant_annotation_set_id The ID of the Variant Annotation Set
#'
#' @examples
#' ## Create a client
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#' \dontrun{
#' library(magrittr)
#' ## Retrieve the object with id 'id'
#' variant_annotation_set <- ref_client %>% get_variant_annotation_set("id")
#' }
#'
#' @export

get_variant_annotation_set <- function(client, variant_annotation_set_id) {
  get_ga4gh(client, operation = "variantannotationsets", variant_annotation_set_id)
}



