

library(rJava)
library(xlsxjars)
library(xlsx)
library(ggplot2)
library(reshape2)

datb <- read.xlsx("2017_power_prices.xlsx", sheetName="Sheet1")


boxplot(x = as.list((datb[,2:24]))) 


ggplot(stack(datb), aes(x = ind, y = values)) +
  geom_boxplot()




survey <- data.frame(datb$NA..1, datb$NA..2, datb$NA..3, datb$NA..4, datb$NA..5, datb$NA..6, datb$NA..7, datb$NA..8, datb$NA..9, datb$NA..10, 
  datb$NA..11, datb$NA..12, datb$NA..13, datb$NA..14, datb$NA..15, datb$NA..16, datb$NA..17, datb$NA..18, datb$NA..19, datb$NA..20) 



survey2 <- melt(datb, measure.vars = c("NA..11", "NA..12", "NA..13", "NA..14", "NA..15", "NA..16", "NA..17", "NA..18", "NA..19", "NA..20"))
survey3 <- melt(datb, measure.vars = c("NA..1", "NA..2", "NA..3", "NA..4", "NA..5", "NA..6", "NA..7", "NA..8", "NA..9", "NA..10"))
survey4 <- melt(datb, measure.vars = c("NA..1", "NA..2", "NA..3", "NA..4", "NA..5", "NA..6", "NA..7", "NA..8", "NA..9", "NA..10", "NA..11", 
                                       "NA..12", "NA..13", "NA..14", "NA..15", "NA..16", "NA..17", "NA..18", "NA..19", "NA..20"))

str(survey2)
str(survey3)

# Figure1
ggplot(survey2, aes(x=price..euro.mwh., y=value, color=variable)) + 
  geom_point() + geom_smooth() + facet_grid(~variable)

# Figure2
ggplot(survey2, aes(x=price..euro.mwh.,y=value, color=variable)) +
  geom_boxplot() + facet_grid(~variable)

# Figure3
ggplot(survey4, aes(x=price..euro.mwh.,y=value, color=variable)) 
+ geom_boxplot() + facet_grid(~variable)

# Figure4
ggplot(survey4, aes(x=price..euro.mwh.,y=value, color=variable)) 
+ geom_boxplot() + facet_grid(variable~.)