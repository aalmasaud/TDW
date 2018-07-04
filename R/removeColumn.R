#removeColumn
#
#
#removeColumn<-function(dataFile,...) {

# drop <- c(...)
# dataFile[,!names(dataFile) %in% drop]
  #return(drop)
#  return(dataFile)

}

#removeColumn
#
#
removeColumn<-function(dataFile,...) {
  x<-list(...)
 # print(...)
  for (i in 1:length(x)) {

    dataFile[,as.character(x[i])]<- NULL
  }
  return(dataFile)

}
