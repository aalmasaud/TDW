#filter
#
#

DFDT <- function(dataFile,...){
class(dataFile)
class(setDT(dataFile))
class(as.data.table(dataFile))
class(data.table(dataFile))
}

