#filter
#
#

DFDT <- function(dataFile,...){
class(dataFile)
class(data.table::setDT(dataFile))
class(as.data.table(dataFile))
class(data.table(dataFile))
}

