

library(rJava)
library(xlsxjars)
library(xlsx)
library(ggplot2)
library(reshape2)

datb <- read.xlsx("2017_power_prices.xlsx", sheetName="Sheet1")


boxplot(x = as.list((datb[,2:24]))) 


ggplot(stack(datb), aes(x = ind, y = values)) +
  geom_boxplot()



survey <- data.frame(datb$NA..11, datb$NA..12, datb$NA..13, datb$NA..14, datb$NA..15, datb$NA..16, datb$NA..17, datb$NA..18, datb$NA..19, datb$NA..20) 


survey2 <- melt(datb, measure.vars = c("NA..11", "NA..12", "NA..13", "NA..14", "NA..15", "NA..16", "NA..17", "NA..18", "NA..19", "NA..20"))
survey3 <- melt(datb, measure.vars = c("NA..1", "NA..2", "NA..3", "NA..4", "NA..5", "NA..6", "NA..7", "NA..8", "NA..9", "NA..10"))

str(survey2)
str(survey3)

ggplot(survey2, aes(x=price..euro.mwh.,y=value, color=variable)) + geom_point() + geom_smooth() + facet_grid(~variable)

