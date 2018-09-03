#removeColumn
#
#
removeColumn<-function(dataFile,...) {
  t <-jsonlite::fromJSON(...)
  df = dataFile[,!names(dataFile) %in% dput(as.character(t))]

}
