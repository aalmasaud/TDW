#enrichTimeField
#
#

enrichTimeField <-function(dataFile,column,col,startDate,...) {
  c<-0
  tmp <- "00"
  tmp2 <- "00"
  #transform(dataFile,column=as.character(column))
  dataFile[, column] <- sapply(dataFile[, column],as.character)
  for(i in 1:nrow(dataFile)) {
#    print(i)
 #   print(tmp)
  #  print(tmp2)
    #print(dataFile[i,])
    tmp<-substr(dataFile[i, column],0,2)
    if (tmp<tmp2)
      if (c<23)
        c<-c+1
    else
      c<-0
    if (c<10)
      #        print(paste("0",c,":",dataFile[i, column], sep=""))
      dataFile[i, column] <- paste("0",c,":",dataFile[i, column], sep="")
    else
      #    print(paste(c,":",dataFile[i, column], sep=""))
      dataFile[i, column] <- paste(c,":",dataFile[i, column], sep="")
    tmp2<- tmp

    #      print(dataFile[i,])

  }



}
