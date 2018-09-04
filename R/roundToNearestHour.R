

roundToNearestHour <- function(dataFile,type,fromColumn,toColumn,...) {
  if (grepl("trunc$", tolower(type)))
    dataFile[toColumn] <- substring(trunc(as.POSIXct(dataFile[,fromColumn],usetz = FALSE),"hour"),1,19)
  else if (grepl("round$", tolower(type)))
    dataFile[toColumn] <- substring(round(as.POSIXct(dataFile[,fromColumn],usetz = FALSE),"hour"),1,19)
  else
    stop("type must be trunc or round!")
}
