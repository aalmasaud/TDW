#filter
#
#

DFDT <- function(dataFile,...){

  library(data.table)
class(dataFile)
class(data.table::setDT(dataFile))
class(as.data.table(dataFile))
class(data.table(dataFile))
}

