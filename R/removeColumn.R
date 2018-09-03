#removeColumn
#
#
removeColumn<-function(dataFile,...) {

  df = dataFile[,!names(dataFile) %in% dput(as.character(...))]

}
