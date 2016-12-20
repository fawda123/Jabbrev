#' Convert a character string to title case
#'
#' @param s chr string for title case
#' @param strict logical
#'
#' @return A chr string in title case
#' @export
#'
#' @details
#' This function is from the help file for \code{\link[base]{toupper}}
capwords <- function(s, strict = FALSE) {
    cap <- function(s) paste(toupper(substring(s, 1, 1)),
                  {s <- substring(s, 2); if(strict) tolower(s) else s},
                             sep = "", collapse = " " )
    sapply(strsplit(s, split = " "), cap, USE.NAMES = !is.null(names(s)))
}
