#plotData
#
#


plotData <- function(dataFile,col,...){
  c <- character(nrow(dataFile))

  for(i in 1:nrow(dataFile)) {
    tempStr <- dataFile[i,col]
    if(nchar(tempStr) < 1)
      c[i] <- "Normal"
    else
      c[i] <- tempStr
  }
  dataFile[col] <- c  
  avgSpeed <- aggregate(dataFile$Speed__mph_,by=list(Lane=dataFile$Lane,Hour=dataFile$Hour,Condition=dataFile$Condition),FUN=mean)
  require(ggplot2)
  t <- ggplot(avgSpeed, aes(factor(Hour), x, fill = Condition)) + 
    geom_bar(stat="identity", position = "dodge") + 
    scale_fill_brewer(palette = "Set1") + 
    theme(axis.text.x = element_text(angle = 90,hjust = 0)) + facet_grid(. ~ Lane) + 
    labs(title="Hourly Average Speed by Lane", x = "Hour" , y = "Average Speed")
  #install.packages("plotly")
  require(plotly)
  tt <- ggplotly(t)
  htmlwidgets::saveWidget(as_widget(tt), "visual.html", selfcontained = TRUE)
  
    
}
