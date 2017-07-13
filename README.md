


## Jabbrev

#### *Marcus W. Beck, mbafs2012@gmail.com*

[![Travis-CI Build Status](https://travis-ci.org/fawda123/Jabbrev.svg?branch=master)](https://travis-ci.org/fawda123/Jabbrev)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/fawda123/Jabbrev?branch=master&svg=true)](https://ci.appveyor.com/project/fawda123/Jabbrev)

This R package converts a journal name (or any text) to abbreviations using the ISSN List of Title Word Abbreviations ([LTWA](http://www.issn.org/services/online-services/access-to-the-ltwa/>)).  Some journals insist that journal names in bibliographies are abbreviated.  This is dumb so here's a package that does it for you.  


```r
install.packages('devtools')
library(devtools)
install_github('fawda123/Jabbrev')
library(Jabbrev)
```

One journal at a time:


```r
abbrev('Journal of Applied Mathematics')
```

```
## [1] "J. Appl. Math."
```

Or convert a whole .bib file:

```r
bib_shr('inst/refs.bib')
```

```
## 1 of 30 Fundamental and Applied Limnology - Fundam. Appl. Limnol. 
## 2 of 30 Aquatic Botany - Aquat. Bot. 
## 3 of 30 Limnology and Oceanography - Limnol. Oceanogr. 
## 4 of 30 Ecological Engineering - Ecol. Eng. 
## 5 of 30 Water Resources Research - Water Resour. Res. 
## 6 of 30 Statistics Surveys - Stat. Surv. 
## 7 of 30 Hydrological Processes - Hydrol. Process. 
## 8 of 30 Hydrobiologia - Hydrobiol. 
## 9 of 30 Journal of the North American Benthological Society - J. North Am. Benthol. Soc. 
## 10 of 30 Canadian Journal of Botany - Can. J. Bot. 
## 11 of 30 Aquatic Botany - Aquat. Bot. 
## 12 of 30 Limnology and Oceanography: Methods - Limnol. Oceanogr. Methods 
## 13 of 30 Water Resources Research - Water Resour. Res. 
## 14 of 30 Journal of the American Water Resources Association - J. Am. Water Resour. Assoc. 
## 15 of 30 The R Journal - R J. 
## 16 of 30 Limnology and Oceanography: Methods - Limnol. Oceanogr. Methods 
## 17 of 30 Environmental Modelling and Assessment - Environ. Model. Assess. 
## 18 of 30 Ecological Indicators - Ecol. Indic. 
## 19 of 30 Ecological Indicators - Ecol. Indic. 
## 20 of 30 Lake and Reservoir Managmenet - Lake Reserv. Manag. 
## 21 of 30 ISPRS Journal of Photogrammetry and Remote Sensing - ISPRS J. Photogramm. Remote. Sens. 
## 22 of 30 Aquatic Botany - Aquat. Bot. 
## 23 of 30 Ecological Indicators - Ecol. Indic. 
## 24 of 30 Environmental Reviews - Environ. Rev. 
## 25 of 30 Water Research - Water Res. 
## 26 of 30 Ecology - Ecol. 
## 27 of 30 Science - Sci. 
## 28 of 30 IEEE Transactions on Neuronal Networks - IEEE Trans. Neuronal Netw. 
## 29 of 30 Water Research - Water Res. 
## 30 of 30 Science of the Total Environment - Sci. Total. Environ.
```
