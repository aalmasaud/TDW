



findOutliers <- function(mydatafile,dataColumn,...) {
dataFile <- data.frame(mydatafile)
iqr1 <- aggregate(dataColumn ~ newTime + Lane,data=dataFile,FUN=function(x) quantile(x, probs = 0.25)-IQR(x)*2)
#iqr1 <- aggregate(dataFile[,dataColumn],by=list(newTime=dataFile$newTime,Lane=dataFile$Lane),FUN=function(x) quantile(x, probs = 0.25)-IQR(x)*2)
iqr3 <- aggregate(dataColumn ~ newTime + Lane,data=dataFile,FUN=function(x) quantile(x, probs = 0.75)+IQR(x)*2)
#iqr3 <- aggregate(dataFile[,dataColumn],by=list(newTime=dataFile$newTime,Lane=dataFile$Lane),FUN=function(x) quantile(x, probs = 0.75)+IQR(x)*2)
stats<-merge(iqr1,iqr3,by=c("newTime","Lane"))

new <- merge(dataFile,stats,by=c("newTime","Lane"))

names(new)<- gsub("\\.","_",names(new))

rOutliers <- filter2(new,paste(dataColumn," < x_x OR ",dataColumn," > x_y",sep=""))
rWithoutOutliers <- filter2(new,paste(dataColumn," > x_x AND ",dataColumn," < x_y",sep=""))

return(rWithoutOutliers)
}


