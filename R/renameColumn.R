# renameColumn
#
#


renameColumn <- function(dataFile,old,new) {
 # print(old)
#  print(new)
  # print(df)
  if (is.numeric(old))
    names(dataFile)[old]<-new
  else
    colnames(dataFile)[colnames(dataFile)==old] <- new
 # print(df)
  dataFile
}
