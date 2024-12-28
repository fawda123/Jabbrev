# script to prepare abb dataset
get_abbrev_tsv <- function(url = 'https://www.issn.org/wp-content/uploads/2024/02/ltwa_current.csv'){
  raw <- read.csv(url, sep="\t")
  raw$ABBREVIATION[raw$ABBREVIATION==""] <- "n.a."
  as.matrix(raw)
}

abb <- get_abbrev_tsv()

# careful, this will overwrite your data!
usethis::use_data(abb, overwrite = TRUE)
usethis::use_data(abb, overwrite = TRUE, internal = TRUE)
