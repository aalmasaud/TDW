#formatDateTimeISO
#
#

formatDateTimeISO <-function(dataFile,fromColumn,toColumn,...) {
  
  res <- substring(strptime(dataFile[,fromColumn],"%d.%m.%Y %H:%M"),1,19)
  dataFile[toColumn] <- res
}
