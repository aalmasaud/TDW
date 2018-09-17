#join : left join function using two different methods
#
#


join <- function(d,dataFile1,dataFile2,by1,by2,...){

  if (d=="d")
    dplyr::left_join(dataFile1,dataFile2,by=c(by1))
  else
      merge(dataFile1,dataFile2,by.x=by1,by.y=by2,all.x=TRUE)
}
