#removeColumn
#
#
removeColumn<-function(dataFile,...) {

  drop <- c(...)
  dataFile[,!(names(dataFile) %in% drop)]
  return(drop)
  dataFile

}
