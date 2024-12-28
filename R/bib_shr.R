#' Convert long journal names in a bib file to abbreviated
#'
#' @param bib_fl chr string of path to bib file
#' @param bib_new chr string of path for new bib file with abbreviated titles, appends '_new' to input file name if blank
#' @param trace logical to print progress to console
#'
#' @return A new bib file is saved, nothing is returned to the console
#'
#' @export
#'
#'
#' @examples
#' \dontrun{
#' bib_shr('inst/refs.bib')
#' }
bib_shr <- function(bib_fl, bib_new = NULL, trace = TRUE){

  # read bib file, fine lines with journal article names
  fl <- readLines(bib_fl)
  jent <- grep('journal=\\{[a-z,A-Z]', fl)

  # loop through journal names
  for(i in jent){

    # get the long name
    jnm_lng <- fl[i] %>%
      gsub('^.*\\{|\\}.*$', '', .)

    # get short name
    jnms_shr <- abbrev(jnm_lng)

    # print to console
    if(trace)
      cat(which(i == jent), 'of', length(jent), jnm_lng, '-', jnms_shr, '\n')

    # replace chr string in fl with short name
    fl[i] <- gsub('(^.*\\{).*(\\}.*)$', paste0('\\1', jnms_shr, '\\2'), fl[i])

    }

  # create output file name if not provided
  if(is.null(bib_new))
    bib_new <- gsub('\\.bib$', '', bib_fl) %>%
      paste0(., '_new.bib')

  # save output
  writeLines(fl, bib_new)

}



