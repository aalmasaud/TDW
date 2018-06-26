# renameColumn
#
#


renameColumn <- function(df,old,new) {
  if (is.numeric(old))
    names(df)[old]<-new
  else
    colnames(df)[colnames(df)==old] <- new
}
