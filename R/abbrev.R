#' Get the abbreviated journal title
#'
#' Get the abbreviated journal title
#'
#' @param title chr string of the journal name
#' @param rems chr string of prepositions or other words to remove from the journal title
#'
#' @return A chr string for the abbreviated journal title
#' @export
#'
#'
#' @examples
#' abbrev('Journal of Applied Mathematics')
#' abbrev('Fundamental and Applied Limnology')
#' abbrev('Science')
#' abbrev('Journal of the Royal Statistical Society: Series D (The Statistician)')
abbrev <- function(title, rems = c('and', 'in', 'of', 'on', '\\\\&', 'the')){
  title='Journal of the Royal Statistical Society: Series D (The Statistician)'
  rems = c('and', 'in', 'of', 'on', '\\\\&', 'the')
  # remove prepositions
  rems <- paste0('^', rems, '$', collapse = '|')
  splits <- strsplit(title, '\\s') %>%
    unlist %>%
    grep(rems, ., value = TRUE, invert = TRUE, ignore.case = TRUE)

  # check all as lower case
  abb[, 1] <- tolower(abb[, 1]) %>%
    gsub('-', '', .)

  # get abbreviations
  short <- sapply(splits, function(x){
    # keep only alphanumeric symbols
    x <- gsub("[^[:alnum:] ]", "", x)
    # check if full or partial match
    mtch <- grep(paste0('^', tolower(x), '$'), abb[, 1])
    if(length(mtch) == 0){
      mtch <- pmatch(abb[, 1], tolower(x), duplicates.ok = T)
      mtch <- which(!is.na(mtch))
    }

    # select
    if(length(mtch) == 0){
      mtch <- x
    } else {
      mtch <- abb[mtch, , drop = FALSE] %>%
        .[which.max(nchar(.[, 1])), 2]
    }
    if(mtch == 'n.a.') mtch <- x

    return(mtch)

    })

  # combine shorts in a single string, make title case
  short <- paste(short, collapse = ' ') %>%
    capwords

  return(short)

}



