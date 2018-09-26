p <- function(dataFile,...) {

  hourCurrent <- dataFile[1,"Hour"]
  #hourCurrent <- as.POSIXct( h1)
  hourEnd <- dataFile[nrow(dataFile),"Hour"]
  #hourEnd <- as.POSIXct( h2)
  hourComp <- hourCurrent - 3600
  #print(hourEnd)
  h <- dataFile[1,"Hour"]
  while (hourCurrent <= hourEnd) {
    if (as.character(hourCurrent,format = "%Y-%m-%d %H:%M:%S",usetz=FALSE) != as.character(hourComp,format = "%Y-%m-%d %H:%M:%S",usetz=FALSE)){
    Tt <- filter2(dataFile,paste0('Hour == ','"',as.character(hourCurrent,format = "%Y-%m-%d %H:%M:%S",usetz=FALSE),'"',sep=""))

      h<-rbind(h,Tt$Hour)
    }
    hourComp <- hourCurrent
    hourCurrent <- hourCurrent+3600
  }
  return(h)
}
