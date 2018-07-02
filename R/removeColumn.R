#removeColumn
#
#
removeColumn<-function(dataFile,columns) {

  within(dataFile,rm(columns))
  return(dataFile)

}
