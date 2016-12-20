#' Get ISSN LTWA
#'
#' Get the ISSN List of Title Word Abbreviations
#'
#' @param url chr string of pdf to pars
#'
#' @importFrom pdftools pdf_text
#' @import dplyr
#'
#' @export
#'
#' @details
#' The LTWA pdf is parsed from the online URL
#'
#' @return
#' A three-column matrix with the word, abbreviation, and language
#'
#' @examples
#' get_abbrev()
get_abbrev <- function(url = 'http://www.issn.org/wp-content/uploads/2013/07/LTWA_20150724.pdf'){

  langs <- c("afr", "alb", "arm", "aze", "baq", "bel", "bos", "bre", "bul", "cat", "cor", "cos", "crp", "cze", "dan", "dut", "eng", "est", "fin", "fre", "gem", "geo", "ger", "ger", "glg", "grc", "gre", "gre", "hrv", "hun", "ice", "iku", "ind", "ita", "kaz", "kir", "kur", "lat", "lav", "lit", "ltz", "mac", "may", "mlt", "mol", "mon", "mul", "nor", "pol", "por", "pro", "roa", "rum", "rus", "sla", "slo", "slv", "spa", "srp", "swe", "tat", "tur", "ukr", "und", "uzb", "wel", "yid", "yor")

  raw <- pdf_text(url)

  # strsplit all
  conv <- paste(raw, collapse = '\\r') %>%
    strsplit(., '\\r') %>%
    .[[1]] %>%
    grep('LIST\\sOF\\sTITLE\\sWORD\\sABBREVIATIONS$|Page\\s[0-9]*$|LANGUAGES$', .,
        value = TRUE, invert = TRUE) %>%
    grep('^\\n$', ., value = TRUE, invert = TRUE) %>%
    gsub('^\\n', '', .) %>%
    strsplit(., '\\s\\s+')

  # each list element should have three values
  # some with two did not split correctly
  twos <- which(unlist(lapply(conv, length)) == 2)
  conv[twos] <- lapply(conv[twos], function(x){

    tmp <- strsplit(paste(x, collapse = ' '), '\\s')[[1]][-1]

    if(length(tmp) == 2) tmp <- c(tmp, 'n.a.')

    tmp

    })

  conv <- do.call('rbind', conv)

  return(conv)

# # fine all non-alphanumeric characters
# strsplit(conv, '') %>%
#   unlist %>%
#   grep('[^[:alnum:]]', ., value = T) %>%
#   unique

}




