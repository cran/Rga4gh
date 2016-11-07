## set fields to NULL default if they are not requried by the operation
## however, some operations dont appear to apply the correct default.
## ie. some operations claim to search all datasets if no id supplied but
## they instead search for a dataset with id ''. This appears to also be
## the case if you call the API from the CLI and use {} as the body



#' @title Search for Variant Annotations
#' @name search_variant_annotations
#' @description Search for Variant Annotations
#' @param client A ga4gh_client object
#' @param variant_annotation_set_id The ID of the Variant Annoation Set to search within.
#' @param reference_id Only return variants with reference alleles on th reference with this ID.
#' One of this field or referenceName is required.
#' @param reference_name  Only return variants with reference alleles on the reference with this name.
#'  One of this field or referenceId is required.
#' @param start The beginning of the window (0-based, inclusive) for which variants
#'  with overlapping reference alleles should be returned.
#'  Genomic positions are non-negative integers less than reference length.
#'  Requests spanning the join of circular genomes are represented as two requests one on each
#'  side of the join (position 0).
#' @param end The end of the window (0-based, exclusive) for which variants with overlapping
#'  reference alleles should be returned.
#' @param effects A data.frame with columns id, sourceName, sourceVersion, term.
#'  This filter allows variant, transcript combinations to be extracted by
#'  effect type(s). Only return variant annotations
#'  including any of these effects and only return transcript effects
#'  including any of these effects. Exact matching across all fields of the
#'  Sequence Ontology OntologyTerm is required. (A transcript effect may have multiple SO
#'  effects which will all be reported.) If empty, return all variant annotations.
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find a variant set to search in
#' variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
#' vs_id <- variant_sets$variantSets[[2]]$id
#'
#' ## Find a variant annotation set to search in
#' variant_annotation_sets <- ref_client %>%
#'  search_variant_annotation_sets(vs_id) %>% content()
#' vas_id <- variant_annotation_sets$variantAnnotationSets[[1]]$id
#'
#' ## Search for variant annotations in the variant annotation set
#' variant_annotations <- ref_client %>%
#'  search_variant_annotations(vas_id, reference_name = "1") %>% content
#' variant_annotations$variantAnnotations[[1]]
#' }
#'
#' @export

search_variant_annotations <- function(client, variant_annotation_set_id, reference_id = NULL,
                                       reference_name = NULL, start = NULL, end = NULL, effects = NULL,
                                       page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "variantannotations", variantAnnotationSetId = variant_annotation_set_id, referenceId = reference_id,
         referenceName = reference_name, start = start, end = end, effects = effects,
         pageSize = page_size, pageToken = page_token)
}



#' @title Search for Variant Annotation Sets
#' @name search_variant_annotation_sets
#' @description Search for Variant Annotation Sets
#' @param client A ga4gh_client object
#' @param variant_set_id The ID of the Variant Set to Search
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find a variant set to search in
#' variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
#' vs_id <- variant_sets$variantSets[[2]]$id
#'
#' ## Search for variant annotation sets in the variant set
#' variant_annotation_sets <- ref_client %>%
#'  search_variant_annotation_sets(vs_id) %>% content()
#' variant_annotation_sets
#' }
#' @export

search_variant_annotation_sets <- function(client, variant_set_id, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "variantannotationsets", variantSetId = variant_set_id, pageSize = page_size, pageToken = page_token)
}



#' @title Search for Bio Samples
#' @name search_bio_samples
#' @description Search for Bio Samples
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset to search within
#' @param individual_id Return BioSamples for the provided Individual ID
#' @param name Return BioSamples with the given name found by case-sensitive string matching.
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Search for bio samples in the dataset
#' bio_samples <- ref_client %>% search_bio_samples(d_id) %>% content()
#' bio_samples
#'
#' }
#'
#' @export

search_bio_samples <- function(client, dataset_id, individual_id = NULL, name = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "biosamples", datasetId = dataset_id, individualId = individual_id, name = name,
         pageSize = page_size, pageToken = page_token)
}


#' @title Search for Individuals
#' @name search_individuals
#' @description Search for Individuals
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset to search within
#' @param name Return Individuals with the given name found by case-sensitive string matching.
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Search for individuals in the dataset
#' individuals <- ref_client %>% search_individuals(d_id) %>% content()
#' individuals
#'
#' }
#'
#' @export

search_individuals <- function(client, dataset_id = NULL, name = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "individuals", datasetId = dataset_id, name = name, pageSize = page_size, pageToken = page_token)
}


#' @title Search for Feature Phenotype Associations
#' @name search_feature_phenotype_associations
#' @description Search for Feature Phenotype Associations
#' @param client A ga4gh_client object
#' @param ... Other named arguments for the body of the POST request
#' @export

## no details on request type in API docs
search_feature_phenotype_associations <- function(client, ...) {
  search_ga4gh(client, operation = "featurephenotypeassociations", ...)
}


#' @title Search for Phenotype Association Sets
#' @name search_phenotype_association_sets
#' @description Search for Phenotype Association Sets
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset to search within
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Search for phenotype association sets in the dataset
#' phenotype_association_sets <- ref_client %>%
#'  search_phenotype_association_sets(d_id) %>% content()
#' phenotype_association_sets
#'
#' }
#'
#' @export

search_phenotype_association_sets <- function(client, dataset_id = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "phenotypeassociationsets", datasetId = dataset_id, pageSize = page_size, pageToken = page_token)
}


#' @title Search for Phenotypes
#' @name search_phenotypes
#' @description Search for Phenotypes
#' @param client A ga4gh_client object
#' @param phenotype_association_set_id The ID of Phenotype Association Set to search within
#' @param description String
#' @param id String
#' @param qualifiers A data.frame with columns id, sourceName, sourceVersion, term.
#' @param type A named list with names id, sourceName, sourceVersion, term. Only return results that match this type
#' @param age_of_onset A named list with names id, sourceName, sourceVersion, term.
#'  Only return results that match this age_of_onset
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find a phenotype association set to search in
#' phenotype_association_sets <- ref_client %>%
#'  search_phenotype_association_sets(d_id) %>% content()
#' pas_id <- phenotype_association_sets$phenotypeAssociationSets[[1]]$id
#'
#' ## Search for pheotypes in the phenotype association set
#' phenotypes <- ref_client %>% search_phenotypes(pas_id) %>% content()
#' phenotypes$phenotypes[[1]]
#'
#' }
#'
#' @export

search_phenotypes <- function(client, phenotype_association_set_id = NULL, description = NULL,
                              id = NULL, qualifiers = NULL, type = NULL, age_of_onset = NULL,
                              page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "phenotypes", phenotypeAssociationSetId = phenotype_association_set_id,
         description = description, id = id, qualifiers = qualifiers,
         type = type, ageOfOnset = age_of_onset, pageSize = page_size,
         pageToken = page_token)
}



#' @title Search for Datasets
#' @name search_datasets
#' @description Search for Datasets
#' @param client A ga4gh_client object
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' ## Use the client to search for datasets
#' library(magrittr)
#' datasets <- ref_client %>% search_datasets() %>% content()
#' datasets
#'
#' ## Or specify the API location within search_datasets
#' search_datasets("http://1kgenomes.ga4gh.org")
#'
#'
#' }
#'
#' @export

search_datasets <- function(client, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "datasets", pageSize = page_size, pageToken = page_token)
}


#' @title Search for Read Group Sets
#' @name search_read_group_sets
#' @description Search for Read Group Sets
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset to search within
#' @param bio_sample_id Specifying the id of a BioSample record will return only readgroups
#'  with the given bio_sample_id.
#' @param name Only return read group sets with this name (case-sensitive, exact match).
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Search for read group sets in the dataset
#' read_group_sets <- ref_client %>% search_read_group_sets(d_id) %>% content()
#' read_group_sets
#' }
#' @export

search_read_group_sets <- function(client, dataset_id = NULL, bio_sample_id = NULL,
                                   name = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "readgroupsets", datasetId = dataset_id, bioSampleId = bio_sample_id, name = name,
         pageSize = page_size, pageToken = page_token)
}


#' @title Search for Reads
#' @name search_reads
#' @description Search for Reads
#' @param client A ga4gh_client object
#' @param read_group_ids A list of Read Group IDs. The Read Groups to search. At least one id must be specified.
#' @param reference_id The reference to query. Leaving blank returns results
#'  from all references, including unmapped reads - this could be very large.
#' @param start The start position (0-based) of this query. If a reference is specified, this defaults to 0.
#'  Genomic positions are non-negative integers less than reference length. Requests spanning
#'   the join of circular genomes are represented as two requests one on each side of the join (position 0).
#' @param end The end position (0-based, exclusive) of this query. If a reference is specified,
#'  this defaults to the reference's length.
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find a read group to search in
#' read_group_sets <- ref_client %>% search_read_group_sets(d_id) %>% content()
#' rg_id <- read_group_sets$readGroupSets[[1]]$readGroups[[1]]$id
#'
#' ## Find a reference_id to map reads (unmapped reads not supported yet)
#' rs_id <- ref_client %>% search_reference_sets %>% content() %>%
#'  `$`("referenceSets") %>% `[[`(1) %>% `$`("id")
#' ref_id <- ref_client %>% search_references(rs_id) %>% content() %>%
#'  `$`("references") %>% `[[`(1) %>% `$`("id")
#'
#' ## Search for reads in the read group set
#' reads <- ref_client %>% search_reads(rg_id, reference_id = ref_id) %>% content()
#' reads
#'
#' }
#'
#' @export

search_reads <- function(client, read_group_ids, reference_id = NULL, start = NULL, end = NULL,
                         page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "reads", readGroupIds = list(read_group_ids), referenceId = reference_id, start = start,
         end = end, pageSize = page_size, pageToken = page_token)
}


#' @title Search for References
#' @name search_references
#' @description Search for References
#' @param client A ga4gh_client object
#' @param reference_set_id The ID of the Reference Set to search within
#' @param accession Return the References for which the accession matches this string (case-sensitive, exact match).
#' @param md5checksum Return the References for which the md5checksum matches this string (case-sensitive, exact match).
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a reference set to search in
#' reference_sets <- ref_client %>% search_reference_sets() %>% content()
#' rs_id <- reference_sets$referenceSets[[1]]$id
#'
#' ## Search for references in the reference set
#' references <- ref_client %>% search_references(rs_id) %>% content()
#' references
#' }
#' @export

search_references <- function(client, reference_set_id = NULL, accession = NULL,
                              md5checksum = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "references", referenceSetId = reference_set_id, accession = accession, md5checksum = md5checksum,
         pageSize = page_size, pageToken = page_token)
}



#' @title Search for Reference Bases
#' @name search_reference_bases
#' @description Search for Reference Bases
#' @param client A ga4gh_client object
#' @param reference_id The ID of the Reference to search within
#' @param start  The start position (0-based) of this query. Defaults to 0. Genomic positions
#'  are non-negative integers less than reference length. Requests spanning the join of circular
#'  genomes are represented as two requests one on each side of the join (position 0).
#' @param end The end position (0-based, exclusive) of this query. Defaults to the length of this Reference
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a reference set to search in
#' reference_sets <- ref_client %>% search_reference_sets() %>% content()
#' rs_id <- reference_sets$referenceSets[[1]]$id
#'
#' ## Find a reference to search in
#' references <- ref_client %>% search_references(rs_id) %>% content()
#' ref_id <- references$references[[1]]$id
#'
#' ## Find a string of bases from 10000 -> 11000
#' reference_bases <- ref_client %>%
#'  search_reference_bases(ref_id, start = 10000, end = 11000) %>% content()
#' reference_bases
#' }
#' @export

# No pageSize here ?
# this operation follows a different pattern
search_reference_bases <- function(client, reference_id = NULL, start = NULL, end = NULL, page_size = NULL, page_token = NULL) {
  body <- list(referenceId = reference_id, start = start, end = end, pageSize = page_size, pageToken = page_token)
  post_ga4gh(client, "/listreferencebases", body)
}



#' @title Search for Reference Sets
#' @name search_reference_sets
#' @description Search for Reference Sets
#' @param client A ga4gh_client object
#' @param assembly_id Return the Reference Sets for which the assembly_id matches this string (case-sensitive, exact match).
#' @param accession Return the Reference Sets for which the accession matches this string (case-sensitive, exact match).
#' @param md5checksum Return the Reference Sets for which the md5checksum matches this string (case-sensitive, exact match).
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Search for reference sets
#' reference_sets <- ref_client %>% search_reference_sets() %>% content()
#' reference_sets
#' }
#' @export

search_reference_sets <- function(client, assembly_id = NULL, accession = NULL, md5checksum = NULL,
                                  page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "referencesets", assemblyId = assembly_id, accession = accession, md5checksum = md5checksum,
         pageSize = page_size, pageToken = page_token)
}



#' @title Search for Expression Levels
#' @name search_expression_levels
#' @description Search for Expression Levels
#' @param client A ga4gh_client object
#' @param rna_quantification_id The ID of the RNA Quantification to search within
#' @param feature_ids A list of Feature IDs. Only return expressions with any of the specified feature_ids.
#' @param threshold Number
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#'
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find an rna quantification set to search in
#' rna_quantification_sets <- ref_client %>%
#'  search_rna_quantification_sets(d_id) %>% content()
#' rqs_id <- rna_quantification_sets$rnaQuantificationSets[[1]]$id
#'
#' ## Find an rna quantification to search in
#' rna_quantifications <- ref_client %>%
#'  search_rna_quantifications(rqs_id) %>% content()
#' rq_id <- rna_quantifications$rnaQuantifications[[1]]$id
#'
#' ## Search for expression levels in the rna quantification
#' expression_levels <- ref_client %>%
#'  search_expression_levels(rq_id) %>% content()
#' expression_levels
#'
#' }
#'
#' @export

search_expression_levels <- function(client, rna_quantification_id = NULL, feature_ids = NULL, threshold = NULL,
                                     page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "expressionlevels", featureIds = list(feature_ids), rnaQuantificationId = rna_quantification_id,
         threshold = threshold, pageSize = page_size, pageToken = page_token)
}



#' @title Search for RNA Quantifications
#' @name search_rna_quantifications
#' @description Search for RNA Quantifications
#' @param client A ga4gh_client object
#' @param rna_quantification_set_id The ID of the RNA Quantification Set to search within
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#'
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find an rna quantification set to search in
#' rna_quantification_sets <- ref_client %>%
#'  search_rna_quantification_sets(d_id) %>% content()
#' rqs_id <- rna_quantification_sets$rnaQuantificationSets[[1]]$id
#'
#' ## Search for rna quantifications in the rna quantification set
#' rna_quantifications <- ref_client %>%
#'  search_rna_quantifications(rqs_id) %>% content()
#' rna_quantifications
#' }
#'
#' @export

search_rna_quantifications <- function(client, rna_quantification_set_id, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "rnaquantifications", rnaQuantificationSetId = rna_quantification_set_id,
         pageSize = page_size, pageToken = page_token)
}



#' @title Search for RNA Quantification Sets
#' @name search_rna_quantification_sets
#' @description Search for RNA Quantification Sets
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset to search within
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#'
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Search for rna quantification sets in the dataset
#' rna_quantification_sets <- ref_client %>%
#'  search_rna_quantification_sets(d_id) %>% content()
#' rna_quantification_sets
#'
#' }
#'
#' @export

search_rna_quantification_sets <- function(client, dataset_id = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "rnaquantificationsets", datasetId = dataset_id, pageSize = page_size, pageToken = page_token)
}



#' @title Search for Features
#' @name search_features
#' @description Search for Features
#' @param client A ga4gh_client object
#' @param feature_set_id The ID of the Feature Set to search within. Either feature_set_id or parent_id must be non-null.
#' @param parent_id Restricts the search to direct children of the given parent feature ID.
#'  Either feature_set_id or parent_id must be non-null.
#' @param feature_types A list of feature types.  If specified, this query matches only annotations whose
#'  feature_type matches one of the provided ontology terms.
#' @param reference_name Only return features on the reference with this name
#' @param gene_symbol Only return features with matching the provided gene symbol (case-sensitive, exact match).
#' @param name Only returns features with this name (case-sensitive, exact match).
#' @param start The beginning of the window (0-based, inclusive) for which overlapping features should be returned.
#'  Genomic positions are non-negative integers less than reference length.
#' @param end The end of the window (0-based, exclusive) for which overlapping features should be returned.
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#'
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find a feature set to search in
#' feature_sets <- ref_client %>% search_feature_sets(d_id) %>% content()
#' fs_id <- feature_sets$featureSets[[1]]$id
#'
#' ## Search the for features in the feature set
#' features <- ref_client %>% search_features(fs_id) %>% content()
#' features$features[[1]]
#'
#' }
#'
#' @export

search_features <- function(client, feature_set_id = NULL, parent_id = NULL, feature_types = NULL, reference_name = NULL,
                            gene_symbol = NULL, name = NULL, start = NULL, end = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "features", featureSetId = feature_set_id, parentId = parent_id, featureTypes = list(feature_types),
         referenceName = reference_name, geneSymbol = gene_symbol, name = name, start = start, end = end,
         pageSize = page_size, pageToken = page_token)
}



#' @title Search for Feature Sets
#' @name search_feature_sets
#' @description Search for Feature Sets
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset to search within
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Search for feature sets in the dataset
#' feature_sets <- ref_client %>% search_feature_sets(d_id) %>% content()
#' feature_sets
#'
#' }
#'
#' @export

search_feature_sets <- function(client, dataset_id = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "featuresets", datasetId = dataset_id, pageSize = page_size, pageToken = page_token)
}



#' @title Search for Call Sets
#' @name search_call_sets
#' @description Search for Call Sets
#' @param client A ga4gh_client object
#' @param variant_set_id The ID of the Variant Set to search within
#' @param bio_sample_id Return only call sets generated from the provided BioSample ID.
#' @param name Only return call sets with this name (case-sensitive, exact match).
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find a variant set to search in
#' variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
#' vs_id <- variant_sets$variantSets[[1]]$id
#'
#' ## Search for call sets in the variant set
#' call_sets <- ref_client %>% search_call_sets(vs_id) %>% content()
#' call_sets
#'
#' }
#'
#' @export

search_call_sets <- function(client, variant_set_id = NULL, bio_sample_id = NULL, name = NULL,
                             page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "callsets", variantSetId = variant_set_id, bioSampleId = bio_sample_id, name = name,
         pageSize = page_size, pageToken = page_token)
}



#' @title Search for Variants
#' @name search_variants
#' @description Search for Variants
#' @param client A ga4gh_client object
#' @param variant_set_id The ID of the Variant Set to search within
#' @param call_set_ids A list of Call Set IDs. Only return variant calls which belong to call sets
#'  with these IDs. If unspecified, return all variants and no variant call objects.
#' @param reference_name  Only return variants on this reference.
#' @param start The beginning of the window (0-based, inclusive) for which overlapping variants should be returned.
#'  Genomic positions are non-negative integers less than reference length.
#' @param end The end of the window (0-based, exclusive) for which overlapping variants should be returned.
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Find a variant set to search in
#' variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
#' vs_id <- variant_sets$variantSets[[1]]$id
#'
#' ## Search for variants in the variant set
#' variants <- ref_client %>% search_variants(vs_id, reference_name = "1") %>%
#'  content()
#' variants$variants[[1]]
#' }
#'
#' @export

search_variants <- function(client, variant_set_id, call_set_ids = NULL, reference_name = NULL,
                            start = NULL, end = NULL, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "variants", variantSetId = variant_set_id, callSetIds = list(call_set_ids),
         referenceName = reference_name, start = start, end = end, pageSize = page_size,
         pageToken = page_token)
}



#' @title Search for Variant Sets
#' @name search_variant_sets
#' @description Search for Variant Sets
#' @param client A ga4gh_client object
#' @param dataset_id The ID of the Dataset to search within
#' @param page_size Specifies the maximum number of results to return in a single page.
#'  If unspecified, the client default will be used.
#' @param page_token The continuation token, which is used to page through
#'  large result sets. To get the next page of results, set this parameter to
#'  the value of nextPageToken from the previous response.
#'
#' @examples
#'
#' ref_client <- ga4gh_client("http://1kgenomes.ga4gh.org", api_location = "")
#'
#' \dontrun{
#' library(magrittr)
#' ## Find a dataset to search in
#' datasets <- ref_client %>% search_datasets() %>% content()
#' d_id <- datasets$datasets[[1]]$id
#'
#' ## Search for variantsets in the dataset
#' variant_sets <- ref_client %>% search_variant_sets(d_id) %>% content()
#' variant_sets
#'
#' }
#'
#' @export

search_variant_sets <- function(client, dataset_id, page_size = NULL, page_token = NULL) {
  search_ga4gh(client, operation = "variantsets", datasetId = dataset_id, pageSize = page_size, pageToken = page_token)
}


