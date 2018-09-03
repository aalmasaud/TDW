

roundToNearestHour <- function(dataFile,type,fromColumn,toColumn,...) {
  if (grepl("trunc$", tolower(type)))
    r2[,"toColumn"] <- substring(trunc(as.POSIXct(r2[,"fromColumn"],usetz = FALSE),"hour"),1,19)
  else if (grepl("round$", tolower(type)))
      r2[,"toColumn"] <- substring(round(as.POSIXct(r2[,"fromColumn"],usetz = FALSE),"hour"),1,19)
  else
    stop("type must be trunc or round!")
}
