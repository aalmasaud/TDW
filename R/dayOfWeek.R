#dayOfWeek
#
#
#

dayOfWeek <- function(dataFile,dateColumn,newColumn,...) {
  dataFile[newColumn] <- weekdays(as.Date(substr(dataFile[dateColumn],1,10)))
}
