#' Extract bib entries form a bib file that are in bbl
#'
#' @param bbl_fl chr string of bbl file with entries to extract
#' @param bib_fl chr string of bib file for all entries
#' @param bib_new chr string of path for new bib file with abbreviated titles, appends '_kp' to input file name if blank
#'
#' @return A new bib file is saved, nothing is returned to the console
#'
#' @export
#'
#' @import dplyr
#'
#' @details
#' This function assumes that the bib file with entries to extract based on keys in bbl includes extra entries not needed for a document.
#'
#' @examples
#' \dontrun{
#' bbl_ext('inst/manu.bbl', 'inst/refs_all.bib')
#' }
bbl_ext <- function(bbl_fl, bib_fl, bib_new = NULL){

  # keys from bbl_file
  keys <- readLines(bbl_fl) %>%
    grep(']\\{.*\\}$', ., value = T) %>%
    gsub('.*\\{(.*)\\}$', '\\1', .)

  # get bib entries from bib_fl
  fl <- readLines(bib_fl)

  # extract bib entries from bib_fl using keys from bbl_fl
  refs <- sapply(keys, function(x){

    # start/stop indices
    str <- grep(paste0(x, ','), fl)
    stp <- grep('@', fl[str:length(fl)])[2]

    out <- fl[str:(str + stp - 2)] %>%
      .[. != '']

    out

  }) %>%
  do.call('c', .)

  # create output file name if not provided
  if(is.null(bib_new))
    bib_new <- gsub('\\.bib$', '', bib_fl) %>%
      paste0(., '_kp.bib')

  # create output file name if not provided
  writeLines(refs, bib_new)

}
