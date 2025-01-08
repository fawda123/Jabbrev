
## Jabbrev

[![R-CMD-check](https://github.com/fawda123/Jabbrev/workflows/R-CMD-check/badge.svg)](https://github.com/fawda123/Jabbrev/actions)

This R package converts a journal name (or any text) to abbreviations
using the ISSN List of Title Word Abbreviations
([LTWA](https://www.issn.org/services/online-services/access-to-the-ltwa/),
available as a [csv
file](https://www.issn.org/wp-content/uploads/2024/02/ltwa_current.csv)).
Some journals insist that journal names in bibliographies are
abbreviated. This is dumb so here’s a package that does it for you.

``` r
install.packages('devtools')
library(devtools)
install_github('fawda123/Jabbrev')
library(Jabbrev)
```

One journal at a time:

``` r
abbrev('Journal of Applied Mathematics')
```

    ## [1] "J. Appl. Math."

Or convert a whole .bib file:

``` r
bib_shr('inst/refs.bib')
```

    ## 1 of 31 Fundamental and Applied Limnology - Fundam. Appl. Limnol. 
    ## 2 of 31 Aquatic Botany - Aquat. Bot. 
    ## 3 of 31 Limnology and Oceanography - Limnol. Oceanogr. 
    ## 4 of 31 Ecological Engineering - Ecol. Eng. 
    ## 5 of 31 Water Resources Research - Water Resour. Res. 
    ## 6 of 31 Statistics Surveys - Stat. Surv. 
    ## 7 of 31 Hydrological Processes - Hydrol. Process. 
    ## 8 of 31 Hydrobiologia - Hydrobiol. 
    ## 9 of 31 Journal of the North American Benthological Society - J. North Am. Benthol. Soc. 
    ## 10 of 31 Canadian Journal of Botany - Can. J. Bot. 
    ## 11 of 31 Aquatic Botany - Aquat. Bot. 
    ## 12 of 31 Limnology and Oceanography: Methods - Limnol. Oceanogr. Methods 
    ## 13 of 31 Water Resources Research - Water Resour. Res. 
    ## 14 of 31 Journal of the American Water Resources Association - J. Am. Water Resour. Assoc. 
    ## 15 of 31 The R Journal - R J. 
    ## 16 of 31 Limnology and Oceanography: Methods - Limnol. Oceanogr. Methods 
    ## 17 of 31 Environmental Modelling and Assessment - Environ. Model. Assess. 
    ## 18 of 31 Ecological Indicators - Ecol. Indic. 
    ## 19 of 31 Ecological Indicators - Ecol. Indic. 
    ## 20 of 31 Lake and Reservoir Managmenet - Lake Reserv. Manag. 
    ## 21 of 31 ISPRS Journal of Photogrammetry and Remote Sensing - ISPRS J. Photogramm. Remote. Sens. 
    ## 22 of 31 Aquatic Botany - Aquat. Bot. 
    ## 23 of 31 Ecological Indicators - Ecol. Indic. 
    ## 24 of 31 Environmental Reviews - Environ. Rev. 
    ## 25 of 31 Water Research - Water Res. 
    ## 26 of 31 Ecology - Ecol. 
    ## 27 of 31 Science - Sci. 
    ## 28 of 31 IEEE Transactions on Neuronal Networks - IEEE Trans. Neuronal Netw. 
    ## 29 of 31 Journal of Statistical Software - J. Stat. Softw. 
    ## 30 of 31 Water Research - Water Res. 
    ## 31 of 31 Science of the Total Environment - Sci. Total. Environ.
