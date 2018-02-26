#' Find bibtex tags in a document, scrape entires from external bib file, save new
#'
#' @param rmd_in chr string of path to Rmd file
#' @param ext_bib chr string of url for external bib file to scrap
#' @param bib_new path for output .bib file
#'
#' @details Currently only works for .Rmd files with the Rmarkdown format of bibtex tags, e.g., \code{[@Jones18]}.  The user must also check the external bib file to make sure all tags in the .Rmd file are present.
#'
#' @return A new bib file is saved, nothing is returned to the console
#'
#' @export
#'
#' @import dplyr
#'
#' @examples
#' \dontrun{
#' bib_scrp('document.Rmd', 'refs.bib')
#' }
bib_scrp <- function(rmd_in, bib_new = 'refs.bib', ext_bib = 'https://raw.githubusercontent.com/fawda123/refs/master/refs.bib'){

  # rmd tags
  tgs <- readLines(rmd_in) %>%
    .[grep("\\[@", .)] %>%
    regmatches(., gregexpr("@.*?[^a-zA-Z0-9]", .)) %>% # gregexpr gets starting index and length of all matches, regmatches returns text indexed by gregexpr
    unlist %>%
    gsub('[^a-zA-Z0-9]', '', .) %>%
    unique %>%
    sort

  # references to scrape
  refs <- readLines(ext_bib)

  # extract bib entries from bib_fl using keys from bbl_fl
  ext <- sapply(tgs, function(x){

    # start/stop indices
    str <- grep(paste0(x, ','), refs)
    stp <- grep('@', refs[str:length(refs)])[2]

    out <- try({refs[str:(str + stp - 2)] %>%
        .[. != '']
    })

    out

  }) %>%
  do.call('c', .)

  # save
  writeLines(ext, bib_new)

}
