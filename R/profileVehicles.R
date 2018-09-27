#profileVehicles
#
#
#

profileVehicles <-function(dataFile,...) {
  default_acc <-2.4
  default_deac <-4.5

  set.seed(25)
  rowCount <- nrow(dataFile)
  hourCurrent <- dataFile[1,"Hour"]
  #hourCurrent <- as.POSIXct( h1)
  hourEnd <- dataFile[rowCount,"Hour"]
  #hourEnd <- as.POSIXct( h2)
  hourComp <- hourCurrent - 3600
  #print(hourEnd)
  while (hourCurrent <= hourEnd) {
    if (as.character(hourCurrent,format = "%Y-%m-%d %H:%M:%S",usetz=FALSE) != as.character(hourComp,format = "%Y-%m-%d %H:%M:%S",usetz=FALSE)){
      Tt <- filter2(dataFile,paste0('Hour = ',as.numeric(hourCurrent),sep=""))
      weather <- Tt[1,"Condition"]
if (nrow(Tt) >= 3) {
    kmeans_ret <- kmeans(Tt$Speed__mph_,3,nstart=10)

    Tt$classes <- fitted(kmeans_ret,method = c("classes"))
    Tt$centers <- fitted(kmeans_ret,method = c("centers"))

    totalCount=nrow(Tt)
    r <-cbind(date=as.character(hourCurrent,format = "%Y-%m-%d",usetz=FALSE),time=as.character(hourCurrent,format = "%H:%M:%S",usetz=FALSE),do.call(data.frame, aggregate(cbind(Speed__mph_, Length__m_) ~ classes,data=Tt,FUN=function(x) c(avg = mean(x), count = length(x),max = ceiling(max(x)) )) ))
    r$distribution <- round(r$Speed__mph_.count/totalCount*100)
    r$Speed_factor <- r$Speed__mph_.avg/30.0
    mean <- r$Speed__mph_.avg
    result_mean <- c(0,0,0)
    for(i in 1:nrow(Tt)) {
      i <- Tt$classes
      result_mean[i] <- result_mean[i] + ((Tt$Speed__mph_ - mean[i])^2)
    }
    r$result_mean <- result_mean
    r$std_dev = sqrt(r$result_mean/r$Speed__mph_.count)
    r$factor_deviation = ((r$Speed__mph_.avg + r$std_dev) / 30.0) - r$Speed_factor
    if (weather == "Rain") {
      r$acc <- default_acc / 2
      r$deac <- default_deac / 2
    } else if (weather == "Hail") {
      r$acc <- default_acc / 6
      r$deac <- default_deac / 6
    } else if (weather == "Snow") {
      r$acc <- default_acc / 10
      r$deac <- default_deac / 10
    } else {
      r$acc <- default_acc
      r$deac <- default_deac
    }
    r$acc <- format(r$acc,digits = 1,nsmall=1)
    r$deac <- format(r$deac,digits = 1,nsmall=1)
    r$factor_deviation<-format(r$factor_deviation,digits=1,nsmall=2)
    r$Speed_factor<-format(r$Speed_factor,digits=1,nsmall=2)
    r$Speed__mph_.avg <- format(r$Speed__mph_.avg,digits = 1,nsmall=2)
    r$Speed__mph_.max <- format(r$Speed__mph_.max,digits = 1,nsmall=0)
    r$Length__m_.avg <- format(r$Length__m_.avg,digits = 1,nsmall=2)
    r$Speed__mph_.count <- format(r$Speed__mph_.count,digits = 1,nsmall=0)
    r$distribution <- format(r$distribution,digits = 1,nsmall=0)
    r$time <- as.character(r$time)
    r$date <- as.character(r$date)
    
    if (exists('vProfiles')) {
      vProfiles <- rbind(vProfiles,r)
    } else {
      vProfiles <- r
    }
    }
    }
    hourComp <- hourCurrent
    hourCurrent <- hourCurrent+3600
}
  return(vProfiles)
  }
