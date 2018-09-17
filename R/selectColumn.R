#selectColumn
#
#
selectColumn<-function(dataFile,...) {
t <-jsonlite::fromJSON(...)
  df = dataFile[dput(as.character(t))]

}
