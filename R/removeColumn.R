#removeColumn
#
#
removeColumn<-function(dataFile,...) {

  drop <- c(...)
  dataFile[,!(names(dataFile) %in% drop)]
  print(drop)
  return(dataFile)

}
