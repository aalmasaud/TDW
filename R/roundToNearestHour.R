

roundToNearestHour <- function(dataFile,type,fromColumn,...) {
  if (grepl("trunc$", tolower(type))){
    res <- trunc(as.POSIXct(strptime(dataFile[,fromColumn],"%Y-%m-%d %H:%M:%S"), units="hour"))
    dataFile$Hour <- res
    return(dataFile)
    }

  else if (grepl("round$", tolower(type))){
    res <- round(as.POSIXct(strptime(dataFile[,fromColumn],"%Y-%m-%d %H:%M:%S"), units="hour"))
    dataFile$Hour <- res
    return(dataFile)
  }

  else
    stop("type must be trunc or round!")
}
