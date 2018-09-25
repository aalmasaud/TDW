p <- function(dataFile,...) {

  hourCurrent <- dataFile[1,"Hour"]
  #hourCurrent <- as.POSIXct( h1)
  hourEnd <- dataFile[nrow(dataFile),"Hour"]
  #hourEnd <- as.POSIXct( h2)
  hourComp <- hourCurrent - 3600
  #print(hourEnd)
  h <- as.data.frame(hourCurrent)
  while (hourCurrent <= hourEnd) {
    if (as.character(hourCurrent,format = "%Y-%m-%d %H:%M:%S",usetz=FALSE) != as.character(hourComp,format = "%Y-%m-%d %H:%M:%S",usetz=FALSE)){
      h<-rbind(h,as.data.frame(hourCurrent))
    }
    hourComp <- hourCurrent
    hourCurrent <- hourCurrent+3600
  }
  return(h)
}
